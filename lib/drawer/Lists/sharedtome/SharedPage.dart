import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:marked/Constants/MyConstants.dart';
import 'package:marked/Screens/SearchScreens/SearchPage.dart';
import 'package:marked/Utils/HexColor.dart';
import 'package:marked/drawer/Drawer.dart';

class SharedPage extends StatefulWidget {

  @override
  _SharedPageState createState() => new _SharedPageState();
}

class _SharedPageState extends State<SharedPage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  double height = MyConstants.height,
      width = MyConstants.width;

  bool isArcCalled=false;
  bool isMLCalled=true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              MyConstants.isFromHome=false;
              _scaffoldKey.currentState.openDrawer();
            },
            child: Image.asset('assets/menu.png',scale: 1.5,)
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/share.png',width: width*0.07,color: Colors.white,fit: BoxFit.fill,),
            SizedBox(width: width*0.03,),
            Text("Shared To Me",style: TextStyle(color: Colors.white),),
          ],
        ),
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
          IconButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage())),
              icon: Icon(Icons.search,color: Colors.white,)
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
          Container(
            width: width,
            height: height,
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
                  height: height/15,
                  width: width,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: InkWell(
                            onTap: _mlTap,
                            child: Container(

                                decoration: BoxDecoration(
                                   border: Border(bottom: BorderSide(color: isMLCalled?HexToColor(MyConstants.redClr):Colors.transparent))
                                ),
                                padding: EdgeInsets.symmetric(vertical:height/50,),
                                child:
                                Text('My List',style: TextStyle(color: isMLCalled?HexToColor(MyConstants.redClr):HexToColor(MyConstants.greyClr),fontWeight: isMLCalled?FontWeight.w600:FontWeight.w400,fontSize: height/53),textAlign: TextAlign.center,))
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                            onTap: _arcTap,
                            child: Container(

                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: isArcCalled?HexToColor(MyConstants.redClr):Colors.transparent))
                                ),
                                padding: EdgeInsets.symmetric(vertical:height/50,),
                                child:
                                Text('Archive',style: TextStyle(color: isArcCalled?HexToColor(MyConstants.redClr):HexToColor(MyConstants.greyClr),fontWeight: isArcCalled?FontWeight.w600:FontWeight.w400,fontSize: height/53),textAlign: TextAlign.center,)
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
                      child:0==0?
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width: width*0.65,
                              child: Text('No items from friends.',
                                style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),
                                maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,
                              )
                          ),
                          SizedBox(height: height/30,),
                          Container(
                              width: width*0.65,
                              child: Text('There are now items from friends in your list.',
                                style: TextStyle(color: HexToColor(MyConstants.greyClr),fontSize: 13,fontWeight: FontWeight.w500),
                                maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,
                              )
                          ),
                          SizedBox(height: height/30,),
                          Container(
                              width: width*0.65,
                              child: Text('When a friend shares something to you using send to friend and you add it to your list, it will appear here. ',
                                style: TextStyle(color: HexToColor(MyConstants.greyClr),fontSize: 13,fontWeight: FontWeight.w500),
                                maxLines: 3,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,
                              )
                          ),
                          SizedBox(height: height/20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: HexToColor(MyConstants.upperGreyClr),
                                        borderRadius: BorderRadius.all(Radius.circular(5))
                                    ),
                                    width: width*0.3,
                                    height: width*0.3,
                                  ),
                                  SizedBox(height: 10,),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: HexToColor(MyConstants.upperGreyClr),
                                        borderRadius: BorderRadius.all(Radius.circular(5))
                                    ),
                                    width: width*0.27,
                                    height: 10,
                                  ),
                                  SizedBox(height: 10,),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: HexToColor(MyConstants.lowerGreyClr),
                                        borderRadius: BorderRadius.all(Radius.circular(5))
                                    ),
                                    width: width*0.2,
                                    height: 5,
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: HexToColor(MyConstants.upperGreyClr),
                                        borderRadius: BorderRadius.all(Radius.circular(5))
                                    ),
                                    width: width*0.3,
                                    height: width*0.3,
                                  ),
                                  SizedBox(height: 10,),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: HexToColor(MyConstants.upperGreyClr),
                                        borderRadius: BorderRadius.all(Radius.circular(5))
                                    ),
                                    width: width*0.27,
                                    height: 10,
                                  ),
                                  SizedBox(height: 10,),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: HexToColor(MyConstants.lowerGreyClr),
                                        borderRadius: BorderRadius.all(Radius.circular(5))
                                    ),
                                    width: width*0.2,
                                    height: 5,
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      )
                          :
                      GridView.builder(
                        itemCount: isMLCalled?2:6,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:  2 ,
                            childAspectRatio: width/height/0.7
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return  Padding(
                            padding: EdgeInsets.all(3),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.pushNamed(context, '/detail');
                              },
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(width/50),
                                  ),
                                  child:Column(
                                    children: [
                                      Container(
                                        height: height/8,width: width,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(width/50),
                                              topRight: Radius.circular(width/50),
                                            ),
                                            // image: DecorationImage(
                                            //     fit: BoxFit.fill,
                                            //     image: NetworkImage(dummyModel.data[index].imageUrl)
                                            // )
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child:Column(
                                          children: [
                                            Text('BMW new model awesome look is here',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),maxLines: 2,overflow: TextOverflow.ellipsis,),
                                            SizedBox(height: 5,),
                                            Row(
                                              children: [
                                                Image.asset('assets/globe.png',height: height/35,),
                                                SizedBox(width: 5,),
                                                Text('New York magazine',style: TextStyle(color: Colors.black,fontSize: 10),maxLines: 2,overflow: TextOverflow.ellipsis,),
                                              ],
                                            ),
                                            SizedBox(height: 5,),
                                            Row(
                                              children: [
                                                Image.asset('assets/clock.png',height: height/35,),
                                                SizedBox(width: 5,),
                                                Text('40 Mins ago',style: TextStyle(color: Colors.black,fontSize: 10),maxLines: 2,overflow: TextOverflow.ellipsis,),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _arcTap() {
    setState(() {
      isArcCalled=true;
      isMLCalled=false;
    });
  }

  void _mlTap() {
    setState(() {
      isArcCalled=false;
      isMLCalled=true;
    });
  }
}