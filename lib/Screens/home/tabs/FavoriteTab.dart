
import 'dart:convert';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:documents_picker/documents_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:marked/ApiHandler/ApiCall.dart';

import 'package:marked/Constants/MyConstants.dart';
import 'package:marked/Models/ArticleModel.dart';
import 'package:marked/Preferences/MySharedPreference.dart';
import 'package:marked/Screens/detail/DetailPage.dart';
import 'package:marked/Utils/HexColor.dart';
import 'package:marked/drawer/Drawer.dart';

class FavouriteTab extends StatefulWidget {

  @override
  _FavouriteTabState createState() => new _FavouriteTabState();
}

class _FavouriteTabState extends State<FavouriteTab> with AutomaticKeepAliveClientMixin<FavouriteTab> {
  ArticleModel allDataModel;

  DateTime currDate=DateTime.now();


  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;


  double height = MyConstants.height,
      width = MyConstants.width;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool isInterNet=true;

  CustomPopupMenu _selectedChoices ;
  List<ArticleDatum> savedList=List<ArticleDatum>();

  static List<bool> list=List();

  List<CustomPopupMenu> choices = [
    CustomPopupMenu(title: 'Share', image: 'share_black'),
    CustomPopupMenu(title: 'Copy', image: 'copy'),
  ];

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Example share',
        text: 'Example share text',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Marked'
    );
  }

  Future<void> shareFile() async {
    List<dynamic> docs = await DocumentsPicker.pickDocuments;
    if (docs == null || docs.isEmpty) return null;

    await FlutterShare.shareFile(
      title: 'Example share',
      text: 'Example share text',
      filePath: docs[0] as String,
    );
  }


  void _select(CustomPopupMenu choice) {
    setState(() {
      _selectedChoices = choice;
      if( _selectedChoices.title=='Share'){
        share();
        Navigator.pushNamed(context, '/share');
      }
      if( _selectedChoices.title=='Copy'){
        _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Post Copied to Clipboard',style: TextStyle(color: Colors.white),),backgroundColor: Colors.green,));
        Navigator.pushNamed(context, '/recommend');
      }
    });
  }


  @override
  void initState() {
    super.initState();
    getAllData();
    getSavedList();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              MyConstants.isFromHome=true;
              _scaffoldKey.currentState.openDrawer();
            },
            child: Image.asset('assets/menu.png',scale: 1.5,)
        ),
        title: Text("Favourites",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        elevation: 0,

        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [HexToColor(MyConstants.appbarClrs[0]),HexToColor(MyConstants.appbarClrs[1])]),
          ),
        ),
        actions: [
          Image.asset('assets/add_person.png',),
          SizedBox(width: width/30,)
        ],
      ),
      drawer: DrawerClass(),
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
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/gray_bg.png')
                )
            ),
            padding: EdgeInsets.symmetric(horizontal: width/20,vertical: height/30),
            child:
            isInterNet?
            allDataModel==null || allDataModel.data.length==0?
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: width*0.65,
                    child: Text('There is no data in this list.',
                      style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),
                      maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,
                    )
                ),
                SizedBox(height: height/20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: HexToColor(MyConstants.upperGreyClr),
                              borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                          width: width*0.3,
                          height: width*0.3,
                        ),
                        SizedBox(height: 10,),
                        Container(
                          decoration: BoxDecoration(
                              color: HexToColor(MyConstants.upperGreyClr),
                              borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                          width: width*0.27,
                          height: 10,
                        ),
                        SizedBox(height: 10,),
                        Container(
                          decoration: BoxDecoration(
                              color: HexToColor(MyConstants.lowerGreyClr),
                              borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                          width: width*0.2,
                          height: 5,
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: HexToColor(MyConstants.upperGreyClr),
                              borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                          width: width*0.3,
                          height: width*0.3,
                        ),
                        SizedBox(height: 10,),
                        Container(
                          decoration: BoxDecoration(
                              color: HexToColor(MyConstants.upperGreyClr),
                              borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                          width: width*0.27,
                          height: 10,
                        ),
                        SizedBox(height: 10,),
                        Container(
                          decoration: BoxDecoration(
                              color: HexToColor(MyConstants.lowerGreyClr),
                              borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                          width: width*0.2,
                          height: 5,
                        )
                      ],
                    ),
                  ],
                )
              ],
            ):
            ListView.builder(
                itemCount: allDataModel.data.length,
                itemBuilder: (BuildContext context,int index){

                  if(savedList.contains(allDataModel.data[index].id)){
                    list[index]=true;
                  }

                  return GestureDetector(
                    onTap: (){
                      MyConstants.currentArticleData=allDataModel.data[index];
                      Navigator.pushNamed(context, '/detail');
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(width/15))
                      ),
                      child: Column(
                        children: [
                          Container(
                        height: height/6,width: width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(width/20),
                                  topRight: Radius.circular(width/20),
                                ),
                              image: DecorationImage(
                                fit: BoxFit.fitWidth,
                                image: NetworkImage(allDataModel.data[index].imageUrl)
                              )
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(15),
                            child:Column(
                              children: [
                                Text(allDataModel.data[index].title,
                                  style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.w600),
                                  maxLines: 1,overflow: TextOverflow.ellipsis,),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Image.asset('assets/globe.png',height: height/30,),
                                    SizedBox(width: 5,),
                                    Text(allDataModel.data[index].websiteName,
                                      style: TextStyle(color: Colors.black,fontSize: 10),maxLines: 2,overflow: TextOverflow.ellipsis,),
                                    Expanded(child: Container()),
                                    SizedBox(width: 5,),
                                    Image.asset('assets/clock.png',height: height/30,),
                                    SizedBox(width: 5,),
                                    Text(MyConstants.getDifference(currDate, allDataModel.data[index].creationDate),
                                      style: TextStyle(color: Colors.black,fontSize: 10),maxLines: 2,overflow: TextOverflow.ellipsis,),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Text(allDataModel.data[index].pageDescription,
                                  style: TextStyle(color: HexToColor(MyConstants.greyClr)),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            decoration: BoxDecoration(
                              color: HexToColor(MyConstants.lightGreyClr),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(width/20),
                                bottomRight: Radius.circular(width/20),
                              )
                            ),

                            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 1),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: ()async{
                                    if(list[index]==false){
                                      await MySharedPreferennce().setSavedList(allDataModel.data[index]);
                                    }else{
                                      await MySharedPreferennce().deleteSavedList(allDataModel.data[index]);
                                    }
                                    list = new List<bool>.filled(allDataModel.data.length, false, growable: true);
                                    getSavedList();
                                  },
                                  child: Container(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        list[index]?Image.asset('assets/saved.png',color: HexToColor(MyConstants.blueClr)):Image.asset('assets/saved.png',),
                                        SizedBox(width: 10,),
                                        Text('Saved',style: TextStyle(color: HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w600,fontSize: 16),),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(child: Container()),
                                PopupMenuButton(
                                  icon:Icon(Icons.more_horiz,color: HexToColor(MyConstants.greyClr),),
                                  onCanceled: () {
                                    print('You have not chosed anything');
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
                                // Icon(Icons.more_horiz,color:HexToColor(MyConstants.greyClr) ,),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
            ):
            ListView.builder(
                itemCount: savedList.length,
                itemBuilder: (BuildContext context,int index){

                  return GestureDetector(
                    onTap: (){
                      MyConstants.currentArticleData=savedList[index];
                      Navigator.pushNamed(context, '/detail');
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(width/15))
                      ),
                      child: Column(
                        children: [
                          Container(
                        height: height/6,width: width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(width/20),
                                  topRight: Radius.circular(width/20),
                                ),
                              image: DecorationImage(
                                fit: BoxFit.fitWidth,
                                image: NetworkImage(savedList[index].imageUrl)
                              )
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(15),
                            child:Column(
                              children: [
                                Text(savedList[index].title,
                                  style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.w600),
                                  maxLines: 1,overflow: TextOverflow.ellipsis,),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Image.asset('assets/globe.png',height: height/30,),
                                    SizedBox(width: 5,),
                                    Text(savedList[index].websiteName,
                                      style: TextStyle(color: Colors.black,fontSize: 10),maxLines: 2,overflow: TextOverflow.ellipsis,),
                                    Expanded(child: Container()),
                                    SizedBox(width: 5,),
                                    Image.asset('assets/clock.png',height: height/30,),
                                    SizedBox(width: 5,),
                                    Text(MyConstants.getDifference(currDate, savedList[index].creationDate),
                                      style: TextStyle(color: Colors.black,fontSize: 10),maxLines: 2,overflow: TextOverflow.ellipsis,),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Text(savedList[index].pageDescription,
                                  style: TextStyle(color: HexToColor(MyConstants.greyClr)),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            decoration: BoxDecoration(
                              color: HexToColor(MyConstants.lightGreyClr),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(width/20),
                                bottomRight: Radius.circular(width/20),
                              )
                            ),

                            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 1),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: ()async{
                                    await MySharedPreferennce().deleteSavedList(savedList[index]);
                                    savedList.removeAt(index);
                                    setState(() {

                                    });
                                  },
                                  child: Container(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset('assets/saved.png',color: HexToColor(MyConstants.blueClr)),
                                        SizedBox(width: 10,),
                                        Text('Saved',style: TextStyle(color: HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w600,fontSize: 16),),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(child: Container()),
                                PopupMenuButton(
                                  icon:Icon(Icons.more_horiz,color: HexToColor(MyConstants.greyClr),),
                                  onCanceled: () {
                                    print('You have not chosed anything');
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
                                // Icon(Icons.more_horiz,color:HexToColor(MyConstants.greyClr) ,),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
            ),
          )
        ],
      ),
    );
  }

  void getAllData() async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      ApiCall.getMyList().then((value) async {
        if (value.statusCode==200) {
          if(json.decode(value.body)["success"]=="true"){
            allDataModel = ArticleModel.fromJson(json.decode(value.body));
            list = new List<bool>.filled(allDataModel.data.length, false, growable: true);
            setState(() {

            });
          }else {
            getFavouriteList();
            _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(jsonDecode(value.body)['message'], style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,));
          }
        } else {
          _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(jsonDecode(value.body)['message'], style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,));
        }
      }).catchError((onError) {

      });
    } else {
      isInterNet=false;
      setState(() {

      });
      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(MyConstants.noInternet, style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,));
    }
  }

  void getFavouriteList() async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      ApiCall.getMyFavourites().then((value) async {
        if (value.statusCode==200) {
          if(json.decode(value.body)["success"]=="true"){
            allDataModel = ArticleModel.fromJson(json.decode(value.body));
            list = new List<bool>.filled(allDataModel.data.length, false, growable: true);
            setState(() {

            });
          }else {
          }
        } else {
          _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(jsonDecode(value.body)['message'], style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,));
        }
      }).catchError((onError) {

      });
    } else {
      isInterNet=false;
      setState(() {

      });
      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(MyConstants.noInternet, style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,));
    }
  }

  void getSavedList() async{
    savedList= await MySharedPreferennce().getSavedList();
    setState(() {

    });
  }



}