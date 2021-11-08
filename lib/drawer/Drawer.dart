import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:marked/Constants/MyConstants.dart';
import 'package:marked/Preferences/MySharedPreference.dart';
import 'package:marked/Utils/HexColor.dart';

class DrawerClass extends StatefulWidget{

  @override
  State createState() {
    return _DrawerClass();
  }
}

class _DrawerClass extends State<DrawerClass> {

  double height = MyConstants.height,
      width = MyConstants.width;

  int tappedIndex=0;

  MySharedPreferennce mySharedPreferennce = new MySharedPreferennce();

  List<String> tagsList=['Not Tagged'];


  @override
  void initState() {
    super.initState();
    if(MyConstants.tappedIndex!=null){
      tappedIndex=MyConstants.tappedIndex;
    }
    getTagList();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Scaffold(
      body: Container(
        width: width,
        child: SafeArea(
          child: Drawer(
            child: Stack(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            HexToColor(MyConstants.appbarClrs[0]),
                            HexToColor(MyConstants.appbarClrs[1])
                          ]
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                    left: 5,
                    child: IconButton(
                      onPressed: (){
                        MyConstants.tappedIndex=null;
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close,color: Colors.white,),
                    )
                ),
                Column(
                  children: [
                    SizedBox(height: height*0.1,),
                    Expanded(
                      child: Container(
                          width: width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(width/12),
                              topLeft: Radius.circular(width/12),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: width/20,vertical: height/30),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  margin: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(width/20),),
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage('assets/gray_bg.png')
                                      )
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          padding: EdgeInsets.only(left: 20),
                                          child: Text('Lists',style: TextStyle(color: HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w600,fontSize: 16),)
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          if(tappedIndex!=0){
                                            setState(() {
                                              tappedIndex=0;
                                            });
                                          }else{
                                            MyConstants.tappedIndex=0;
                                            Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
                                          }
                                        },
                                        child: Container(
                                          margin: EdgeInsets.symmetric(vertical: 5),
                                          padding: EdgeInsets.symmetric(vertical: height/150),
                                          decoration: BoxDecoration(
                                            color:tappedIndex==0?HexToColor(MyConstants.redClr).withOpacity(0.05): Colors.transparent,
                                            border: Border(
                                              left: BorderSide(
                                                color: tappedIndex==0?HexToColor(MyConstants.redClr):Colors.transparent,
                                                width: tappedIndex==0?3.0:0.0,
                                              ),
                                            ),
                                          ),

                                          child:Row(
                                            children: [
                                              SizedBox(width: width*0.07,),
                                              Image.asset('assets/home_fill.png',
                                                width: width*0.08,
                                                color: tappedIndex==0?HexToColor(MyConstants.redClr):HexToColor(MyConstants.greyClr),
                                                fit: BoxFit.fill,),
                                              SizedBox(width: width*0.03,),
                                              Text('Home',
                                                style: TextStyle(color: tappedIndex==0?HexToColor(MyConstants.redClr):HexToColor(MyConstants.greyClr),
                                                    fontWeight: FontWeight.w500,fontSize: 16),)
                                            ],
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                          onTap: (){
                                            if(tappedIndex!=1){
                                              setState(() {
                                                tappedIndex=1;
                                              });
                                            }else{
                                              Navigator.pop(context);
                                              MyConstants.tappedIndex=1;
                                              if(MyConstants.isFromHome){
                                                Navigator.pushNamed(context, '/archive');
                                              }else{
                                                Navigator.pushReplacementNamed(context, '/archive');
                                              }
                                            }
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(vertical: height/150),
                                            decoration: BoxDecoration(
                                              color:tappedIndex==1?HexToColor(MyConstants.redClr).withOpacity(0.05): Colors.transparent,
                                              border: Border(
                                                left: BorderSide(
                                                  color: tappedIndex==1?HexToColor(MyConstants.redClr):Colors.transparent,
                                                  width: tappedIndex==1?3.0:0.0,
                                                ),
                                              ),
                                            ),

                                            child:Row(
                                              children: [
                                                SizedBox(width: width*0.07,),
                                                Image.asset('assets/archive.png',
                                                  width: width*0.08,
                                                  color: tappedIndex==1?HexToColor(MyConstants.redClr):HexToColor(MyConstants.greyClr),
                                                  fit: BoxFit.fill,),
                                                SizedBox(width: width*0.03,),
                                                Text('Archive',
                                                  style: TextStyle(color: tappedIndex==1?HexToColor(MyConstants.redClr):HexToColor(MyConstants.greyClr),
                                                      fontWeight: FontWeight.w500,fontSize: 16),)
                                              ],
                                            ),
                                          )

                                      ),
                                      GestureDetector(
                                          onTap: (){
                                            if(tappedIndex!=2){
                                              setState(() {
                                                tappedIndex=2;
                                              });
                                            }else{
                                              Navigator.pop(context);
                                              MyConstants.tappedIndex=2;
                                              if(MyConstants.isFromHome){
                                                Navigator.pushNamed(context, '/favourite');
                                              }else{
                                                Navigator.pushReplacementNamed(context, '/favourite');
                                              }
                                            }

                                          },
                                          child: Container(
                                            margin: EdgeInsets.symmetric(vertical: 5),
                                            // margin: EdgeInsets.symmetric(vertical: height/200),
                                            padding: EdgeInsets.symmetric(vertical: height/150),
                                            decoration: BoxDecoration(
                                              color:tappedIndex==2?HexToColor(MyConstants.redClr).withOpacity(0.05): Colors.transparent,
                                              border: Border(
                                                left: BorderSide(
                                                  color: tappedIndex==2?HexToColor(MyConstants.redClr):Colors.transparent,
                                                  width: tappedIndex==2?3.0:0.0,
                                                ),
                                              ),
                                            ),

                                            child:Row(
                                              children: [
                                                SizedBox(width: width*0.07,),
                                                Image.asset('assets/star_fill.png',
                                                  width: width*0.08,
                                                  color: tappedIndex==2?HexToColor(MyConstants.redClr):HexToColor(MyConstants.greyClr),
                                                  fit: BoxFit.fill,),
                                                SizedBox(width: width*0.03,),
                                                Text('Favourites',
                                                  style: TextStyle(color: tappedIndex==2?HexToColor(MyConstants.redClr):HexToColor(MyConstants.greyClr),
                                                      fontWeight: FontWeight.w500,fontSize: 16),)
                                              ],
                                            ),
                                          )
                                      ),
                                      GestureDetector(
                                          onTap: (){
                                            if(tappedIndex!=3){
                                              setState(() {
                                                tappedIndex=3;
                                              });
                                            }else{
                                              Navigator.pop(context);
                                              MyConstants.tappedIndex=3;
                                              if(MyConstants.isFromHome){
                                                Navigator.pushNamed(context, '/highlight');
                                              }else{
                                                Navigator.pushReplacementNamed(context, '/highlight');
                                              }
                                            }
                                          },
                                          child: Container(
                                            // margin: EdgeInsets.symmetric(vertical: height/200),
                                            padding: EdgeInsets.symmetric(vertical: height/150),
                                            decoration: BoxDecoration(
                                              color: tappedIndex==3?HexToColor(MyConstants.redClr).withOpacity(0.05): Colors.transparent,
                                              border: Border(
                                                left: BorderSide(
                                                  color: tappedIndex==3?HexToColor(MyConstants.redClr):Colors.transparent,
                                                  width: tappedIndex==3?3.0:0.0,
                                                ),
                                              ),
                                            ),

                                            child:Row(
                                              children: [
                                                SizedBox(width: width*0.07,),
                                                Image.asset('assets/highlight.png',width: width*0.08,color: tappedIndex==3?HexToColor(MyConstants.redClr):HexToColor(MyConstants.greyClr),fit: BoxFit.fill,),
                                                SizedBox(width: width*0.03,),
                                                Text('Highlights',style: TextStyle(color: tappedIndex==3?HexToColor(MyConstants.redClr):HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w500,fontSize: 16),)
                                              ],
                                            ),
                                          )
                                      ),
                                      GestureDetector(
                                          onTap: (){
                                            if(tappedIndex!=4){
                                              setState(() {
                                                tappedIndex=4;
                                              });
                                            }else{
                                              Navigator.pop(context);
                                              MyConstants.tappedIndex=4;
                                              if(MyConstants.isFromHome){
                                                Navigator.pushNamed(context, '/shared');
                                              }else{
                                                Navigator.pushReplacementNamed(context, '/shared');
                                              }
                                            }

                                          },
                                          child:Container(
                                            margin: EdgeInsets.symmetric(vertical: 5),
                                            padding: EdgeInsets.symmetric(vertical: height/150),
                                            decoration: BoxDecoration(
                                              color:tappedIndex==4?HexToColor(MyConstants.redClr).withOpacity(0.05): Colors.transparent,
                                              border: Border(
                                                left: BorderSide(
                                                  color: tappedIndex==4?HexToColor(MyConstants.redClr):Colors.transparent,
                                                  width: tappedIndex==4?3.0:0.0,
                                                ),
                                              ),
                                            ),

                                            child:Row(
                                              children: [
                                                SizedBox(width: width*0.07,),
                                                Image.asset('assets/share.png',width: width*0.08,color: tappedIndex==4?HexToColor(MyConstants.redClr):HexToColor(MyConstants.greyClr),fit: BoxFit.fill,),
                                                SizedBox(width: width*0.03,),
                                                Text('Shared to me',style: TextStyle(color: tappedIndex==4?HexToColor(MyConstants.redClr):HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w500,fontSize: 16),)
                                              ],
                                            ),
                                          )

                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  margin: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(width/20),),
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage('assets/gray_bg.png')
                                      )
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          padding: EdgeInsets.only(left: 20),
                                          child: Text('Content Type',style: TextStyle(color: HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w600,fontSize: 16),)),
                                      GestureDetector(
                                          onTap: (){
                                            if(tappedIndex!=5){
                                              setState(() {
                                                tappedIndex=5;
                                              });
                                            }else{
                                              Navigator.pop(context);
                                              MyConstants.tappedIndex=5;
                                              if(MyConstants.isFromHome){
                                                Navigator.pushNamed(context, '/article');
                                              }else{
                                                Navigator.pushReplacementNamed(context, '/article');
                                              }
                                            }

                                          },
                                          child:Container(
                                            margin: EdgeInsets.symmetric(vertical: 5),
                                            padding: EdgeInsets.symmetric(vertical: height/150),
                                            decoration: BoxDecoration(
                                              color:tappedIndex==5?HexToColor(MyConstants.redClr).withOpacity(0.05): Colors.transparent,
                                              border: Border(
                                                left: BorderSide(
                                                  color: tappedIndex==5?HexToColor(MyConstants.redClr):Colors.transparent,
                                                  width: tappedIndex==5?3.0:0.0,
                                                ),
                                              ),
                                            ),

                                            child:Row(
                                              children: [
                                                SizedBox(width: width*0.07,),
                                                Image.asset('assets/article.png',width: width*0.08,color: tappedIndex==5?HexToColor(MyConstants.redClr):HexToColor(MyConstants.greyClr),fit: BoxFit.fill,),
                                                SizedBox(width: width*0.03,),
                                                Text('Article',style: TextStyle(color: tappedIndex==5?HexToColor(MyConstants.redClr):HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w500,fontSize: 16),)
                                              ],
                                            ),
                                          )
                                      ),
                                      GestureDetector(
                                          onTap: (){
                                            if(tappedIndex!=6){
                                              setState(() {
                                                tappedIndex=6;
                                              });
                                            }else{
                                              Navigator.pop(context);
                                              MyConstants.tappedIndex=6;
                                              if(MyConstants.isFromHome){
                                                Navigator.pushNamed(context, '/videos');
                                              }else{
                                                Navigator.pushReplacementNamed(context, '/videos');
                                              }
                                            }
                                          },
                                          child:Container(
                                            padding: EdgeInsets.symmetric(vertical: height/150),
                                            decoration: BoxDecoration(
                                              color:tappedIndex==6?HexToColor(MyConstants.redClr).withOpacity(0.05): Colors.transparent,
                                              border: Border(
                                                left: BorderSide(
                                                  color: tappedIndex==6?HexToColor(MyConstants.redClr):Colors.transparent,
                                                  width: tappedIndex==6?3.0:0.0,
                                                ),
                                              ),
                                            ),

                                            child:Row(
                                              children: [
                                                SizedBox(width: width*0.07,),
                                                Image.asset('assets/video.png',width: width*0.08,color: tappedIndex==6?HexToColor(MyConstants.redClr):HexToColor(MyConstants.greyClr),fit: BoxFit.fill,),
                                                SizedBox(width: width*0.03,),
                                                Text('Videos',style: TextStyle(color: tappedIndex==6?HexToColor(MyConstants.redClr):HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w500,fontSize: 16),)
                                              ],
                                            ),
                                          )
                                      ),
                                      GestureDetector(
                                          onTap: (){
                                            if(tappedIndex!=7){
                                              setState(() {
                                                tappedIndex=7;
                                              });
                                            }else{
                                              Navigator.pop(context);
                                              MyConstants.tappedIndex=7;
                                              if(MyConstants.isFromHome){
                                                Navigator.pushNamed(context, '/bestOf');
                                              }else{
                                                Navigator.pushReplacementNamed(context, '/bestOf');
                                              }
                                            }

                                          },
                                          child:Container(
                                            margin: EdgeInsets.symmetric(vertical: 5),
                                            padding: EdgeInsets.symmetric(vertical: height/150),
                                            decoration: BoxDecoration(
                                              color:tappedIndex==7?HexToColor(MyConstants.redClr).withOpacity(0.05): Colors.transparent,
                                              border: Border(
                                                left: BorderSide(
                                                  color: tappedIndex==7?HexToColor(MyConstants.redClr):Colors.transparent,
                                                  width: tappedIndex==7?3.0:0.0,
                                                ),
                                              ),
                                            ),

                                            child:Row(
                                              children: [
                                                SizedBox(width: width*0.07,),
                                                Image.asset('assets/star_fill.png',width: width*0.08,color: tappedIndex==7?HexToColor(MyConstants.redClr):HexToColor(MyConstants.greyClr),fit: BoxFit.fill,),
                                                SizedBox(width: width*0.03,),
                                                Text('Best of',style: TextStyle(color: tappedIndex==7?HexToColor(MyConstants.redClr):HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w500,fontSize: 16),)
                                              ],
                                            ),
                                          )
                                      ),
                                      GestureDetector(
                                          onTap: (){
                                            if(tappedIndex!=8){
                                              setState(() {
                                                tappedIndex=8;
                                              });
                                            }else{
                                              Navigator.pop(context);
                                              MyConstants.tappedIndex=8;
                                              if(MyConstants.isFromHome){
                                                Navigator.pushNamed(context, '/trending');
                                              }else{
                                                Navigator.pushReplacementNamed(context, '/trending');
                                              }
                                            }
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(vertical: height/150),
                                            decoration: BoxDecoration(
                                              color:tappedIndex==8?HexToColor(MyConstants.redClr).withOpacity(0.05): Colors.transparent,
                                              border: Border(
                                                left: BorderSide(
                                                  color: tappedIndex==8?HexToColor(MyConstants.redClr):Colors.transparent,
                                                  width: tappedIndex==8?3.0:0.0,
                                                ),
                                              ),
                                            ),

                                            child:Row(
                                              children: [
                                                SizedBox(width: width*0.07,),
                                                Image.asset('assets/trending.png',width: width*0.08,color: tappedIndex==8?HexToColor(MyConstants.redClr):HexToColor(MyConstants.greyClr),fit: BoxFit.fill,),
                                                SizedBox(width: width*0.03,),
                                                Text('Trending',style: TextStyle(color: tappedIndex==8?HexToColor(MyConstants.redClr):HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w500,fontSize: 16),)
                                              ],
                                            ),
                                          )
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(20),
                                  margin: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(width/20),),
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage('assets/gray_bg.png')
                                      )
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text("Tags",style: TextStyle(color: HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w600,fontSize: 16),),
                                          Expanded(child: Container()),
                                          GestureDetector(
                                            onTap: ()async{
                                              MyConstants.isFromDrawer=true;
                                              await Navigator.pushNamed(context, '/addTags');
                                              getTagList();
                                            },
                                            child: Text("Edit",
                                              style: TextStyle(color: HexToColor(MyConstants.blueClr),fontWeight: FontWeight.w600,fontSize: 16),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: height/40,),

                                      ListView.builder(
                                        itemCount: tagsList.length,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: (){
                                              if(index==0){
                                                MyConstants.tappedIndex=null;
                                                Navigator.pop(context);
                                                if(MyConstants.isFromHome){
                                                  Navigator.pushNamed(context, '/noTag');
                                                }else{
                                                  Navigator.pushReplacementNamed(context, '/noTag');
                                                }
                                              }else{

                                              }
                                            },
                                            child: Container(
                                              margin: EdgeInsets.symmetric(vertical: height/120),
                                              child:Row(
                                                children: [
                                                  SizedBox(width: width*0.07,),
                                                  Text(tagsList[index],style: TextStyle(color: HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w400,fontSize: 16),)
                                                ],
                                              ),
                                            )
                                          );
                                        },
                                      ),
                                      // GestureDetector(
                                      //   onTap: (){
                                      //     MyConstants.tappedIndex=null;
                                      //     Navigator.pop(context);
                                      //     if(MyConstants.isFromHome){
                                      //       Navigator.pushNamed(context, '/noTag');
                                      //     }else{
                                      //       Navigator.pushReplacementNamed(context, '/noTag');
                                      //     }
                                      //
                                      //   },
                                      //   child: Container(
                                      //     child:Row(
                                      //       children: [
                                      //         SizedBox(width: width*0.07,),
                                      //         Text('Not Tagged',style: TextStyle(color: HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w400,fontSize: 16),)
                                      //       ],
                                      //     ),
                                      //   ),
                                      // ),
                                      // SizedBox(height: height/60,),
                                      // GestureDetector(
                                      //   onTap: (){
                                      //     MyConstants.tappedIndex=null;
                                      //     Navigator.pop(context);
                                      //     if(MyConstants.isFromHome){
                                      //       Navigator.pushNamed(context, '/beauty');
                                      //     }else{
                                      //       Navigator.pushReplacementNamed(context, '/beauty');
                                      //     }
                                      //
                                      //   },
                                      //   child: Container(
                                      //     child:Row(
                                      //       children: [
                                      //         SizedBox(width: width*0.07,),
                                      //         Text('Beauty',style: TextStyle(color: HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w400,fontSize: 16),)
                                      //       ],
                                      //     ),
                                      //   ),
                                      // ),
                                      // SizedBox(height: height/60,),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                      )
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getTagList() async{
    List<String> list = await mySharedPreferennce.getTagList();
    tagsList.addAll(list);
    setState(() {

    });
  }
}