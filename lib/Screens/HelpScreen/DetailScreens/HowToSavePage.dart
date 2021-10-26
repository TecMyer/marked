import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:marked/Constants/MyConstants.dart';
import 'package:marked/Utils/HexColor.dart';

class HowToSavePage extends StatefulWidget {

  @override
  _HowToSavePageState createState() => new _HowToSavePageState();
}

class _HowToSavePageState extends State<HowToSavePage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  double height = MyConstants.height,
      width = MyConstants.width;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios,color: Colors.white,)
        ),
        title:Text("How to Save", style: TextStyle(color: Colors.white),),

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
            padding: EdgeInsets.symmetric(horizontal: width / 20, vertical: height / 30),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(width / 12),
                  topLeft: Radius.circular(width / 12),
                ),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/gray_bg.png')
                ),
            ),
            child:ListView.builder(
                itemCount: 6,
                shrinkWrap: true,
                itemBuilder: (BuildContext context,int index){
                  return index==0?
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: width/30,right: width/30,top: height/40),
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('From your apps',style: TextStyle(color: HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w600,fontSize: 16),),
                                  SizedBox(height: height/40,),
                                  Text('Enable the Marked share extension to save from Safari, or any of your favorite apps like Twitter and Flipboard.',
                                    style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(height: height/40,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                              color: HexToColor(MyConstants.redClr),
                                              borderRadius: BorderRadius.all(Radius.circular(width/10))
                                          ),
                                          padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                                          child: Text('Enable',
                                            style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.center,
                                          )
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: height/40,),
                                ],
                              )
                          ),
                          Expanded(
                              child: Stack(
                                children: [
                                  Row(
                                    mainAxisAlignment:MainAxisAlignment.end,
                                    children: [
                                      Image.asset('assets/help_image.png'),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: height/15),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(width))
                                      ),
                                      elevation: 15,
                                        child:Image.asset('assets/logo_c.png')
                                    ),
                                  )
                                ],
                              )
                          ),
                        ],
                      ),
                    ),
                  )
                      :
                  index%2==0?
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: width/30,right: width/30,top: height/40),
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('From your apps',style: TextStyle(color: HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w600,fontSize: 16),),
                                  SizedBox(height: height/40,),
                                  Text('Enable the Marked share extension to save from Safari, or any of your favorite apps like Twitter and Flipboard.',
                                    style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(height: height/40,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                              color: HexToColor(MyConstants.redClr),
                                              borderRadius: BorderRadius.all(Radius.circular(width/10))
                                          ),
                                          padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                                          child: Text('Enable',
                                            style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.center,
                                          )
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: height/40,),
                                ],
                              )
                          ),
                          Expanded(
                              child: Stack(
                                children: [
                                  Row(
                                    mainAxisAlignment:MainAxisAlignment.end,
                                    children: [
                                      Image.asset('assets/help_image.png'),
                                    ],
                                  ),
                                  // Align(
                                  //  alignment: Alignment.centerLeft,
                                  //     child: Container(
                                  //
                                  //       decoration: BoxDecoration(
                                  //           color: Colors.white,
                                  //         shape: BoxShape.circle
                                  //       ),
                                  //       child: Card(
                                  //           elevation: 15,
                                  //           // shape: RoundedRectangleBorder(
                                  //           //     borderRadius: BorderRadius.all(Radius.circular(width))
                                  //           // ),
                                  //           child: Padding(
                                  //               padding: EdgeInsets.symmetric(width/20),
                                  //               child: Image.asset('assets/help_logo.png',height: height/25,)
                                  //           )
                                  //       ),
                                  //     ),
                                  // )
                                ],
                              )
                          ),
                        ],
                      ),
                    ),
                  )
                      :
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: width/30,right: width/30,top: height/40),
                      child: Row(
                        children: [
                          Expanded(
                              child: Row(
                                children: [
                                  Image.asset('assets/help_image.png'),
                                ],
                              )
                          ),
                          Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('From your apps',style: TextStyle(color: HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w600,fontSize: 16),),
                                  SizedBox(height: height/40,),
                                  Text('Enable the Marked share extension to save from Safari, or any of your favorite apps like Twitter and Flipboard.',
                                    style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(height: height/40,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                              color: HexToColor(MyConstants.redClr),
                                              borderRadius: BorderRadius.all(Radius.circular(width/10))
                                          ),
                                          padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                                          child: Text('Enable',
                                            style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.center,
                                          )
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: height/40,),
                                ],
                              )
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

}