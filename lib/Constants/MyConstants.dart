import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marked/Models/ArticleModel.dart';
import 'package:marked/Models/LoginModel.dart';
import 'package:marked/Preferences/MySharedPreference.dart';
import 'package:progress_dialog/progress_dialog.dart';

class MyConstants {
  static const String redClr = '#F95D5D';
  static const String blueClr = '#965ACC';
  static const String yellowClr = '#FF9B37';
  static const String lightYellowClr = '#FFBF80';
  static const String loginClr = '#616CCF';
  static const String greyClr = '#909090';
  static const String lightGreyClr = '#E9E9E9';
  static const String upperGreyClr = '#E6E6E6';
  static const String lowerGreyClr = '#EBEBEB';
  static const String fbClr = '#3b5998';
  static const String googleClr = '#4285f4';
  static const List appbarClrs = ['#965ACC','#616CCF'];

  static String id = "";
  static String othersLoginHeading = "";
  static const String  noInternet= "NO INTERNET CONNECTION";
  static const String  imageBaseUrl= "https://tecmyer.com.au/projects/marked/";
  static double width = 0;
  static double height = 0;
  static int tappedIndex;
  static bool isFromHome=false;
  static bool isFromDrawer=false;

  static ProgressDialog pr;
  static String email;
  static String userName;
  static String fName;
  static String lName;
  static String bio;
  static String token;
  static String userImage;

  static LoginModel loginModel;

  static ArticleDatum currentArticleData;



  static showLoadingBar(BuildContext context) {
    if (pr == null) {
      pr = new ProgressDialog(context,isDismissible: false);
      pr.style(message: 'Please wait...');
    }
    if (!pr.isShowing()) {
      pr.show();
    }
  }

  static hideLoadingBar() {
    if (pr != null && pr.isShowing()) {
      pr.hide();
    }
  }

  static String getDifference(DateTime currDate,DateTime time) {
    if(currDate.difference(time).inHours>=24){
      return " "+currDate.difference(time).inDays.toString()+" d ago";
    }else{
      if(currDate.difference(time).inMinutes>=60){
        return " "+currDate.difference(time).inHours.toString()+" h ago";
      }else{
        if(currDate.difference(time).inSeconds>=60){
          return " "+currDate.difference(time).inMinutes.toString()+" m ago";
        }else{
          return " "+currDate.difference(time).inSeconds.toString()+" s ago";
        }
      }
    }
  }

  static showAlertDialog(BuildContext context) {

    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("No"),
      onPressed:  () {Navigator.pop(context);},
    );
    Widget continueButton = FlatButton(
      child: Text("Yes"),
      onPressed:  () async{
        // MyConstants.showLoadingBar(context);
        MySharedPreferennce().userLogOut();
        MyConstants.fName='';
        MyConstants.lName='';
        MyConstants.email='';
        MyConstants.id ='';
        // MyConstants.hideLoadingBar();
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/login', (Route<dynamic> route) => false);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(width/20)
      ),
      title: Text("Logout"),
      content: Text("Are you sure, you want to logout?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


}
