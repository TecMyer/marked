import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:marked/Constants/MyConstants.dart';
import 'package:marked/Utils/HexColor.dart';

class ReadPage extends StatefulWidget {

  @override
  _ReadPageState createState() => new _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {

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
        title:Text("Read In App", style: TextStyle(color: Colors.white),),

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
            child:SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Welcome to App',style: TextStyle(color:Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                              SizedBox(height: height/40,),
                              Text('When you open marked, your saved items appear in your List with the newest item on top. Just tap an item to open it. \n\nYou can even open items while you\'re offline.',
                                style: TextStyle(color: HexToColor(MyConstants.greyClr) ,fontSize: 12,fontWeight: FontWeight.w400),
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
                            ],
                          )
                      ),
                    ],
                  ),
                  SizedBox(height: height/40,),
                  Text('When you open marked, your saved items appear in your List with the newest item on top. Just tap an item to open it.\n\nYou can even open items while you\'re offline. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages.\n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages',
                    style: TextStyle(color:  HexToColor(MyConstants.greyClr),fontSize: 12,fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: height/40,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}