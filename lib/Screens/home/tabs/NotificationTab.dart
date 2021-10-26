import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marked/ApiHandler/ApiCall.dart';

import 'package:marked/Constants/MyConstants.dart';
import 'package:marked/Models/NotificationModel.dart';
import 'package:marked/Utils/HexColor.dart';
import 'package:marked/drawer/Drawer.dart';

class NotificationTab extends StatefulWidget {

  @override
  _NotificationTabState createState() => new _NotificationTabState();
}

class _NotificationTabState extends State<NotificationTab>  with AutomaticKeepAliveClientMixin<NotificationTab> {

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  double height = MyConstants.height,
      width = MyConstants.width;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  NotificationModel notificationModel;


  @override
  void initState() {
    super.initState();
    getNotification();
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
        title: Text("Notifications",style: TextStyle(color: Colors.white),),
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
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/followPage'),
            child: Image.asset('assets/add_person.png'),
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
            child: notificationModel==null || notificationModel.data.length==0?
            Column(
              children: [
                SizedBox(width: width,height: height*0.15,),
                Container(
                    width: width*0.65,
                    child: Text('No activity yet',
                      style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,
                    )
                ),

                Container(
                    margin: EdgeInsets.only(top: height/50),
                    width: width*0.65,
                    child: Text('We\'ll you know when a friend shares an item or follows you.',
                      style: TextStyle(color: HexToColor(MyConstants.greyClr),fontSize: 12,fontWeight: FontWeight.w400),
                      maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,
                    )
                ),
                SizedBox(height: height/30,),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/followPage'),
                  child: Container(
                      decoration: BoxDecoration(
                          color: HexToColor(MyConstants.redClr),
                          borderRadius: BorderRadius.all(Radius.circular(width/10))
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Text('Find people to follow',
                        style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      )
                  ),
                ),
              ],
            ):
            ListView.builder(
                itemCount: notificationModel.data.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context,int index){
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(width/30),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 7,
                            child: Container(
                              child: Text(notificationModel.data[index].message),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(),
                          ),
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

  void getNotification() async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      ApiCall.getNotifications().then((value) async {
        if (value.statusCode==200) {
          if(json.decode(value.body)["success"]=="true"){
            notificationModel=NotificationModel.fromJson(json.decode(value.body));
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