import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:package_info/package_info.dart';
import 'package:marked/Constants/MyConstants.dart';
import 'package:marked/Utils/HexColor.dart';

class OptionsPage extends StatefulWidget {

  @override
  _OptionsPageState createState() => new _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {

  double height = MyConstants.height,
      width = MyConstants.width;

  String version='1.0.0';

  bool isSwitchThemeAutomatically = false;
  bool isMatchSystemTheme = false;


  bool isOpenBestView = false;
  bool isScrollbar = false;
  bool isPageFlipping = false;
  bool isJustifyText = false;
  bool isContinueReading = false;


  bool isDownloadBestView = false;
  bool isDownloadOnlyWifi = false;
  bool isUseMobileUser = false;


  bool isRefreshOnOpen = false;
  bool isShowBadgeCount = false;


  bool isOptionVisible = false;


  List<String> themeOptions=['Light','Dark','Sepia'];
  List<String> browseOptions=['Google Chrome','Safari'];
  List<String> sortOptions=['Newest First','Oldest First'];

  List<String> dummyList=List<String>();

  String title='';


  @override
  void initState() {
    super.initState();
    getVersionNumber();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.close,color: Colors.white,),
        ),
        title: Text("Options",style: TextStyle(color: Colors.white),),
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(width/30)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Your Account',style: TextStyle(color: HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w600,fontSize: 16),),
                                SizedBox(height: height/40,),
                                Row(
                                  children: [
                                    Text('Go Premium',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 16),),
                                    Expanded(child: Container()),
                                    Icon(Icons.arrow_forward_ios),
                                  ],
                                ),
                                SizedBox(height: height/40,),
                                Row(
                                  children: [
                                    Text('Restore Existing Subscription',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 16),),
                                    Expanded(child: Container()),
                                    Icon(Icons.arrow_forward_ios),
                                  ],
                                ),
                                SizedBox(height: height/40,),
                                InkWell(
                                  onTap: ()=>Navigator.pushNamed(context, '/editProfile'),
                                  child: Row(
                                    children: [
                                      Text('Edit Profile',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 16),),
                                      Expanded(child: Container()),
                                      Icon(Icons.arrow_forward_ios),
                                    ],
                                  ),
                                ),
                                SizedBox(height: height/40,),
                                InkWell(
                                  onTap: ()=>Navigator.pushNamed(context, '/help'),
                                  child: Row(
                                    children: [
                                      Text('Help',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 16),),
                                      Expanded(child: Container()),
                                      Icon(Icons.arrow_forward_ios),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/login', (Route<dynamic> route) => false);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: HexToColor(MyConstants.redClr).withOpacity(0.2),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(width/30),
                                    bottomRight: Radius.circular(width/30),
                                  )
                              ),

                              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Text('Logout',style: TextStyle(color: HexToColor(MyConstants.redClr),fontWeight: FontWeight.w600,fontSize: 16),),

                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(width/30)
                      ),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('App Theme',style: TextStyle(color: HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w600,fontSize: 16),),
                            SizedBox(height: height/40,),
                            InkWell(
                              onTap: (){
                                dummyList.clear();
                                dummyList.addAll(themeOptions);
                                title='Theme';
                                setState(() {
                                  isOptionVisible=true;
                                });
                              },
                              child: Row(
                                children: [
                                  Text('Theme',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 15),),
                                  Expanded(child: Container()),
                                  Icon(Icons.arrow_forward_ios),
                                ],
                              ),
                            ),
                            SizedBox(height: height/40,),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Switch theme automatically',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 15),),
                                    Text('Automatically switch between dark or \nlight theme based on screen brightness.',maxLines: 2,style: TextStyle(color: HexToColor(MyConstants.greyClr,),fontWeight: FontWeight.w400,fontSize: 12),),
                                  ],
                                ),
                                Expanded(child: Container()),
                                // SizedBox(width: width/20,),
                                Switch(
                                    activeTrackColor: Colors.lightGreen.shade500,
                                    activeColor: Colors.white,
                                    inactiveTrackColor: HexToColor(MyConstants.lightGreyClr),
                                    inactiveThumbColor:Colors.white ,
                                    value: isSwitchThemeAutomatically,
                                    onChanged: (value){
                                      setState(() {
                                        isSwitchThemeAutomatically=value;
                                      });
                                    }),
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text('Match system theme',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 15),),
                                    // Text('Automatically switch between dark or light theme based on screen brightness.',style: TextStyle(color: HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w600,fontSize: 12),),
                                  ],
                                ),
                                Expanded(child: Container()),
                                SizedBox(width: width/20,),
                                Switch(
                                    activeTrackColor: Colors.lightGreen.shade500,
                                    activeColor: Colors.white,
                                    inactiveTrackColor: HexToColor(MyConstants.lightGreyClr),
                                    inactiveThumbColor:Colors.white ,
                                    value: isMatchSystemTheme,
                                    onChanged: (value){
                                      setState(() {
                                        isMatchSystemTheme=value;
                                      });
                                    }),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(width/30))
                      ),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Reading',style: TextStyle(color: HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w600,fontSize: 16),),
                            SizedBox(height: height/40,),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Open Best view',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 15),),
                                    Text('Marked will automatically decide the\n best view (Article or web view) to show.',maxLines: 2,style: TextStyle(color: HexToColor(MyConstants.greyClr,),fontWeight: FontWeight.w400,fontSize: 12),),
                                  ],
                                ),
                                Expanded(child: Container()),
                                // SizedBox(width: width/20,),
                                Switch(
                                    activeTrackColor: Colors.lightGreen.shade500,
                                    activeColor: Colors.white,
                                    inactiveTrackColor: HexToColor(MyConstants.lightGreyClr),
                                    inactiveThumbColor:Colors.white ,
                                    value: isOpenBestView,
                                    onChanged: (value){
                                      setState(() {
                                        isOpenBestView=value;
                                      });
                                    }),
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text('Scrollbar',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 15),),
                                    // Text('Automatically switch between dark or light theme based on screen brightness.',style: TextStyle(color: HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w600,fontSize: 12),),
                                  ],
                                ),
                                Expanded(child: Container()),
                                SizedBox(width: width/20,),
                                Switch(
                                    activeTrackColor: Colors.lightGreen.shade500,
                                    activeColor: Colors.white,
                                    inactiveTrackColor: HexToColor(MyConstants.lightGreyClr),
                                    inactiveThumbColor:Colors.white ,
                                    value: isScrollbar,
                                    onChanged: (value){
                                      setState(() {
                                        isScrollbar=value;
                                      });
                                    }),
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Page flipping',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 15),),
                                    Text('Enable page flipping by swiping\nleft and right.',maxLines: 2,style: TextStyle(color: HexToColor(MyConstants.greyClr,),fontWeight: FontWeight.w400,fontSize: 12),),
                                  ],
                                ),
                                Expanded(child: Container()),
                                // SizedBox(width: width/20,),
                                Switch(
                                    activeTrackColor: Colors.lightGreen.shade500,
                                    activeColor: Colors.white,
                                    inactiveTrackColor: HexToColor(MyConstants.lightGreyClr),
                                    inactiveThumbColor:Colors.white ,
                                    value: isPageFlipping,
                                    onChanged: (value){
                                      setState(() {
                                        isPageFlipping=value;
                                      });
                                    }),
                              ],
                            ),
                            SizedBox(height: height/40,),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Justify text',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 15),),
                                    Text('Justify and hyphenate text in Article\n view when possible.',maxLines: 2,style: TextStyle(color: HexToColor(MyConstants.greyClr,),fontWeight: FontWeight.w400,fontSize: 12),),
                                  ],
                                ),
                                Expanded(child: Container()),
                                // SizedBox(width: width/20,),
                                Switch(
                                    activeTrackColor: Colors.lightGreen.shade500,
                                    activeColor: Colors.white,
                                    inactiveTrackColor: HexToColor(MyConstants.lightGreyClr),
                                    inactiveThumbColor:Colors.white ,
                                    value: isJustifyText,
                                    onChanged: (value){
                                      setState(() {
                                        isJustifyText=value;
                                      });
                                    }),
                              ],
                            ),
                            SizedBox(height: height/40,),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Continue reading',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 15),),
                                    Text('Display the last item I was in the\n middle ofwhen I return to pocket.',maxLines: 2,style: TextStyle(color: HexToColor(MyConstants.greyClr,),fontWeight: FontWeight.w400,fontSize: 12),),
                                  ],
                                ),
                                Expanded(child: Container()),
                                // SizedBox(width: width/20,),
                                Switch(
                                    activeTrackColor: Colors.lightGreen.shade500,
                                    activeColor: Colors.white,
                                    inactiveTrackColor: HexToColor(MyConstants.lightGreyClr),
                                    inactiveThumbColor:Colors.white ,
                                    value: isContinueReading,
                                    onChanged: (value){
                                      setState(() {
                                        isContinueReading=value;
                                      });
                                    }),
                              ],
                            ),
                            SizedBox(height: height/40,),
                            InkWell(
                              onTap: (){
                                dummyList.clear();
                                dummyList.addAll(browseOptions);
                                title='Set Browser Preference';
                                setState(() {
                                  isOptionVisible=true;
                                });
                              },
                              child: Row(
                                children: [
                                  Text('Set Browser Preference',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 16),),
                                  Expanded(child: Container()),
                                  Text('Safari',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w400,fontSize: 14),),
                                  Icon(Icons.arrow_forward_ios),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(width/30))
                      ),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Offline Downloading',style: TextStyle(color: HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w600,fontSize: 16),),
                            SizedBox(height: height/40,),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text('Download Best View',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 15),),
                                    // Text('Automatically switch between dark or light theme based on screen brightness.',style: TextStyle(color: HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w600,fontSize: 12),),
                                  ],
                                ),
                                Expanded(child: Container()),
                                SizedBox(width: width/20,),
                                Switch(
                                    activeTrackColor: Colors.lightGreen.shade500,
                                    activeColor: Colors.white,
                                    inactiveTrackColor: HexToColor(MyConstants.lightGreyClr),
                                    inactiveThumbColor:Colors.white ,
                                    value: isDownloadBestView,
                                    onChanged: (value){
                                      setState(() {
                                        isDownloadBestView=value;
                                      });
                                    }),
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text('Download only on Wi-Fi',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 15),),
                                    // Text('Automatically switch between dark or light theme based on screen brightness.',style: TextStyle(color: HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w600,fontSize: 12),),
                                  ],
                                ),
                                Expanded(child: Container()),
                                SizedBox(width: width/20,),
                                Switch(
                                    activeTrackColor: Colors.lightGreen.shade500,
                                    activeColor: Colors.white,
                                    inactiveTrackColor: HexToColor(MyConstants.lightGreyClr),
                                    inactiveThumbColor:Colors.white ,
                                    value: isDownloadOnlyWifi,
                                    onChanged: (value){
                                      setState(() {
                                        isDownloadOnlyWifi=value;
                                      });
                                    }),
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text('Use mobile user argent',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 15),),
                                    // Text('Automatically switch between dark or light theme based on screen brightness.',style: TextStyle(color: HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w600,fontSize: 12),),
                                  ],
                                ),
                                Expanded(child: Container()),
                                SizedBox(width: width/20,),
                                Switch(
                                    activeTrackColor: Colors.lightGreen.shade500,
                                    activeColor: Colors.white,
                                    inactiveTrackColor: HexToColor(MyConstants.lightGreyClr),
                                    inactiveThumbColor:Colors.white ,
                                    value: isUseMobileUser,
                                    onChanged: (value){
                                      setState(() {
                                        isUseMobileUser=value;
                                      });
                                    }),
                              ],
                            ),
                            SizedBox(height: height/40,),
                            Row(
                              children: [
                                Text('Clear Download Files',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 16),),
                                Expanded(child: Container()),
                                Icon(Icons.arrow_forward_ios),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(width/30))
                      ),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('List',style: TextStyle(color: HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w600,fontSize: 16),),
                            SizedBox(height: height/40,),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text('Refresh when app opens',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 15),),
                                    // Text('Automatically switch between dark or light theme based on screen brightness.',style: TextStyle(color: HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w600,fontSize: 12),),
                                  ],
                                ),
                                Expanded(child: Container()),
                                SizedBox(width: width/20,),
                                Switch(
                                    activeTrackColor: Colors.lightGreen.shade500,
                                    activeColor: Colors.white,
                                    inactiveTrackColor: HexToColor(MyConstants.lightGreyClr),
                                    inactiveThumbColor:Colors.white ,
                                    value: isRefreshOnOpen,
                                    onChanged: (value){
                                      setState(() {
                                        isRefreshOnOpen=value;
                                      });
                                    }),
                              ],
                            ),
                            InkWell(
                              onTap: (){
                                dummyList.clear();
                                dummyList.addAll(sortOptions);
                                title='Sort';
                                setState(() {
                                  isOptionVisible=true;
                                });
                              },
                              child: Row(
                                children: [
                                  Text('Sort',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 16),),
                                  Expanded(child: Container()),
                                  Text('Newest First',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w400,fontSize: 14),),
                                  Icon(Icons.arrow_forward_ios),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text('Show app badge count',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 15),),
                                    // Text('Automatically switch between dark or light theme based on screen brightness.',style: TextStyle(color: HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w600,fontSize: 12),),
                                  ],
                                ),
                                Expanded(child: Container()),
                                SizedBox(width: width/20,),
                                Switch(
                                    activeTrackColor: Colors.lightGreen.shade500,
                                    activeColor: Colors.white,
                                    inactiveTrackColor: HexToColor(MyConstants.lightGreyClr),
                                    inactiveThumbColor:Colors.white ,
                                    value: isShowBadgeCount,
                                    onChanged: (value){
                                      setState(() {
                                        isShowBadgeCount=value;
                                      });
                                    }),
                              ],
                            ),
                            SizedBox(height: height/70,),
                            InkWell(
                              onTap: ()=> Navigator.pushNamed(context, '/manageSiteLogin'),
                              child: Row(
                                children: [
                                  Text('Manage site logins',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 16),),
                                  Expanded(child: Container()),
                                  Icon(Icons.arrow_forward_ios),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(width/30))
                      ),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Notification',style: TextStyle(color: HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w600,fontSize: 16),),
                            SizedBox(height: height/40,),
                            Row(
                              children: [
                                Text('Push notification settings',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 16),),
                                Expanded(child: Container()),
                                Icon(Icons.arrow_forward_ios),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(width/30))
                      ),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Linked Accounts',style: TextStyle(color: HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w600,fontSize: 16),),
                            SizedBox(height: height/40,),
                            Row(
                              children: [
                                Text('Twitter',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 16),),
                                Expanded(child: Container()),
                                Icon(Icons.arrow_forward_ios),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(width/30))
                      ),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('About',style: TextStyle(color: HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w600,fontSize: 16),),
                            SizedBox(height: height/40,),
                            Row(
                              children: [
                                Text('Follow @app on Twitter',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 16),),
                                Expanded(child: Container()),
                                Icon(Icons.arrow_forward_ios),
                              ],
                            ),
                            SizedBox(height: height/40,),
                            Row(
                              children: [
                                Text('Follow us in Facebook',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 16),),
                                Expanded(child: Container()),
                                Icon(Icons.arrow_forward_ios),
                              ],
                            ),
                            SizedBox(height: height/40,),
                            Row(
                              children: [
                                Text('Legal & Privacy',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 16),),
                                Expanded(child: Container()),
                                Icon(Icons.arrow_forward_ios),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text('Version  '+version,style: TextStyle(color: HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w600,fontSize: 12),),
                    Text('Thank you for downloading. Enjoy!',style: TextStyle(color: HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w600,fontSize: 12),),

                  ],
                ),
              ),
            ),
            Visibility(
              visible: isOptionVisible,
              child: Container(
                padding: EdgeInsets.all(5),
                width: width,
                height: height,
                decoration: BoxDecoration(
                 color: Colors.black12,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(child: Container(),),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          Text(title,style: TextStyle(color: HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w600,fontSize: 15),),
                          SizedBox(height: 10,),
                          ListView.builder(
                              itemCount: dummyList.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context,int index){
                                return GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      isOptionVisible=false;
                                    });
                                  },
                                  child: Container(
                                    width: width,
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Center(
                                      child: Text(dummyList[index],style: TextStyle(color: HexToColor(MyConstants.appbarClrs[1]).withOpacity(0.5),fontWeight: FontWeight.w600,fontSize: 16),),
                                    ),
                                  ),
                                );
                              }
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          isOptionVisible=false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)
                        ),
                        width: width,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Center(
                          child: Text('Cancel',style: TextStyle(color: HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w600,fontSize: 17),),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getVersionNumber() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      version= packageInfo.version;
    });

    // Other data you can get:
    //
    // 	String appName = packageInfo.appName;
    // 	String packageName = packageInfo.packageName;
    //	String buildNumber = packageInfo.buildNumber;
  }
}