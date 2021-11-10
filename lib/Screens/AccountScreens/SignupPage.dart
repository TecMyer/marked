// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:marked/ApiHandler/ApiCall.dart';
import 'package:marked/Constants/MyConstants.dart';
import 'package:marked/Models/LoginModel.dart';
import 'package:marked/Preferences/MySharedPreference.dart';
import 'package:marked/Screens/AccountScreens/LoginPage.dart';
import 'package:marked/Utils/HexColor.dart';

class SignupPage extends StatefulWidget {

  @override
  _SignupState createState() => new _SignupState();
}

class _SignupState extends State<SignupPage> {

  double height = MyConstants.height,
      width = MyConstants.width;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  // bool _validate = false;

  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  MySharedPreferennce mySharedPreferennce = new MySharedPreferennce();

  LoginModel facebookLoginModel;

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: width,
              height: height,
              color: HexToColor(MyConstants.blueClr),
            ),
            Positioned(
              top: height*0.02,
                left: width*0.05,
                child: Image.asset('assets/logo.png',height: height*0.07,)
            ),
            Positioned(
                top: 0,
                right: 0,
                child: Image.asset('assets/deco.png',)
            ),
            Container(
              margin: EdgeInsets.only(top: height*0.12),
              width: width,
              height: height*0.88,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(width*0.3)),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/gray_bg.png')
                  )
              ),
              padding: EdgeInsets.symmetric(horizontal: width/10,vertical: height/25),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Create an Account',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: height/28),),

                    SizedBox(height: height/30,),

                    TextField(
                      controller: _fnameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: "First Name",
                        // errorText: _validate ? 'Name Can\'t Be Empty' : null,
                      ),
                    ),
                    TextField(
                      controller: _lnameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: "Last Name",
                        // errorText: _validate ? 'Name Can\'t Be Empty' : null,
                      ),
                    ),
                    // SizedBox(height: height/80,),

                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        // errorText: _validate ? 'Name Can\'t Be Empty' : null,
                      ),
                    ),
                    // SizedBox(height: height/80,),

                    TextField(
                      controller: _passController,
                      obscureText: true,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        labelText: "Password",
                        // errorText: _validate ? 'Name Can\'t Be Empty' : null,
                      ),
                    ),

                    SizedBox(height: height/30,),

                    RaisedButton(
                      onPressed: () {
                        if(_fnameController.text.isNotEmpty && _lnameController.text.isNotEmpty && _emailController.text.isNotEmpty && _passController.text.isNotEmpty){
                          if(EmailValidator.validate(_emailController.text) ){
                            if(_passController.text.length>7){
                              signupNewUser(context);
                            }else{
                              _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("please enter valid password.", style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,));
                            }
                          }else{
                            _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Enter Valid Email.", style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,));
                          }
                        }else{
                          _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Some fields are missing. Fill all fields", style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,));
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                      ),
                      child: Container(
                          width: width,
                          height: 40,
                          child: Center(child: Text('Register',style: TextStyle(fontSize: width/20,fontWeight: FontWeight.w600),))),
                      textColor: Colors.white,
                      color: HexToColor(MyConstants.redClr),
                    ),

                    SizedBox(height: height/30,),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Text('OR',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: height/35),),
                    //   ],
                    // ),

                    SizedBox(height: height/30,),

                    // GestureDetector(
                    //   onTap: (){
                    //     _facebookLogin(context);
                    //   },
                    //   child:  Container(
                    //       width: width,
                    //       height: 40,
                    //       decoration: BoxDecoration(
                    //           border: Border.all(color: HexToColor(MyConstants.fbClr)),
                    //           borderRadius: BorderRadius.all(Radius.circular(width/10))
                    //       ),
                    //       child: Center(
                    //           child: Row(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             children: [
                    //               Image.asset('assets/fb.png',height: 30,),
                    //               SizedBox(width: width/15,),
                    //               Text('Facebook',style: TextStyle(fontSize: width/20,fontWeight: FontWeight.w600,color: HexToColor(MyConstants.fbClr)),)
                    //             ],
                    //           )
                    //       )
                    //   ),
                    // ),

                    // SizedBox(height: height/40,),
                    //
                    // Container(
                    //     width: width,
                    //     height: 40,
                    //     decoration: BoxDecoration(
                    //       border: Border.all(color: HexToColor(MyConstants.googleClr)),
                    //       borderRadius: BorderRadius.all(Radius.circular(width/10))
                    //     ),
                    //     child: Center(
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             Image.asset('assets/google.png',height: 30,),
                    //             SizedBox(width: width/15,),
                    //             Text('Google',style: TextStyle(fontSize: width/20,fontWeight: FontWeight.w600,color: HexToColor(MyConstants.googleClr)),)
                    //           ],
                    //         )
                    //     )
                    // ),

                    SizedBox(height: height/30,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text('You have an account?',style: TextStyle(color: Colors.black26,fontWeight: FontWeight.bold,fontSize: height/50),),
                            GestureDetector(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: Text('Sign In',style: TextStyle(color:HexToColor(MyConstants.redClr),fontWeight: FontWeight.bold,fontSize: height/28),)
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void signupNewUser(BuildContext context)async {
    FocusScope.of(context).unfocus();
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      MyConstants.showLoadingBar(context);
      ApiCall.newUserSignup(_fnameController.text, _lnameController.text, _emailController.text, _passController.text).then((value) async {
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

  _facebookLogin(BuildContext context) async {
    FocusScope.of(context).unfocus();
    final FacebookLoginResult result =
    await LoginPage.facebookSignIn.logIn(['email','public_profile']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        MyConstants.showLoadingBar(context);
        final FacebookAccessToken accessToken = result.accessToken;
        // ignore: unnecessary_statements
        accessToken.permissions;

        var graphResponse = await http.get(Uri.parse('https://graph.facebook.com/v2.12/me?fields=name,first_name,picture,last_name,email&access_token=${accessToken.token}'));
        Map<String, dynamic> user = json.decode(graphResponse.body);
        Map<String,dynamic> picture = user['picture'];
        Map<String,dynamic> data = picture['data'];

        await ApiCall.fbLogin(user['id'], user['first_name'], user['last_name'], user['email'], data['url']).then((value) async {
          MyConstants.hideLoadingBar();
          if (value.statusCode==200) {
            if(json.decode(value.body)["success"]=="true"){
              facebookLoginModel=LoginModel.fromJson(jsonDecode(value.body));
              final result = await mySharedPreferennce.LoginSession(facebookLoginModel);
              print("savingResponse" + result.toString());
              Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
            }else{
              _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(jsonDecode(value.body)['message'], style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,));
            }

          } else {
            _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(jsonDecode(value.body)['message'], style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,));
          }
        }).catchError((onError) {

        });



        // var graphResponseFeed = await http.get('https://graph.facebook.com/v2.12/me/feed?fields=message&access_token=${accessToken.token}');
        // var data1 = json.decode(graphResponseFeed.body);
        // print(data1);


        // me?fields=id,name,feed{message,attachments}
        // var graphResponseFeed1 = await http.get('https://graph.facebook.com/v2.12/me?fields=id,name{feed,attachments,message}&access_token=${accessToken.token}');
        // var data1l = json.decode(graphResponseFeed1.body);
        // Map<String,dynamic> root = json.decode(graphResponseFeed1.body);
        // Map <String,dynamic> feed = root['feed'];
        // var fdata = feed['data'];
        //
        // if(fdata!=null){
        //   for (var i = 0; i < fdata.length; i++) {
        //     var qq = fdata[i];
        //     // var pp = qq['attachments'];
        //     if(qq['attachments']==null){
        //       i++;
        //     }else{
        //       Map <String,dynamic> pp = qq['attachments'];
        //       var nn = pp['data'];
        //       for(var j =0; j< nn.length; j++){
        //         var mm = nn[j];
        //         var jj = mm['media'];
        //         var img = jj['image'];
        //         var src = img['src'];
        //         print(src);
        //         Util.descriptionList.add(mm['description']);
        //         Util.mediaList.add(img['src']);
        //         // Util.listItems.add(new ListItem(mm['description'], img['src']));
        //       }
        //     }
        //     Navigator.pushReplacementNamed(context, '/home');
        //   }
        // }else{
        //   Navigator.pushReplacementNamed(context, '/home');
        // }
        break;
      case FacebookLoginStatus.cancelledByUser:
        _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Login cancelled by the user.', style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,));
        break;
      case FacebookLoginStatus.error:
        _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.toString()}', style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,));
        break;
    }
  }

  navigate() {
    Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
  }
}