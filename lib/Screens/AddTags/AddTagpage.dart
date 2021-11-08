// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marked/ApiHandler/ApiCall.dart';

import 'package:marked/Constants/MyConstants.dart';
import 'package:marked/Models/TagModel.dart';
import 'package:marked/Preferences/MySharedPreference.dart';
import 'package:marked/Utils/HexColor.dart';

class AddTagPage extends StatefulWidget {

  @override
  _AddTagPageState createState() => new _AddTagPageState();
}

class _AddTagPageState extends State<AddTagPage> {

  double height = MyConstants.height,
      width = MyConstants.width;




  List<String> tags=List<String>();
  List<String> dummyList=List<String>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController search=TextEditingController();

  MySharedPreferennce mySharedPreferennce = new MySharedPreferennce();


  @override
  void initState() {
    super.initState();
    getAllTags();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        leading: Container(),
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
            child:SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 25,),
                      Expanded(child: Container()),
                      Text('Add Tags',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500),maxLines: 1,overflow: TextOverflow.ellipsis,),
                      Expanded(child: Container()),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.close),
                      )
                    ],
                  ),
                  SizedBox(height: height/40,),
                  MyConstants.isFromDrawer?
                      Container():
                  Container(
                    height: height*0.05,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.all(Radius.circular(23)),
                    ),
                    // height: height*0.07,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: search,
                            onChanged: (value)=> updateList(value),
                            decoration: InputDecoration(
                              hintText: 'Select or enter a tag...',
//                            hintStyle: TextStyle,
                              prefixIcon: Icon(
                                Icons.search,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.add_circle_outline,color: HexToColor(MyConstants.blueClr),),
                          onPressed: (){
                            addThisTagFree();
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: height/40,),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(width/20)
                    ),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(' All Tags',style: TextStyle(color: HexToColor(MyConstants.greyClr),fontSize: 16),overflow: TextOverflow.ellipsis,),
                          SizedBox(height: height/50,),
                          ListView.builder(
                            itemCount: dummyList.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: (){
                                  if(MyConstants.isFromDrawer){
                                    addThisTagToMenu(dummyList[index]);
                                  }else{
                                    addThisTag(dummyList[index]);
                                  }
                                },
                                child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                                    child: Text(dummyList[index],style: TextStyle(color: Colors.black,fontSize: 15),overflow: TextOverflow.ellipsis,)
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),

    );
  }

  updateList(String value) {
    if(value.isEmpty){
      setState(() {
        dummyList=tags;
      });
    }
    else{
      setState(() {
        List<String> dummyListData = List<String>();
        String s;
        if(value.length>1){
          s = '${value[0].toUpperCase()}${value.substring(1)}';
        }else{
          s = '${value[0].toUpperCase()}';
        }
        tags.forEach((item) {
          if(item.startsWith(s)||item.contains(s)||item.contains(s.toUpperCase())||item.contains(s.toLowerCase())
              ||item.contains(value) || item.contains(value.toUpperCase()) || item.contains(value.toLowerCase())
              || item.startsWith(value) || item.startsWith(value.toUpperCase()) || item.startsWith(value.toLowerCase())) {
            dummyListData.add(item);
          }
        });
        setState(() {
          dummyList.clear();
          dummyList.addAll(dummyListData);
        });
      });
    }


  }

  void addThisTag(String tag) async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      MyConstants.showLoadingBar(context);
      ApiCall.addTagsToThis(MyConstants.currentArticleData.id,tag).then((value) async {
        MyConstants.hideLoadingBar();
        if (value.statusCode==200) {
          if(json.decode(value.body)["success"]=="true"){
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

  void addThisTagFree() async{
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
        MyConstants.showLoadingBar(context);
        ApiCall.addTagsToThis(MyConstants.currentArticleData.id,search.text).then((value) async {
          MyConstants.hideLoadingBar();
          if (value.statusCode==200) {
            if(json.decode(value.body)["success"]=="true"){
              search=TextEditingController();
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

  void getAllTags() async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      ApiCall.getAllTags().then((value) async {
        if (value.statusCode==200) {
          if(json.decode(value.body)["success"]=="true"){
            TagModel tagModel=TagModel.fromJson(json.decode(value.body));
            String s=tagModel.data.tags;
            tags=s.split(",");
            updateList(search.text);
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

  void addThisTagToMenu(String tag) async{
    List<String> list=await mySharedPreferennce.getTagList();
    list.add(tag);
    await mySharedPreferennce.setTagList(list);
    Navigator.pop(context);
  }

}
