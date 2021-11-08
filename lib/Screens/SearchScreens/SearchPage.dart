// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marked/ApiHandler/ApiCall.dart';

import 'package:marked/Constants/MyConstants.dart';
import 'package:marked/Models/ArticleModel.dart';
import 'package:marked/Utils/HexColor.dart';

class SearchPage extends StatefulWidget {

  @override
  _SearchPageState createState() => new _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  double height = MyConstants.height,
      width = MyConstants.width;

  bool isArcCalled = false;
  bool isMLCalled = true;
  bool isAllCalled=false;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  ArticleModel allDataModel;
  ArticleModel myListModel;
  ArticleModel archiveModel;


  ArticleModel dummyListModel=ArticleModel();

  List<ArticleDatum> filteredList;

  DateTime currDate = DateTime.now();

  TextEditingController searchController=TextEditingController();


  @override
  void initState() {
    super.initState();
    getMyList();
    getArchiveList();
    getAllData();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,

      body: SafeArea(
        child: Stack(
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
            Column(
              children: [
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(width: width/20,),
                    Container(
                      width: width*0.7,
                      height: height*0.05,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(23),
                      ),
                      // height: height*0.07,
                      child: Expanded(
                        child: TextField(
                          controller: searchController,
                          onChanged: (value)=> updateList(value),
                          decoration: InputDecoration(
                            hintText: 'Search',
                            prefixIcon: Icon(
                              Icons.search,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: width/30,),
                    GestureDetector(
                      onTap: ()=>Navigator.pop(context),
                      child: Text('Cancel',style: TextStyle(color: Colors.white),),
                    ),
                    SizedBox(width: width/30,)
                  ],
                ),
                SizedBox(height: 10,),
                Expanded(
                  child: Container(
                    width: width,
                    // height: height*0.86,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(width/12),
                        topLeft: Radius.circular(width/12),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          // margin: EdgeInsets.symmetric(horizontal: width/25),
                          height: height/15,
                          width: width,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: InkWell(
                                    onTap: _mlTap,
                                    child: Container(
                                        decoration: BoxDecoration(
                                            border: Border(bottom: BorderSide(color: isMLCalled?HexToColor(MyConstants.redClr):Colors.transparent))
                                        ),
                                        padding: EdgeInsets.symmetric(vertical:height/50,),
                                        child:
                                        Text('My List',style: TextStyle(color: isMLCalled?HexToColor(MyConstants.redClr):HexToColor(MyConstants.greyClr),fontWeight: isMLCalled?FontWeight.w600:FontWeight.w400,fontSize: height/53),textAlign: TextAlign.center,))
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                    onTap: _arcTap,
                                    child: Container(

                                        decoration: BoxDecoration(
                                            border: Border(bottom: BorderSide(color: isArcCalled?HexToColor(MyConstants.redClr):Colors.transparent))
                                        ),
                                        padding: EdgeInsets.symmetric(vertical:height/50,),
                                        child:
                                        Text('Archive',style: TextStyle(color: isArcCalled?HexToColor(MyConstants.redClr):HexToColor(MyConstants.greyClr),fontWeight: isArcCalled?FontWeight.w600:FontWeight.w400,fontSize: height/53),textAlign: TextAlign.center,)
                                    )
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                    onTap: _allTap,
                                    child: Container(
                                        decoration: BoxDecoration(
                                            border: Border(bottom: BorderSide(color: isAllCalled?HexToColor(MyConstants.redClr):Colors.transparent))
                                        ),
                                        padding: EdgeInsets.symmetric(vertical:height/50,),
                                        child:
                                        Text('All items',style: TextStyle(color: isAllCalled?HexToColor(MyConstants.redClr):HexToColor(MyConstants.greyClr),fontWeight: isAllCalled?FontWeight.w600:FontWeight.w400,fontSize: height/53),textAlign: TextAlign.center,)
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: HexToColor(MyConstants.lightGreyClr),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage('assets/gray_bg.png')
                                  )
                              ),
                              padding: EdgeInsets.symmetric(horizontal: width/20,vertical: height/30),
                              child:filteredList==null ||filteredList.length==0?
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      width: width*0.65,
                                      child: Text('No results found',
                                        style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),
                                        maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,
                                      )
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: height/50),
                                      width: width*0.65,
                                      child: Text('There were no items matched your search for sleep',
                                        style: TextStyle(color: HexToColor(MyConstants.greyClr),fontSize: 12,fontWeight: FontWeight.w400),
                                        maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,
                                      )
                                  ),
                                  SizedBox(height: height/5,),
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  //   children: [
                                  //
                                  //   ],
                                  // )
                                ],
                              )
                                  :
                              GridView.builder(
                                itemCount: filteredList.length,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:  2 ,
                                    childAspectRatio: width/height/0.7
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return  Padding(
                                    padding: EdgeInsets.all(3),
                                    child: GestureDetector(
                                      onTap: (){
                                        MyConstants.currentArticleData=filteredList[index];
                                        Navigator.pushNamed(context, '/detail');
                                      },
                                      child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(width/50),
                                          ),
                                          child:Column(
                                            children: [
                                              Container(
                                                height: height/8,width: width,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(width/50),
                                                      topRight: Radius.circular(width/50),
                                                    ),
                                                    image: DecorationImage(
                                                        fit: BoxFit.fill,
                                                        image: NetworkImage(filteredList[index].imageUrl)
                                                    )
                                                ),
                                              ),
                                              // Image.network(,height: height/8,width: width,fit: BoxFit.fill,),
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                child:Column(
                                                  children: [
                                                    Text(filteredList[index].title,
                                                      style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),
                                                      maxLines: 2,overflow: TextOverflow.ellipsis,),
                                                    SizedBox(height: 5,),
                                                    Row(
                                                      children: [
                                                        Image.asset('assets/globe.png',height: height/35,),
                                                        SizedBox(width: 5,),
                                                        Text(filteredList[index].websiteName,
                                                          style: TextStyle(color: Colors.black,fontSize: 10),
                                                          maxLines: 2,overflow: TextOverflow.ellipsis,),
                                                      ],
                                                    ),
                                                    SizedBox(height: 5,),
                                                    Row(
                                                      children: [
                                                        Image.asset('assets/clock.png',height: height/35,),
                                                        SizedBox(width: 5,),
                                                        Text(MyConstants.getDifference(currDate,filteredList[index].creationDate),
                                                          style: TextStyle(color: Colors.black,fontSize: 10),
                                                          maxLines: 2,overflow: TextOverflow.ellipsis,),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _arcTap() {
    updateList(searchController.text);
    setState(() {
      isArcCalled=true;
      isMLCalled=false;
      isAllCalled=false;
    });
  }

  void _mlTap() {
    dummyListModel=myListModel;
    updateList(searchController.text);
    setState(() {
      isArcCalled=false;
      isAllCalled=false;
      isMLCalled=true;
    });
  }

  void _allTap() {
    dummyListModel=allDataModel;
    updateList(searchController.text);
    setState(() {
      isArcCalled=false;
      isMLCalled=false;
      isAllCalled=true;
    });
  }

  updateList(String value) {
    filteredList= List<ArticleDatum>();
    if(value.isEmpty){
      setState(() {
        filteredList.addAll(dummyListModel.data);
      });
    }else{
      List<ArticleDatum> dummyListData = List<ArticleDatum>();
      String s;
      if(value.length>1){
        s = '${value[0].toUpperCase()}${value.substring(1)}';
      }else{
        s = '${value[0].toUpperCase()}';
      }
      filteredList.forEach((item) {
        if(item.title.startsWith(s)||item.title.contains(s)||item.title.contains(s.toUpperCase())||item.title.contains(s.toLowerCase())
            ||item.title.contains(value) || item.title.contains(value.toUpperCase()) || item.title.contains(value.toLowerCase())
            || item.title.startsWith(value) || item.title.startsWith(value.toUpperCase()) || item.title.startsWith(value.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        filteredList.addAll(dummyListData);
      });
    }


  }

  void getAllData() async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      ApiCall.getAllData().then((value) async {
        if (value.statusCode==200) {
          if(json.decode(value.body)["success"]=="true"){
            allDataModel = ArticleModel.fromJson(json.decode(value.body));
            setState(() {

            });
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

  void getArchiveList() async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      ApiCall.getArchiveDataList().then((value) async {
        if (value.statusCode==200) {
          if(json.decode(value.body)["success"]=="true"){
            archiveModel = ArticleModel.fromJson(json.decode(value.body));
            setState(() {

            });
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

  void getMyList() async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      ApiCall.getMyList().then((value) async {
        if (value.statusCode==200) {
          if(json.decode(value.body)["success"]=="true"){
            myListModel = ArticleModel.fromJson(json.decode(value.body));
            dummyListModel=myListModel;
            updateList(searchController.text);
            setState(() {

            });
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

}