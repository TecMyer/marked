import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:marked/Constants/MyConstants.dart';
import 'package:marked/Utils/HexColor.dart';

class FavouritesHelpPage extends StatefulWidget {

  @override
  _FavouritesPageState createState() => new _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesHelpPage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  double height = MyConstants.height,
      width = MyConstants.width;

  List<String> titles=['Favourites','Archive','Bulk Edit',];

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
        title:Text("Favourites, Archive, Bulk Edit", style: TextStyle(color: Colors.white),),

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
            child: ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (BuildContext context,int index){
                  return index%2==0?
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
                                  Text(titles[index],style: TextStyle(color: HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w600,fontSize: 16),),
                                  SizedBox(height: height/40,),
                                  Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.',
                                    style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w400),
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
                                  Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.',
                                    style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w400),
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