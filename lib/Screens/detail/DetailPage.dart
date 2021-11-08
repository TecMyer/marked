// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marked/ApiHandler/ApiCall.dart';

import 'package:marked/Constants/MyConstants.dart';
import 'package:marked/Models/ArticleModel.dart';
import 'package:marked/Screens/detail/WebPage.dart';
import 'package:marked/Utils/HexColor.dart';

class DetailPage extends StatefulWidget {

  @override
  _DetailPageState createState() => new _DetailPageState();
}



class _DetailPageState extends State<DetailPage> {

  double height = MyConstants.height,
      width = MyConstants.width;

  CustomPopupMenu _selectedChoices ;
  DateTime currDate = DateTime.now();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<CustomPopupMenu> choices ;


  @override
  void initState() {
    super.initState();
    if(MyConstants.currentArticleData.userId==MyConstants.id){
      choices = [
        // CustomPopupMenu(title: 'Display settings', image: 'display'),
        CustomPopupMenu(title: 'Switch to web view', image: 'globe_m'),
        CustomPopupMenu(title: 'Refresh', image: 'refresh'),
        CustomPopupMenu(title: 'Favourite', image: 'star_m'),
        CustomPopupMenu(title: 'Add tags', image: 'tags'),
        CustomPopupMenu(title: 'Highlight', image: 'highlight'),
        CustomPopupMenu(title: 'Delete', image: 'delete'),
      ];
    }else{
      choices = [
        CustomPopupMenu(title: 'Switch to web view', image: 'globe_m'),
        CustomPopupMenu(title: 'Refresh', image: 'refresh'),
        CustomPopupMenu(title: 'Favourite', image: 'star_m'),
        CustomPopupMenu(title: 'Highlight', image: 'highlight'),
        // CustomPopupMenu(title: 'Report article problem', image: 'report'),
      ];
    }
  }

  void _select(CustomPopupMenu choice) {
    setState(() {
      _selectedChoices = choice;
      switch(_selectedChoices.title){
        // case "Display settings":
        //   break;
        case "Switch to web view":
          Navigator.push(context, MaterialPageRoute(builder: (context) => WebPage()),);
          break;
        case "Refresh":
          refreshThisPage();
          break;
        case "Favourite":
          addToFav();
          break;
        case "Add tags":
          addTagToThisArticle();
          break;
        case "Highlight":
          highlightThisArticle();
          break;
        case "Delete":
          deleteThisArticle();
          break;
        // case "Report article problem":
        //   break;
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()=> Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
        ),
        title: Text("Details",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  HexToColor(MyConstants.appbarClrs[0]),
                  HexToColor(MyConstants.appbarClrs[1])
                ]
            ),
          ),
        ),
        actions: [
          PopupMenuButton(
            icon:Icon(Icons.more_horiz,color: Colors.white,),
            onCanceled: () {
              print('You have not choose anything');
            },
            tooltip: 'This is tooltip',
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              return choices.map((CustomPopupMenu choice) {
                return PopupMenuItem(
                  value: choice,
                  child: Row(
                    children: <Widget>[
                      Image.asset('assets/'+choice.image+'.png',height: height/25,width: width/10,fit: BoxFit.contain,),
                      SizedBox(width: width/30,),
                      Text(choice.title)
                    ],
                  ),
                );
              }).toList();
            },
          ),
          // Icon(Icons.horizontal_rule_outlined,color: Colors.white,),
          SizedBox(width: width/30,)
        ],
      ),
      body: Stack(
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    HexToColor(MyConstants.appbarClrs[0]),
                    HexToColor(MyConstants.appbarClrs[1])
                  ]
              ),
            ),
          ),
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(width/12),
                  topLeft: Radius.circular(width/12),
                ),
            ),
            padding: EdgeInsets.symmetric(horizontal: width/20,vertical: height/30),
            child:SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(width/30)),
                      image: DecorationImage(
                          image: NetworkImage(MyConstants.currentArticleData.imageUrl),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(height: height/40,),
                  Text(MyConstants.currentArticleData.title,
                    style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500),
                    maxLines: 1,overflow: TextOverflow.ellipsis,),
                  SizedBox(height: height/40,),
                  Row(
                    children: [
                      SizedBox(width: 5,),
                      Image.asset('assets/globe.png',height: height/28,),
                      SizedBox(width: 5,),
                      Text(MyConstants.currentArticleData.websiteName,
                        style: TextStyle(color: Colors.black,fontSize: 11),
                        maxLines: 2,overflow: TextOverflow.ellipsis,),
                      Expanded(child: Container()),
                      SizedBox(width: 5,),
                      Image.asset('assets/clock.png',height: height/28,),
                      SizedBox(width: 5,),
                      Text(MyConstants.getDifference(currDate,MyConstants.currentArticleData.creationDate),
                        style: TextStyle(color: Colors.black,fontSize: 11),
                        maxLines: 2,overflow: TextOverflow.ellipsis,),
                    ],
                  ),
                  SizedBox(height: height/30,),
                  Text(MyConstants.currentArticleData.pageDescription,
                    style: TextStyle(color: HexToColor(MyConstants.greyClr)),
                  ),
                ],
              ),
            ),
          )
        ],
      ),

    );
  }


  void highlightThisArticle() async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      MyConstants.showLoadingBar(context);
      ApiCall.addThisArticle(MyConstants.currentArticleData.id).then((value) async {
        MyConstants.hideLoadingBar();
        if (value.statusCode==200) {
          if(json.decode(value.body)["success"]=="true"){
            setState(() {

            });
            _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(jsonDecode(value.body)['message'], style: TextStyle(color: Colors.white),), backgroundColor: HexToColor(MyConstants.blueClr)));
          }else {
            _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(jsonDecode(value.body)['message'], style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,));
          }
        } else {
          _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(jsonDecode(value.body)['message'], style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,));
        }
      }).catchError((onError) {

      });
    } else {
      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(MyConstants.noInternet, style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,));
    }
  }

  void deleteThisArticle() async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      MyConstants.showLoadingBar(context);
      ApiCall.deleteThisArticle(MyConstants.currentArticleData.id).then((value) async {
        MyConstants.hideLoadingBar();
        if (value.statusCode==200) {
          if(json.decode(value.body)["success"]=="true"){
            _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(jsonDecode(value.body)['message'], style: TextStyle(color: Colors.white),), backgroundColor: HexToColor(MyConstants.blueClr),));
            Future.delayed(Duration(seconds: 3),navigate);
          }else {
            _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(jsonDecode(value.body)['message'], style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,));
          }
        } else {
          _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(jsonDecode(value.body)['message'], style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,));
        }
      }).catchError((onError) {

      });
    } else {
      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(MyConstants.noInternet, style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,));
    }
  }

  void addTagToThisArticle()  async{
    MyConstants.isFromDrawer=false;
    Navigator.pushNamed(context, '/addTags');

    // var connectivityResult = await (Connectivity().checkConnectivity());
    // if (connectivityResult == ConnectivityResult.mobile ||
    //     connectivityResult == ConnectivityResult.wifi) {
    //   MyConstants.showLoadingBar(context);
    //   ApiCall.addTagsToThis(MyConstants.currentArticleData.id,"").then((value) async {
    //     MyConstants.hideLoadingBar();
    //     if (value.statusCode==200) {
    //       if(json.decode(value.body)["success"]=="true"){
    //         _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(jsonDecode(value.body)['message'], style: TextStyle(color: Colors.white),), backgroundColor: Colors.green,));
    //       }else {
    //         _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(jsonDecode(value.body)['message'], style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,));
    //       }
    //     } else {
    //       _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(jsonDecode(value.body)['message'], style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,));
    //     }
    //   }).catchError((onError) {
    //
    //   });
    // } else {
    //   _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(MyConstants.noInternet, style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,));
    // }
  }

  void refreshThisPage() async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      MyConstants.showLoadingBar(context);
      ApiCall.refreshItem(MyConstants.currentArticleData.id).then((value) async {
        MyConstants.hideLoadingBar();
        if (value.statusCode==200) {
          if(json.decode(value.body)["success"]=="true"){
            ArticleModel dataModel = ArticleModel.fromJson(json.decode(value.body));
            MyConstants.currentArticleData=dataModel.data[0];
            setState(() {

            });
            _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(jsonDecode(value.body)['message'], style: TextStyle(color: Colors.white),), backgroundColor: Colors.green,));
          }else {
            _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(jsonDecode(value.body)['message'], style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,));
          }
        } else {
          _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(jsonDecode(value.body)['message'], style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,));
        }
      }).catchError((onError) {

      });
    } else {
      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(MyConstants.noInternet, style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,));
    }
  }

  void addToFav() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      MyConstants.showLoadingBar(context);
      ApiCall.addInFavourite(MyConstants.currentArticleData.id).then((value) async {
        MyConstants.hideLoadingBar();
        if (value.statusCode==200) {
          if(json.decode(value.body)["success"]=="true"){
            _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(jsonDecode(value.body)['message'], style: TextStyle(color: Colors.white),), backgroundColor: Colors.green,));
          }else {
            _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(jsonDecode(value.body)['message'], style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,));
          }
        } else {
          _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(jsonDecode(value.body)['message'], style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,));
        }
      }).catchError((onError) {

      });
    } else {
      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(MyConstants.noInternet, style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,));
    }
  }

  navigate() {
    Navigator.pop(context);
  }
}
class CustomPopupMenu {
  CustomPopupMenu({this.title, this.image});
  String title;
  String image;
}
