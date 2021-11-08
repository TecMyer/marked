import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:marked/Constants/MyConstants.dart';
import 'package:marked/Utils/HexColor.dart';
import 'package:marked/drawer/Drawer.dart';

class ProfileTab extends StatefulWidget {

  @override
  _ProfileTabState createState() => new _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab>  with AutomaticKeepAliveClientMixin<ProfileTab> {

  @override
  // ignore: todo
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  double height = MyConstants.height,
      width = MyConstants.width;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // ignore: todo
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              MyConstants.isFromHome=true;
              _scaffoldKey.currentState.openDrawer();
            },
            child: Image.asset('assets/menu.png',scale: 1.5,)
        ),
        title: Text("Profile",style: TextStyle(color: Colors.white),),
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
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/options'),
              child: Image.asset('assets/settings.png')
          ),
          SizedBox(width: width/30,)
        ],
      ),
      drawer: DrawerClass(),
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
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height*0.75,
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
                          image: NetworkImage(MyConstants.userImage!=null?MyConstants.imageBaseUrl+MyConstants.userImage:"")
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(width/20)),
                    ),
                    // child: Center(
                    //   child: Icon(Icons.person,size: width/5,),
                    // ),
                  ),
                ),
                SizedBox(height: height/30,),
                Text(MyConstants.userName??"",style: TextStyle(color: Colors.black87,fontSize: height/30,fontWeight: FontWeight.bold),),
                SizedBox(height: height/30,),
                GestureDetector(
                  onTap: () async {
                    await Navigator.pushNamed(context, '/editProfile');
                    setState(() {

                    });
                  },
                    child: Text('Add Bio',style: TextStyle(color: HexToColor(MyConstants.appbarClrs[1]),fontSize: height/40),)
                ),
                GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/followPage'),
                    child: Text('Find Friends to Follow',style: TextStyle(color:  HexToColor(MyConstants.appbarClrs[1]),fontSize: height/40),)
                ),
                SizedBox(height: height/20,),

                Container(
                  width: width*0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(width/20)),
                    color: Colors.white
                  ),
                  padding: EdgeInsets.symmetric(horizontal: width/10,vertical: height/30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('This is your profile!',style: TextStyle(color: Colors.black87,fontSize: height/45),),
                      SizedBox(height: height/40,),
                      Text('Once you recommended an item it will appear here. Your followers will also see it in their Discover Feed',style: TextStyle(color: HexToColor(MyConstants.greyClr),fontSize: height/50),textAlign: TextAlign.center,),
                    ],
                  ),
                ),
                SizedBox(height: height/20,),
                Container(
                    width: width*0.8,
                    child: Text('Note: Your list private. No one can see what you save to Marked. Only what you choose to recommend will be visible to others',
                      style: TextStyle(color: HexToColor(MyConstants.greyClr),fontSize: height/50),textAlign: TextAlign.center,)
                ),

              ],
            ),
          )
        ],
      ),
    );
  }

}