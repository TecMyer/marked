// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:marked/Constants/MyConstants.dart';
import 'package:marked/Utils/HexColor.dart';

class ArsTechnicaLoginPage extends StatefulWidget {

  @override
  _ArsTechnicaLoginPageState createState() => new _ArsTechnicaLoginPageState();
}

class _ArsTechnicaLoginPageState extends State<ArsTechnicaLoginPage> {

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
                )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height/50,),
                Text(MyConstants.othersLoginHeading,style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: height/28),),
                SizedBox(height: height/30,),
                TextField(
                  // controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    // errorText: _validate ? 'Name Can\'t Be Empty' : null,
                  ),
                ),
                // SizedBox(height: height/80,),

                TextField(
                  // controller: _passController,
                  decoration: InputDecoration(
                    labelText: "Password",
                    // errorText: _validate ? 'Name Can\'t Be Empty' : null,
                  ),
                ),

                SizedBox(height: height/30,),

                RaisedButton(
                  onPressed: () {
                    setState(() {
                      // Navigator.pushNamed(context, '/home');
                      // _nameController.text.isEmpty ? _validate = true : _validate = false;
                      // _emailController.text.isEmpty ? _validate = true : _validate = false;
                      // _passController.text.isEmpty ? _validate = true : _validate = false;
                    });
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Container(
                      width: width,
                      height: 40,
                      child: Center(child: Text('Sign In',style: TextStyle(fontSize: width/20,fontWeight: FontWeight.w600),))),
                  textColor: Colors.white,
                  color: HexToColor(MyConstants.redClr),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

}