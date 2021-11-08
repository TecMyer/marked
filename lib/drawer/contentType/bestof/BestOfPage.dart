// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marked/ApiHandler/ApiCall.dart';

import 'package:marked/Constants/MyConstants.dart';
import 'package:marked/Models/ArticleModel.dart';
import 'package:marked/Screens/SearchScreens/SearchPage.dart';
import 'package:marked/Utils/HexColor.dart';
import 'package:marked/drawer/Drawer.dart';

class BestOfPage extends StatefulWidget {

  @override
  _BestOfPageState createState() => new _BestOfPageState();
}

class _BestOfPageState extends State<BestOfPage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  double height = MyConstants.height,
      width = MyConstants.width;

  ArticleModel bestModel;


  @override
  void initState() {
    super.initState();
    getBestOfList();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              MyConstants.isFromHome = false;
              _scaffoldKey.currentState.openDrawer();
            },
            child: Image.asset('assets/menu.png', scale: 1.5,)
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/star_fill.png', width: width * 0.07,
              color: Colors.white,
              fit: BoxFit.fill,),
            SizedBox(width: width * 0.03,),
            Text("Best Of", style: TextStyle(color: Colors.white),),
          ],
        ),
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
          IconButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage())),
              icon: Icon(Icons.search,color: Colors.white,)
          ),
          SizedBox(width: width / 30,)
        ],
      ),
      drawer: DrawerClass(),
      body: Stack(
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                HexToColor(MyConstants.appbarClrs[0]),
                HexToColor(MyConstants.appbarClrs[1])
              ]),
            ),
          ),
          Container(
            width: width,
            height: height,
            padding: EdgeInsets.symmetric(
                horizontal: width / 20, vertical: height / 30),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(width / 12),
                  topLeft: Radius.circular(width / 12),
                ),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/gray_bg.png')
                )
            ),
            child: 0 == 0 ?
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: width * 0.65,
                    child: Text('There are no Best posts in your list.',
                      style: TextStyle(color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    )
                ),
                SizedBox(height: height / 20,),
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
                          width: width * 0.3,
                          height: width * 0.3,
                        ),
                        SizedBox(height: 10,),
                        Container(
                          decoration: BoxDecoration(
                              color: HexToColor(MyConstants.upperGreyClr),
                              borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                          width: width * 0.27,
                          height: 10,
                        ),
                        SizedBox(height: 10,),
                        Container(
                          decoration: BoxDecoration(
                              color: HexToColor(MyConstants.lowerGreyClr),
                              borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                          width: width * 0.2,
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
                          width: width * 0.3,
                          height: width * 0.3,
                        ),
                        SizedBox(height: 10,),
                        Container(
                          decoration: BoxDecoration(
                              color: HexToColor(MyConstants.upperGreyClr),
                              borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                          width: width * 0.27,
                          height: 10,
                        ),
                        SizedBox(height: 10,),
                        Container(
                          decoration: BoxDecoration(
                              color: HexToColor(MyConstants.lowerGreyClr),
                              borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                          width: width * 0.2,
                          height: 5,
                        )
                      ],
                    ),
                  ],
                )
              ],
            )
                :
            GridView.builder(
              itemCount: 6,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: width / height / 0.7
              ),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.all(3),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/detail');
                    },
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(width / 50),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/card_img.png', height: height / 8,
                              width: width,
                              fit: BoxFit.fill,),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text('BMW new model awesome look is here',
                                    style: TextStyle(color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,),
                                  SizedBox(height: 5,),
                                  Row(
                                    children: [
                                      Image.asset('assets/globe.png',
                                        height: height / 35,),
                                      SizedBox(width: 5,),
                                      Text('New York magazine',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 10),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,),
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Row(
                                    children: [
                                      Image.asset('assets/clock.png',
                                        height: height / 35,),
                                      SizedBox(width: 5,),
                                      Text('40 Mins ago', style: TextStyle(
                                          color: Colors.black, fontSize: 10),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,),
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
        ],
      ),
    );
  }
  void getBestOfList() async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      MyConstants.showLoadingBar(context);
      ApiCall.getMyFavourites().then((value) async {
        MyConstants.hideLoadingBar();
        if (value.statusCode==200) {
          if(json.decode(value.body)["success"]=="true"){
            bestModel = ArticleModel.fromJson(json.decode(value.body));
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