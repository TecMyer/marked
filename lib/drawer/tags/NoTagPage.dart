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

class NoTagPage extends StatefulWidget {

  @override
  _NoTagPageState createState() => new _NoTagPageState();
}

class _NoTagPageState extends State<NoTagPage> {

  double height = MyConstants.height,
      width = MyConstants.width;

  bool isArcCalled=false;
  bool isMLCalled=true;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  ArticleModel noTagModel;

  DateTime currDate = DateTime.now();


  @override
  void initState() {
    super.initState();
    getNonTaggedList();
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
              MyConstants.isFromHome=false;
              _scaffoldKey.currentState.openDrawer();
            },
            child: Image.asset('assets/menu.png',scale: 1.5,)
        ),
        title: Text("Not Tagged",style: TextStyle(color: Colors.white),),
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
              gradient: LinearGradient( begin: Alignment.topLeft,
                  end: Alignment.bottomRight,colors: [HexToColor(MyConstants.appbarClrs[0]),HexToColor(MyConstants.appbarClrs[1])]),
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
            child: Column(
              children: [
                // Container(
                //   // margin: EdgeInsets.symmetric(horizontal: width/25),
                //   height: height/15,
                //   width: width,
                //   child: Row(
                //     mainAxisSize: MainAxisSize.max,
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: <Widget>[
                //       Expanded(
                //         child: InkWell(
                //             onTap: _mlTap,
                //             child: Container(
                //
                //                 decoration: BoxDecoration(
                //                     border: Border(bottom: BorderSide(color: isMLCalled?HexToColor(MyConstants.redClr):Colors.transparent))
                //                 ),
                //                 padding: EdgeInsets.symmetric(vertical:height/50,),
                //                 child:
                //                 Text('My List',style: TextStyle(color: isMLCalled?HexToColor(MyConstants.redClr):HexToColor(MyConstants.greyClr),fontWeight: isMLCalled?FontWeight.w600:FontWeight.w400,fontSize: height/53),textAlign: TextAlign.center,))
                //         ),
                //       ),
                //       Expanded(
                //         child: GestureDetector(
                //             onTap: _arcTap,
                //             child: Container(
                //
                //                 decoration: BoxDecoration(
                //                     border: Border(bottom: BorderSide(color: isArcCalled?HexToColor(MyConstants.redClr):Colors.transparent))
                //                 ),
                //                 padding: EdgeInsets.symmetric(vertical:height/50,),
                //                 child:
                //                 Text('Archive',style: TextStyle(color: isArcCalled?HexToColor(MyConstants.redClr):HexToColor(MyConstants.greyClr),fontWeight: isArcCalled?FontWeight.w600:FontWeight.w400,fontSize: height/53),textAlign: TextAlign.center,)
                //             )
                //         ),
                //       ),
                //
                //     ],
                //   ),
                // ),
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
                      child:noTagModel==null || noTagModel.data.length==0?
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width: width*0.65,
                              child: Text('Archive Empty',
                                style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),
                                maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,
                              )
                          ),
                          SizedBox(height: height/30,),
                          Container(
                              width: width*0.65,
                              child: Text('The archive can be used to list items that you\'re finished with.',
                                style: TextStyle(color: HexToColor(MyConstants.greyClr),fontSize: 13,fontWeight: FontWeight.w500),
                                maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,
                              )
                          ),
                          SizedBox(height: height/30,),
                          Container(
                              width: width*0.65,
                              child: Text('To add items to your archive, tap the check mark button after opening an item.',
                                style: TextStyle(color: HexToColor(MyConstants.greyClr),fontSize: 13,fontWeight: FontWeight.w500),
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
                      )
                          :
                      GridView.builder(
                        itemCount: noTagModel.data.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:  2 ,
                            childAspectRatio: width/height/0.7
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return  Padding(
                            padding: EdgeInsets.all(3),
                            child: GestureDetector(
                              onTap: (){
                                MyConstants.currentArticleData=noTagModel.data[index];
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
                                                image: NetworkImage(noTagModel.data[index].imageUrl)
                                            )
                                        ),
                                      ),
                                      // Image.network(,height: height/8,width: width,fit: BoxFit.fill,),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child:Column(
                                          children: [
                                            Text(noTagModel.data[index].title,
                                              style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),
                                              maxLines: 2,overflow: TextOverflow.ellipsis,),
                                            SizedBox(height: 5,),
                                            Row(
                                              children: [
                                                Image.asset('assets/globe.png',height: height/35,),
                                                SizedBox(width: 5,),
                                                Text(noTagModel.data[index].websiteName,
                                                  style: TextStyle(color: Colors.black,fontSize: 10),
                                                  maxLines: 2,overflow: TextOverflow.ellipsis,),
                                              ],
                                            ),
                                            SizedBox(height: 5,),
                                            Row(
                                              children: [
                                                Image.asset('assets/clock.png',height: height/35,),
                                                SizedBox(width: 5,),
                                                Text(MyConstants.getDifference(currDate,noTagModel.data[index].creationDate),
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
          )
        ],
      ),
    );
  }

  // void _arcTap() {
  //   setState(() {
  //     isArcCalled=true;
  //     isMLCalled=false;
  //   });
  // }
  //
  // void _mlTap() {
  //   setState(() {
  //     isArcCalled=false;
  //     isMLCalled=true;
  //   });
  // }

  void getNonTaggedList() async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      MyConstants.showLoadingBar(context);
      ApiCall.getNonTagedDataList().then((value) async {
        MyConstants.hideLoadingBar();
        if (value.statusCode==200) {
          if(json.decode(value.body)["success"]=="true"){
            noTagModel = ArticleModel.fromJson(json.decode(value.body));
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