import 'dart:convert';

import 'package:marked/Constants/MyConstants.dart';
import 'package:marked/Models/ArticleModel.dart';
import 'package:marked/Models/LoginModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferennce {
  static String Is_First_Time = "Is_First_Time";

  String User_Id="user_id";
  String User_Email="email";
  String user_address="address";
  String phone_number="phone_number";
  String User_Name="User_Name";
  String User_Image="User_Image";
  String token="token";

  String User_Login_Data="User_Login_Data";
  String Tags_List="Tags_List";

  String First_Name = "First_Name";

  String Last_Name = "Last_Name";

  String User_Bio="User_Bio";
  String Article_List="Article_List";


  Future setFirstTime(bool isFirst) async {
    var result;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs?.setBool(Is_First_Time, isFirst).then((onValue) {
      result = true;
    }).catchError((onError) {
      result = false;
    });
  }

  Future getisFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data1 = await prefs?.getBool(Is_First_Time) ?? true;
    print("get if first time " + data1.toString());
    return data1;
  }





Future LoginSession (LoginModel logInResponse) async {
    var result;

    MyConstants.id = logInResponse.data[0].id.toString();
    MyConstants.email = logInResponse.data[0].email.toString();
    MyConstants.bio = logInResponse.data[0].bio.toString();
    // MyConstants.cityId = logInResponse.data.cityId;
    // MyConstants.stateId = logInResponse.data.stateId;
    // MyConstants.phoneNumber=logInResponse.data[0].phone;
    MyConstants.userName = logInResponse.data[0].firstName.toString()+logInResponse.data[0].lastName.toString();
    MyConstants.fName = logInResponse.data[0].firstName.toString();
    MyConstants.lName = logInResponse.data[0].lastName.toString();
    MyConstants.userImage = logInResponse.data[0].picture.toString();
    MyConstants.token = logInResponse.data[0].copenNumber;

    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs?.setString(User_Id, logInResponse.data[0].id.toString());
    await prefs?.setString(User_Email, logInResponse.data[0].email.toString());
    await prefs?.setString(User_Bio, logInResponse.data[0].bio.toString());
    // await prefs?.setInt(City_id, logInResponse.data.cityId);
    // await prefs?.setInt(State_id, logInResponse.data.stateId);
    // await prefs?.setString(phone_number, logInResponse.data.phone);
    await prefs?.setString(User_Name, logInResponse.data[0].firstName.toString()+logInResponse.data[0].lastName.toString());
    await prefs?.setString(First_Name, logInResponse.data[0].firstName.toString());
    await prefs?.setString(Last_Name, logInResponse.data[0].lastName.toString());
    await prefs?.setString(User_Image, logInResponse.data[0].picture.toString());
    await prefs?.setString(token, logInResponse.data[0].copenNumber);

    MyConstants.loginModel=logInResponse;

    await prefs?.setString(User_Login_Data, json.encode(logInResponse)).then((onValue) {
      print("savingResponse : Saved Successfully");
      result = true;
    }).catchError((onError) {
      print("savingResponse : Failed to Save");
      result = false;
    });
    return result;
  }

  Future getUserrLogIn() async {
    var data;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data1 = await prefs?.getString(User_Login_Data) ?? "logout";
    print("get Login" + data1);
    if (data1 != "logout") {
      MyConstants.id =  prefs?.getString(User_Id);
      MyConstants.email =  prefs?.getString(User_Email);
      MyConstants.bio = await prefs?.getString(User_Bio);
      // MyConstants.cityId = await prefs?.getInt(City_id);
      // MyConstants.stateId = await prefs?.getInt(State_id);
      // MyConstants.phoneNumber = await prefs?.getString(phone_number);
      MyConstants.userName =  prefs?.getString(User_Name);
      MyConstants.fName =  prefs?.getString(First_Name);
      MyConstants.lName =  prefs?.getString(Last_Name);
      MyConstants.userImage =  prefs?.getString(User_Image);
      MyConstants.token =  prefs?.getString(token);
      LoginModel newData =LoginModel.fromJson( json.decode( prefs?.getString(User_Login_Data) ?? "logout"));
      MyConstants.loginModel=newData;
      data = json.decode( prefs?.getString(User_Login_Data) ?? "logout");
    } else {
      data = prefs?.getString(User_Login_Data) ?? "logout";
    }
    return data;
  }

  Future<LoginModel> getUserData() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      LoginModel data =LoginModel.fromJson( json.decode(await prefs?.getString(User_Login_Data) ?? "logout"));
      return data;
  }

  void userLogOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(User_Login_Data, "logout").then((onValue) {
      print("savingResponse : User LogOut Successfully");
    }).catchError((onError) {
      print("savingResponse : User LogOut Failed");
    });
  }

  Future setTagList(List<String> list) async {
    bool data;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    data = await prefs?.setStringList(Tags_List,list);
    return data;
  }

  Future<List<String>> getTagList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> data =await prefs?.getStringList(Tags_List) ?? [];
    return data;
  }

  setSavedList(ArticleDatum object) async {
    List<ArticleDatum> responseList = await getSavedList();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    responseList.add(object);
    List<String> stringList=List<String>();
    for(int i=0;i<responseList.length;i++){
      stringList.add(json.encode(responseList[i]));
    }
    prefs?.setStringList(Article_List, stringList);

  }

  Future<List<ArticleDatum>> getSavedList() async {
    List<ArticleDatum> list=List<ArticleDatum>();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> data1 = await prefs?.getStringList(Article_List)?? [];

    for(int i=0;i<data1.length;i++){
      list.add(ArticleDatum.fromJson(json.decode(data1[i])));
    }
    print("get Saved List" + data1.toString());
    return list;
  }

  deleteSavedList(ArticleDatum data) async{
    List<ArticleDatum> responseList = await getSavedList();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for(int i=0;i<responseList.length;i++){
      if(data.id==responseList[i].id){
        responseList.removeAt(i);
        break;
      }
    }
    List<String> stringList=List<String>();
    for(int i=0;i<responseList.length;i++){
      stringList.add(json.encode(responseList[i]));
    }
    prefs?.setStringList(Article_List, stringList);
  }
}
