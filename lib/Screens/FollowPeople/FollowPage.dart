import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marked/ApiHandler/ApiCall.dart';

import 'package:marked/Constants/MyConstants.dart';
import 'package:marked/Models/SuggestionModel.dart';
import 'package:marked/Utils/HexColor.dart';

class FollowPage extends StatefulWidget {

  @override
  _FollowPageState createState() => new _FollowPageState();
}

class _FollowPageState extends State<FollowPage> {

  double height = MyConstants.height,
      width = MyConstants.width;

  bool isContactCalled = false;
  bool isPeopleCalled = true;
  bool isTwitterCalled=false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  SuggestionModel dataModel;


  @override
  void initState() {
    super.initState();
    getPeopleToFollow();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()=> Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
        ),
        title: Text("Follow People",style: TextStyle(color: Colors.white),),
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
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                gradient: LinearGradient( begin: Alignment.topLeft,
                    end: Alignment.bottomRight,colors: [HexToColor(MyConstants.appbarClrs[0]),HexToColor(MyConstants.appbarClrs[1])]),
              ),
            ),
            Expanded(
              child: Container(
                width: width,
                // height: height*0.86,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(width/12),
                    topLeft: Radius.circular(width/12),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      // margin: EdgeInsets.symmetric(horizontal: width/25),
                      height: height/15,
                      width: width,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: InkWell(
                                onTap: _peopleTap,
                                child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(bottom: BorderSide(color: isPeopleCalled?HexToColor(MyConstants.redClr):Colors.transparent))
                                    ),
                                    padding: EdgeInsets.symmetric(vertical:height/50,),
                                    child:Image.asset('assets/people.png',color: isPeopleCalled?HexToColor(MyConstants.redClr):HexToColor(MyConstants.greyClr),)
                                  // Text('My List',style: TextStyle(color: isPeopleCalled?HexToColor(MyConstants.redClr):HexToColor(MyConstants.greyClr),fontWeight: isPeopleCalled?FontWeight.w600:FontWeight.w400,fontSize: height/53),textAlign: TextAlign.center,)
                                )
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                                onTap: _contactTap,
                                child: Container(

                                    decoration: BoxDecoration(
                                        border: Border(bottom: BorderSide(color: isContactCalled?HexToColor(MyConstants.redClr):Colors.transparent))
                                    ),
                                    padding: EdgeInsets.symmetric(vertical:height/50,),
                                    child:Image.asset('assets/contact.png',color: isContactCalled?HexToColor(MyConstants.redClr):HexToColor(MyConstants.greyClr),)
                                  // Text('Archive',style: TextStyle(color: isContactCalled?HexToColor(MyConstants.redClr):HexToColor(MyConstants.greyClr),fontWeight: isContactCalled?FontWeight.w600:FontWeight.w400,fontSize: height/53),textAlign: TextAlign.center,)
                                )
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                                onTap: _twitterTap,
                                child: Container(

                                    decoration: BoxDecoration(
                                        border: Border(bottom: BorderSide(color: isTwitterCalled?HexToColor(MyConstants.redClr):Colors.transparent))
                                    ),
                                    padding: EdgeInsets.symmetric(vertical:height/50,),
                                    child:Image.asset('assets/twitter.png',color: isTwitterCalled?HexToColor(MyConstants.redClr):HexToColor(MyConstants.greyClr),)
                                  // Text('All items',style: TextStyle(color: isTwitterCalled?HexToColor(MyConstants.redClr):HexToColor(MyConstants.greyClr),fontWeight: isTwitterCalled?FontWeight.w600:FontWeight.w400,fontSize: height/53),textAlign: TextAlign.center,)
                                )
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: HexToColor(MyConstants.lightGreyClr),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('assets/gray_bg.png')
                              )
                          ),
                          padding: EdgeInsets.symmetric(horizontal: width/20,vertical: height/30),
                          child: isPeopleCalled?
                          SingleChildScrollView(
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    width: width,
                                    padding: EdgeInsets.symmetric(vertical: height/15),
                                    // height: height*0.2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(width/20)),
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end:Alignment.bottomCenter, // 10% of the width, so there are ten blinds.
                                        colors: [
                                          HexToColor(MyConstants.lightYellowClr),
                                          HexToColor(MyConstants.yellowClr),
                                        ], // red to yellow// repeats the gradient over the canvas
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: width*0.7,
                                          child: Text('The people to follow',
                                            style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,
                                          )
                                      ),
                                        Container(
                                            margin: EdgeInsets.only(top: height/60),
                                            width: width*0.7,
                                            child: Text('Here\'s who we  suggest following for  great recommendations.',
                                              style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.w400),
                                              maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,
                                            )
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: height/30,),
                                  Row(
                                    children: [
                                      Text(dataModel!=null?dataModel.data.length.toString()+" suggestions":'no suggestions', style: TextStyle(color: HexToColor(MyConstants.greyClr),fontSize: 15,fontWeight: FontWeight.w600),),
                                      Expanded(child: Container()),
                                      GestureDetector(
                                        onTap: (){
                                          followAllSuggestion(context);
                                        },
                                        child: Text('Follow All', style: TextStyle(color: HexToColor(MyConstants.redClr),fontSize: 15,fontWeight: FontWeight.w400),),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: height/30,),
                                  dataModel==null || dataModel.data.length==0?
                                      Container():
                                  ListView.builder(
                                      itemCount: dataModel.data.length,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (BuildContext context,int index){
                                        return Card(
                                          elevation: 0,
                                          child: ListTile(
                                            leading: Container(
                                              height: height/15,
                                              width: height/15,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(color: Colors.grey),
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: NetworkImage(MyConstants.imageBaseUrl+dataModel.data[index].picture)
                                                )
                                              ),
                                              // child: Center(
                                              //   child: Icon(Icons.person,color: Colors.grey,),
                                              // ),
                                            ),
                                            title: Text(dataModel.data[index].firstName+" "+dataModel.data[index].lastName,maxLines: 1,overflow: TextOverflow.ellipsis,),
                                            subtitle: Text(dataModel.data[index].email,maxLines: 1,overflow: TextOverflow.ellipsis,),
                                            trailing: GestureDetector(
                                              onTap: (){
                                                followSinglePerson(context, dataModel.data[index].id,index);
                                              },
                                              child: Image.asset('assets/add_user.png'),
                                            )
                                          ),
                                        );
                                      }
                                  ),

                                ],
                              ),
                            ),
                          ):
                          isContactCalled?
                          Container(
                            width: width,
                            child: Column(
                              children: [
                                SizedBox(height: height*0.15,),
                                Container(
                                    width: width*0.65,
                                    child: Text('Find who you know on Marked by connecting your Address book',
                                      style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,
                                    )
                                ),

                                Container(
                                    margin: EdgeInsets.only(top: height/50),
                                    width: width*0.65,
                                    child: Text('Your contact will only be used to find your friends. There email address will not be uploaded or stored by marked.You\'ll be able to choose who you\'d like to follow after connecting.',
                                      style: TextStyle(color: HexToColor(MyConstants.greyClr),fontSize: 12,fontWeight: FontWeight.w400),
                                      maxLines: 7,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,
                                    )
                                ),
                                SizedBox(height: height/30,),
                                // GestureDetector(
                                  // onTap: () => Navigator.pushNamed(context, '/followPage'),
                                  // child:
                                  Container(
                                      decoration: BoxDecoration(
                                          color: HexToColor(MyConstants.redClr),
                                          borderRadius: BorderRadius.all(Radius.circular(width/10))
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                      child: Text('Connect to address book',
                                        style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.center,
                                      )
                                  ),
                                // ),
                              ],
                            ),
                          )
                              :
                          Container(
                            width: width,
                            child: Column(
                              children: [
                                SizedBox(height: height*0.15,),
                                Container(
                                    width: width*0.7,
                                    child: Text('Don\'t miss the stories your friends are recommending on marked.',
                                      style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,
                                    )
                                ),

                                SizedBox(height: height/30,),
                                GestureDetector(
                                  // onTap: () => Navigator.pushNamed(context, '/followPage'),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: HexToColor(MyConstants.redClr),
                                          borderRadius: BorderRadius.all(Radius.circular(width/10))
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                      child: Text('Connect Twitter',
                                        style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.center,
                                      )
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _contactTap() {
    setState(() {
      isContactCalled=true;
      isPeopleCalled=false;
      isTwitterCalled=false;
    });
  }

  void _peopleTap() {
    setState(() {
      isContactCalled=false;
      isTwitterCalled=false;
      isPeopleCalled=true;
    });
  }

  void _twitterTap() {
    setState(() {
      isContactCalled=false;
      isPeopleCalled=false;
      isTwitterCalled=true;
    });
  }

  void getPeopleToFollow() async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      ApiCall.getPeopleToFollow().then((value) async {
        MyConstants.hideLoadingBar();
        if (value.statusCode==200) {
          dataModel=null;
          if(json.decode(value.body)["success"]=="true"){
            dataModel = SuggestionModel.fromJson(json.decode(value.body));
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

  void followSinglePerson(BuildContext context,String id,int index) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      MyConstants.showLoadingBar(context);
      ApiCall.followThisPerson(id).then((value) async {
        MyConstants.hideLoadingBar();
        if (value.statusCode==200) {
          if(json.decode(value.body)["success"]=="true"){
            dataModel.data.removeAt(index);
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

  void followAllSuggestion(BuildContext context) async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      List<int> list=List<int>();
      for(int i=0;i<dataModel.data.length;i++){
        list.add(int.parse(dataModel.data[i].id));
      }

      print(list.toString());

      String s=list.toString().substring(1,list.toString().length-1);

      MyConstants.showLoadingBar(context);
      ApiCall.followAll(s).then((value) async {
        MyConstants.hideLoadingBar();
        if (value.statusCode==200) {
          if(json.decode(value.body)["success"]=="true"){
            _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(jsonDecode(value.body)['message'], style: TextStyle(color: Colors.white),), backgroundColor: HexToColor(MyConstants.blueClr),));
            getPeopleToFollow();
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