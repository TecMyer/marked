import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:marked/Constants/MyConstants.dart';
import 'package:marked/Utils/HexColor.dart';

class ManageSiteLoginPage extends StatefulWidget {

  @override
  _ManageSiteLoginPageState createState() => new _ManageSiteLoginPageState();
}

class _ManageSiteLoginPageState extends State<ManageSiteLoginPage> {

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
        title:Text("Login", style: TextStyle(color: Colors.white),),

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
            child: Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(width/30))
                  ),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Select a site',style: TextStyle(color: HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w600,fontSize: 16),),
                        SizedBox(height: height/40,),
                        GestureDetector(
                          onTap: (){
                            MyConstants.othersLoginHeading='Ars Technica';
                            Navigator.pushNamed(context, '/arsTechnica');
                          },
                          child: Row(
                            children: [
                              Text('Ars Technica',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 16),),
                              Expanded(child: Container()),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                        ),
                        SizedBox(height: height/40,),
                        GestureDetector(
                          onTap: (){
                            MyConstants.othersLoginHeading='London Review of Books';
                            Navigator.pushNamed(context, '/arsTechnica');
                          },
                          child: Row(
                            children: [
                              Text('London Review of Books',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 16),),
                              Expanded(child: Container()),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                        ),
                        SizedBox(height: height/40,),
                        GestureDetector(
                          onTap: (){
                            MyConstants.othersLoginHeading='The Sunday Times';
                            Navigator.pushNamed(context, '/arsTechnica');
                          },
                          child: Row(
                            children: [
                              Text('The Sunday Times',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 16),),
                              Expanded(child: Container()),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                        ),
                        SizedBox(height: height/40,),
                        GestureDetector(
                          onTap: (){
                            MyConstants.othersLoginHeading='The Times';
                            Navigator.pushNamed(context, '/arsTechnica');
                          },
                          child: Row(
                            children: [
                              Text('The Times',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 16),),
                              Expanded(child: Container()),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height/50,),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(width/30))
                  ),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Other sites',style: TextStyle(color: HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w600,fontSize: 16),),
                        SizedBox(height: height/40,),
                        GestureDetector(
                          // onTap: ()=>Navigator.pushNamed(context, '/howToSave'),
                          child: Row(
                            children: [
                              Text('Login to a specific site',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 16),),
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
          )
        ],
      ),
    );
  }
}