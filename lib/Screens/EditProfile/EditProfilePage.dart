import 'dart:convert';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marked/ApiHandler/ApiCall.dart';

import 'package:marked/Constants/MyConstants.dart';
import 'package:marked/Models/LoginModel.dart';
import 'package:marked/Preferences/MySharedPreference.dart';
import 'package:marked/Utils/HexColor.dart';
import 'package:marked/drawer/Drawer.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class EditProfilePage extends StatefulWidget {

  @override
  _EditProfilePageState createState() => new _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  double height = MyConstants.height,
      width = MyConstants.width;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Asset _image;

  TextEditingController _fnameController;
  TextEditingController _lnameController;
  TextEditingController _unameController;
  TextEditingController _bioController;

  LoginModel loginModel;
  MySharedPreferennce mySharedPreferennce = new MySharedPreferennce();




  @override
  void initState() {
    super.initState();
     _fnameController=TextEditingController(text: MyConstants.fName);
     _lnameController=TextEditingController(text: MyConstants.lName);
     _unameController=TextEditingController(text: MyConstants.userName);
     _bioController=TextEditingController(text: MyConstants.bio);

     getUserData();
  }

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
        title: Text("Edit Account",style: TextStyle(color: Colors.white),),
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
         Column(
           children: [
             SizedBox(height: 20,),
             GestureDetector(
                 onTap: () {
                   updateProfile(context);
                 },
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
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height*0.79,
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
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(width: width,),
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(width/20))
                  ),
                  child: Container(
                    height: height/5.5,
                    width: height/5.5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(MyConstants.imageBaseUrl+MyConstants.userImage)
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(width/20)),
                    ),
                    // child: Center(
                    //   child: Icon(Icons.person,size: width/5,),
                    // ),
                  ),
                ),
                SizedBox(height: height/80,),
                InkWell(
                  onTap: (){
                    getImage(context);
                  },
                  child:Container(
                    child: Text('Change Photo',
                      style: TextStyle(
                          color: HexToColor(MyConstants.appbarClrs[1]),
                          fontSize: height/50,fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                SizedBox(height: height/30,),

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
                      Text('Public',
                        style: TextStyle(
                            color: HexToColor(MyConstants.greyClr),
                            fontSize: height/50,fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: height/40,),
                      Text('First',style: TextStyle(color: Colors.black87,fontSize: height/45),),
                      TextField(
                        controller: _fnameController,
                        decoration: InputDecoration(
                          hintText: "First Name",
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: HexToColor(MyConstants.redClr))
                          ),

                            focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: HexToColor(MyConstants.redClr))
                          )
                        ),
                      ),
                      SizedBox(height: height/40,),
                      Text('Last',style: TextStyle(color: Colors.black87,fontSize: height/45),),
                      TextField(
                        controller: _lnameController,
                        decoration: InputDecoration(
                            hintText: "Last Name",
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: HexToColor(MyConstants.redClr))
                            ),

                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: HexToColor(MyConstants.redClr))
                            )
                        ),
                      ),
                      SizedBox(height: height/40,),
                      Text('Username',style: TextStyle(color: Colors.black87,fontSize: height/45),),
                      TextField(
                        controller: _unameController,
                        decoration: InputDecoration(
                            hintText: "username",
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: HexToColor(MyConstants.redClr))
                            ),

                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: HexToColor(MyConstants.redClr))
                            )
                        ),
                      ),
                      SizedBox(height: height/40,),
                      Text('Bio',style: TextStyle(color: Colors.black87,fontSize: height/45),),
                      TextField(
                        controller: _bioController,
                        decoration: InputDecoration(
                            hintText: "Bio",
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
                      Text('Private',
                        style: TextStyle(
                            color: HexToColor(MyConstants.greyClr),
                            fontSize: height/50,fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: height/40,),
                      Text('Email',style: TextStyle(color: Colors.black87,fontSize: height/45),),
                      SizedBox(height: height/40,),
                      Text(MyConstants.email, style: TextStyle(color: Colors.black87,fontSize: height/50),),
                      SizedBox(height: height/40,),
                      GestureDetector(
                        onTap: ()=>Navigator.pushNamed(context, '/changePass'),
                        child: Row(
                          children: [
                            Text('Change Password',
                              style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 16),
                            ),
                            Expanded(child: Container()),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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
                      Text('Email Address',style: TextStyle(color: HexToColor(MyConstants.greyClr),fontSize: height/50,fontWeight: FontWeight.bold),),
                      SizedBox(height: height/40,),
                      Text('Add new Email Address',style: TextStyle(color: Colors.black87,fontSize: height/45),),
                    ],
                  ),
                ),
                SizedBox(height: height/20,),

                Container(
                    width: width*0.8,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: new TextSpan(
                        text: 'Additional email address allow you to save links by emailing them to ',
                        style: TextStyle(color: HexToColor(MyConstants.greyClr),fontSize: height/50),
                        children: <TextSpan>[
                          new TextSpan(
                            text: 'add@marked.com ',
                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                          ),
                          new TextSpan(
                            text: 'and receive shared items from other Marked users.',
                          ),
                        ],
                      ),
                    )


                    // Text('Note: Your list private. No one can see what you save to Marked. Only what you choose to recommend will be visible to others',
                    //   style: TextStyle(color: HexToColor(MyConstants.greyClr),fontSize: height/50),textAlign: TextAlign.center,)
                ),

                SizedBox(height: height/20,),

              ],
            ),
          )
        ],
      ),
    );
  }

  void updateProfile(BuildContext context) async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      MyConstants.showLoadingBar(context);
      ApiCall.editProfile(_fnameController.text, _lnameController.text, MyConstants.email,_bioController.text).then((value) async {
        MyConstants.hideLoadingBar();
        if (value.statusCode==200) {
          if(json.decode(value.body)["success"]=="true"){
            loginModel.data[0].firstName=_fnameController.text;
            loginModel.data[0].lastName=_lnameController.text;
            final result = await mySharedPreferennce.LoginSession(loginModel);
            print("savingResponse" + result.toString());
            Navigator.pop(context);

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

  void getUserData() async{
    loginModel=await mySharedPreferennce.getUserData();
  }

  // showSelectionDialog(BuildContext context) {
  //
  //   // set up the buttons
  //   // Widget cancelButton = FlatButton(
  //   //   child: Text("No"),
  //   //   onPressed:  () {Navigator.pop(context);},
  //   // );
  //   // Widget continueButton = FlatButton(
  //   //   child: Text("Yes"),
  //   //   onPressed:  () async{
  //   //     // MyConstants.showLoadingBar(context);
  //   //     MySharedPreferennce().userLogOut();
  //   //     MyConstants.fName='';
  //   //     MyConstants.lName='';
  //   //     MyConstants.email='';
  //   //     MyConstants.id ='';
  //   //     // MyConstants.hideLoadingBar();
  //   //     Navigator.of(context).pushNamedAndRemoveUntil(
  //   //         '/login', (Route<dynamic> route) => false);
  //   //   },
  //   // );
  //
  //   // set up the AlertDialog
  //   AlertDialog alert = AlertDialog(
  //     shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(width/20)
  //     ),
  //     title: Text("Select Source"),
  //     content: Container(
  //       height: height/20,
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //         children: [
  //           RaisedButton(
  //             color: HexToColor(MyConstants.appbarClrs[0]),
  //             onPressed: (){
  //               getImage(context);
  //             },
  //             child: Center(
  //               child: Text('Camera',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
  //             ),
  //           ),
  //           RaisedButton(
  //             color: HexToColor(MyConstants.appbarClrs[1]),
  //             onPressed: (){
  //               getImage(context);
  //             },
  //             child: Center(
  //               child: Text('Gallery',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  //
  //   // show the dialog
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }

  getImage(BuildContext context) async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';


    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 1,
        enableCamera: true,
        selectedAssets: resultList,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: MyConstants.blueClr,
          actionBarTitle: "Marked",
          allViewTitle: "Select picture",
          useDetailsView: false,
          selectCircleStrokeColor: MyConstants.redClr,
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }
    if (!mounted) return;

    setState(() {
      _image = resultList[0];
     uploadPic();
    });
  }

  // Future getImage(ImageSource source) async {
  //   Navigator.pop(context);
  //   final pickedFile = await picker.getImage(source: source);
  //
  //   setState(() {
  //     if (pickedFile != null) {
  //       _image = File(pickedFile.path);
  //       uploadPic();
  //     } else {
  //       print('No image selected.');
  //     }
  //   });
  // }

  void uploadPic() async{

    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      MyConstants.showLoadingBar(context);
      ApiCall.uploadProfilePicture(_image).then((value) async {
        MyConstants.hideLoadingBar();
        var decoded=json.decode(value);
        getMyData();
        _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(decoded["message"], style: TextStyle(color: Colors.white),), backgroundColor: HexToColor(MyConstants.appbarClrs[1]),));
      }).catchError((onError) {

      });
    } else {
      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(MyConstants.noInternet, style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,));
    }
  }

  void getMyData()async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      ApiCall.getMyProfileData().then((value) async {
        if (value.statusCode==200) {
          if(json.decode(value.body)["success"]=="true"){
            LoginModel loginModel=LoginModel.fromJson(json.decode(value.body));
            MyConstants.loginModel=loginModel;
            final result = await mySharedPreferennce.LoginSession(loginModel);
            print("savingResponse" + result.toString());
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