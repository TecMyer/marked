// ignore_for_file: deprecated_member_use

import 'dart:convert';
// import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marked/ApiHandler/ApiCall.dart';

import 'package:marked/Constants/MyConstants.dart';
import 'package:marked/Utils/HexColor.dart';
// import 'package:marked/drawer/Drawer.dart';

class ChangePasswordPage extends StatefulWidget {

  @override
  _ChangePasswordPageState createState() => new _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  double height = MyConstants.height,
      width = MyConstants.width;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController _currentpassController=TextEditingController();
  TextEditingController _npassController=TextEditingController();
  TextEditingController _cpassController=TextEditingController();

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
        title: Text("Change Password",style: TextStyle(color: Colors.white),),
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
          Column(
            children: [
              SizedBox(height: 20,),
              GestureDetector(
                  onTap: () {
                    if(_currentpassController.text.isNotEmpty && _npassController.text.isNotEmpty && _cpassController.text.isNotEmpty){
                      if(_npassController.text == _cpassController.text){
                        if(_npassController.text.length>7){
                          changePass(context);
                        }else {
                          _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Password must contain 8 characters', style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,));
                        }
                      }else {
                        _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Passwords does not match', style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,));
                      }
                    }else {
                      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Fill all fields', style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,));
                    }
                  } ,
                  child: Text('Save',style: TextStyle(color: Colors.white),)
              ),
            ],
          ),
          SizedBox(width: width/30,)
        ],
      ),
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
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/gray_bg.png')
                )
            ),
            padding: EdgeInsets.symmetric(horizontal: width/20,vertical: height/30),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(width: width,),
                SizedBox(height: height/20,),
                Container(
                  width: width*0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(width/20)),
                      color: Colors.white
                  ),
                  padding: EdgeInsets.symmetric(horizontal: width/10,vertical: height/30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Current Password',style: TextStyle(color: Colors.black87,fontSize: height/45,fontWeight: FontWeight.w600),),
                      TextField(
                        controller: _currentpassController,
                        decoration: InputDecoration(
                            hintText: "Current Password",
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: HexToColor(MyConstants.redClr))
                            ),

                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: HexToColor(MyConstants.redClr))
                            )
                          // errorText: _validate ? 'Name Can\'t Be Empty' : null,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height/50,),
                Container(
                  width: width*0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(width/20)),
                      color: Colors.white
                  ),
                  padding: EdgeInsets.symmetric(horizontal: width/10,vertical: height/30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('New Password',style: TextStyle(color: HexToColor(MyConstants.greyClr),fontSize: height/40,fontWeight: FontWeight.bold),),
                      SizedBox(height: height/40,),
                      Text('New Password',style: TextStyle(color: Colors.black87,fontSize: height/45,fontWeight: FontWeight.w600),),
                      TextField(
                        controller:_npassController,
                        decoration: InputDecoration(
                            hintText: "New Password",
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: HexToColor(MyConstants.redClr))
                            ),

                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: HexToColor(MyConstants.redClr))
                            )
                          // errorText: _validate ? 'Name Can\'t Be Empty' : null,
                        ),
                      ),
                      SizedBox(height: height/40,),
                      Text('Confirm Password',style: TextStyle(color: Colors.black87,fontSize: height/45,fontWeight: FontWeight.w600),),
                      TextField(
                        controller: _cpassController,
                        decoration: InputDecoration(
                            hintText: "Confirm Password",
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: HexToColor(MyConstants.redClr))
                            ),

                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: HexToColor(MyConstants.redClr))
                            )
                          // errorText: _validate ? 'Name Can\'t Be Empty' : null,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: height/30,),
                Container(
                    width: width*0.85,
                    child: Text('If you don\'t remember your current password, you can reset it online by tapping below.',
                      style: TextStyle(color: HexToColor(MyConstants.greyClr),fontSize: height/50),
                      textAlign: TextAlign.center,
                    )
                ),
                SizedBox(height: height/30,),
                GestureDetector(
                  // onTap: () => changePass(context),
                  child: Container(
                      decoration: BoxDecoration(
                          color: HexToColor(MyConstants.redClr),
                          borderRadius: BorderRadius.all(Radius.circular(width/10))
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Text('Reset Password',
                        style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      )
                  ),
                ),
                SizedBox(height: height/20,),

              ],
            ),
          )
        ],
      ),
    );
  }

  void changePass(BuildContext context) async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      MyConstants.showLoadingBar(context);
      ApiCall.changePassword(_currentpassController.text, _npassController.text).then((value) async {
        MyConstants.hideLoadingBar();
        if (value.statusCode==200) {
          if(json.decode(value.body)["success"]=="true"){
            _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(jsonDecode(value.body)['message'], style: TextStyle(color: Colors.white),), backgroundColor: Colors.green,));
            Future.delayed(Duration(seconds: 3),navigate);
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

  navigate() {
    Navigator.pop(context);
  }

}