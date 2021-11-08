import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:marked/Constants/MyConstants.dart';
import 'package:marked/Utils/HexColor.dart';

class SyncHelpPage extends StatefulWidget {

  @override
  _SyncHelpPageState createState() => new _SyncHelpPageState();
}

class _SyncHelpPageState extends State<SyncHelpPage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  double height = MyConstants.height,
      width = MyConstants.width;

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios,color: Colors.white,)
        ),
        title:Text("Sync And Download", style: TextStyle(color: Colors.white),),

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
                horizontal: width / 15, vertical: height / 20),
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sync',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 16),),
                  SizedBox(height: height/50,),
                  Text('When you open marked, your saved items appear in your List with the newest item on top. Just tap an item to open it. \n\nYou can even open items while you\'re offline.',style: TextStyle(color: HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w600,fontSize: 12),),
                  SizedBox(height: height/50,),
                    Text('- Why do we use it?\n- What is Lorem Ipsum?\n- Where does it come from?\n- What is Lorem Ipsum?',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 16),),
                  SizedBox(height: height/50,),
                  Text('When you open marked, your saved items appear in your List with the newest item on top. Just tap an item to open it.',style: TextStyle(color: HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w600,fontSize: 12),),
                  SizedBox(height: height/30,),

                  Text('Download',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 16),),
                  SizedBox(height: height/50,),
                  Text('When you open marked, your saved items appear in your List with the newest item on top. Just tap an item to open it. \n\nYou can even open items while you\'re offline.',style: TextStyle(color: HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w600,fontSize: 12),),
                  SizedBox(height: height/50,),
                  Text('- Why do we use it?\n- What is Lorem Ipsum?\n- Where does it come from?\n- What is Lorem Ipsum?',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 16),),
                  SizedBox(height: height/50,),
                  Text('When you open marked, your saved items appear in your List with the newest item on top. Just tap an item to open it.',style: TextStyle(color: HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w600,fontSize: 12),),
                  SizedBox(height: height/300,),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}