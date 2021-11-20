import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:marked/Constants/MyConstants.dart';
// import 'package:marked/Screens/SearchScreens/SearchPage.dart';
import 'package:marked/Utils/HexColor.dart';
// import 'package:marked/drawer/Drawer.dart';

class HelpPage extends StatefulWidget {
  @override
  _HelpPageState createState() => new _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  double height = MyConstants.height, width = MyConstants.width;

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        title: Text(
          "Help",
          style: TextStyle(color: Colors.white),
        ),
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
                ]),
          ),
        ),
      ),
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
                    fit: BoxFit.fill, image: AssetImage('assets/gray_bg.png'))),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(width / 30))),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Get Started',
                            style: TextStyle(
                                color: HexToColor(MyConstants.greyClr),
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                          SizedBox(
                            height: height / 40,
                          ),
                          GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, '/howToSave'),
                            child: Row(
                              children: [
                                Text(
                                  'How to save',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                                Expanded(child: Container()),
                                Icon(Icons.arrow_forward_ios),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(width / 30))),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'How to',
                            style: TextStyle(
                                color: HexToColor(MyConstants.greyClr),
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                          SizedBox(
                            height: height / 40,
                          ),
                          GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, '/appBasics'),
                            child: Row(
                              children: [
                                Text(
                                  'App basics',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                                Expanded(child: Container()),
                                Icon(Icons.arrow_forward_ios),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height / 40,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(context, '/read'),
                            child: Row(
                              children: [
                                Text(
                                  'Read in App',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                                Expanded(child: Container()),
                                Icon(Icons.arrow_forward_ios),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height / 40,
                          ),
                          GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, '/sendToFriends'),
                            child: Row(
                              children: [
                                Text(
                                  'Send to friends',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                                Expanded(child: Container()),
                                Icon(Icons.arrow_forward_ios),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height / 40,
                          ),
                          GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, '/favouriteHelp'),
                            child: Row(
                              children: [
                                Text(
                                  'Favourite, Archive Bulk Edit',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                                Expanded(child: Container()),
                                Icon(Icons.arrow_forward_ios),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height / 40,
                          ),
                          GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, '/tagsHelp'),
                            child: Row(
                              children: [
                                Text(
                                  'Tags',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                                Expanded(child: Container()),
                                Icon(Icons.arrow_forward_ios),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height / 40,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(context, '/sync'),
                            child: Row(
                              children: [
                                Text(
                                  'Sync and Download',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                                Expanded(child: Container()),
                                Icon(Icons.arrow_forward_ios),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height / 40,
                          ),
                          GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, '/manageData'),
                            child: Row(
                              children: [
                                Text(
                                  'Manage your Data',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                                Expanded(child: Container()),
                                Icon(Icons.arrow_forward_ios),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(width / 30))),
                    child: Container(
                      // padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text(
                          //   'Talk to human',
                          //   style: TextStyle(
                          //       color: HexToColor(MyConstants.greyClr),
                          //       fontWeight: FontWeight.w600,
                          //       fontSize: 16),
                          // ),
                          // SizedBox(
                          //   height: height / 40,   
                          // ),
                          // GestureDetector(
                          //   onTap: () =>
                          //       Navigator.pushNamed(context, '/searchOnline'),
                          //   child: Row(
                          //     children: [
                          //       Text(
                          //         'Search online support',
                          //         style: TextStyle(
                          //             color: Colors.black87,
                          //             fontWeight: FontWeight.w600,
                          //             fontSize: 16),
                          //       ),
                          //       Expanded(child: Container()),
                          //       Icon(Icons.arrow_forward_ios),
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(height: height/40,),
                          // GestureDetector(
                          //   onTap: ()=>Navigator.pushNamed(context, '/emailUs'),
                          //   child: Row(
                          //     children: [
                          //       Text('Email us',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 16),),
                          //       Expanded(child: Container()),
                          //       Icon(Icons.arrow_forward_ios),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(width / 30))),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Developers',
                            style: TextStyle(
                                color: HexToColor(MyConstants.greyClr),
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                          SizedBox(
                            height: height / 40,
                          ),
                          GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, '/reverseAuth'),
                            child: Row(
                              children: [
                                Text(
                                  'Test reverse authentication',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                                Expanded(child: Container()),
                                Icon(Icons.arrow_forward_ios),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
