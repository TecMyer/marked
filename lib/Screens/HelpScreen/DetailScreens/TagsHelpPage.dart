import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:marked/Constants/MyConstants.dart';
import 'package:marked/Utils/HexColor.dart';

class TagsHelpPage extends StatefulWidget {

  @override
  _TagsHelpPageState createState() => new _TagsHelpPageState();
}

class _TagsHelpPageState extends State<TagsHelpPage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  double height = MyConstants.height,
      width = MyConstants.width;

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios,color: Colors.white,)
        ),
        title:Text("Tags", style: TextStyle(color: Colors.white),),

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
      body: Stack(
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                HexToColor(MyConstants.appbarClrs[0]),
                HexToColor(MyConstants.appbarClrs[1])
              ]),
            ),
          ),
          Container(
            width: width,
            height: height,
            padding: EdgeInsets.symmetric(
                horizontal: width / 15, vertical: height / 30),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(width / 12),
                  topLeft: Radius.circular(width / 12),
                ),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/gray_bg.png')
                )
            ),
            child:Column(
              children: [
                Text('You can even open items while you\'re offline. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,',
                  style: TextStyle(color: HexToColor(MyConstants.greyClr),fontSize: 12,fontWeight: FontWeight.w400),
                ),
                SizedBox(height: height/40,),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Welcome to App',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                            SizedBox(height: height/40,),
                            Text('When you open marked, your saved items appear in your List with the newest item on top. Just tap an item to open it.\n\nYou can even open items while you\'re offline.',
                              style: TextStyle(color: HexToColor(MyConstants.greyClr),fontSize: 12,fontWeight: FontWeight.w400),
                            ),
                            SizedBox(height: height/40,),
                          ],
                        )
                    ),
                    Expanded(
                        child: Stack(
                          children: [
                            Row(
                              mainAxisAlignment:MainAxisAlignment.end,
                              children: [
                                Image.asset('assets/help_image.png'),
                              ],
                            ),
                            // Align(
                            //  alignment: Alignment.centerLeft,
                            //     child: Container(
                            //
                            //       decoration: BoxDecoration(
                            //           color: Colors.white,
                            //         shape: BoxShape.circle
                            //       ),
                            //       child: Card(
                            //           elevation: 15,
                            //           // shape: RoundedRectangleBorder(
                            //           //     borderRadius: BorderRadius.all(Radius.circular(width))
                            //           // ),
                            //           child: Padding(
                            //               padding: EdgeInsets.symmetric(width/20),
                            //               child: Image.asset('assets/help_logo.png',height: height/25,)
                            //           )
                            //       ),
                            //     ),
                            // )
                          ],
                        )
                    ),
                  ],
                ),
                SizedBox(height: height/40,),
                Text('You can even open items while you\'re offline. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,',
                  style: TextStyle(color: HexToColor(MyConstants.greyClr),fontSize: 12,fontWeight: FontWeight.w400),
                ),
                SizedBox(height: height/40,),
              Row(
                children: [
                  Expanded(
                      child: Row(
                        children: [
                          Image.asset('assets/help_image.png'),
                        ],
                      )
                  ),
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Welcome to App',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                          SizedBox(height: height/40,),
                          Text('When you open marked, your saved items appear in your List with the newest item on top. Just tap an item to open it.\n\nYou can even open items while you\'re offline.',
                            style: TextStyle(color: HexToColor(MyConstants.greyClr),fontSize: 12,fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: height/40,),
                        ],
                      )
                  ),
                ],
              )
              ],
            )

            // ListView.builder(
            //     itemCount: 6,
            //     shrinkWrap: true,
            //     itemBuilder: (BuildContext context,int index){
            //       return index%2==0?
            //       Card(
            //         shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(20)
            //         ),
            //         child: Padding(
            //           padding: EdgeInsets.only(left: width/30,right: width/30,top: height/40),
            //           child: Row(
            //             children: [
            //               Expanded(
            //                   child: Column(
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: [
            //                       Text('From your apps',style: TextStyle(color: HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w600,fontSize: 16),),
            //                       SizedBox(height: height/40,),
            //                       Text('Enable the Marked share extension to save from Safari, or any of your favorite apps like Twitter and Flipboard.',
            //                         style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w400),
            //                       ),
            //                       SizedBox(height: height/40,),
            //                       Row(
            //                         mainAxisAlignment: MainAxisAlignment.center,
            //                         children: [
            //                           Container(
            //                               decoration: BoxDecoration(
            //                                   color: HexToColor(MyConstants.redClr),
            //                                   borderRadius: BorderRadius.all(Radius.circular(width/10))
            //                               ),
            //                               padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            //                               child: Text('Enable',
            //                                 style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500),
            //                                 textAlign: TextAlign.center,
            //                               )
            //                           ),
            //                         ],
            //                       ),
            //                       SizedBox(height: height/40,),
            //                     ],
            //                   )
            //               ),
            //               Expanded(
            //                   child: Stack(
            //                     children: [
            //                       Row(
            //                         mainAxisAlignment:MainAxisAlignment.end,
            //                         children: [
            //                           Image.asset('assets/help_image.png'),
            //                         ],
            //                       ),
            //                       // Align(
            //                       //  alignment: Alignment.centerLeft,
            //                       //     child: Container(
            //                       //
            //                       //       decoration: BoxDecoration(
            //                       //           color: Colors.white,
            //                       //         shape: BoxShape.circle
            //                       //       ),
            //                       //       child: Card(
            //                       //           elevation: 15,
            //                       //           // shape: RoundedRectangleBorder(
            //                       //           //     borderRadius: BorderRadius.all(Radius.circular(width))
            //                       //           // ),
            //                       //           child: Padding(
            //                       //               padding: EdgeInsets.symmetric(width/20),
            //                       //               child: Image.asset('assets/help_logo.png',height: height/25,)
            //                       //           )
            //                       //       ),
            //                       //     ),
            //                       // )
            //                     ],
            //                   )
            //               ),
            //             ],
            //           ),
            //         ),
            //       )
            //           :
            //       Card(
            //         shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(20)
            //         ),
            //         child: Padding(
            //           padding: EdgeInsets.only(left: width/30,right: width/30,top: height/40),
            //           child: Row(
            //             children: [
            //               Expanded(
            //                   child: Row(
            //                     children: [
            //                       Image.asset('assets/help_image.png'),
            //                     ],
            //                   )
            //               ),
            //               Expanded(
            //                   child: Column(
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: [
            //                       Text('From your apps',style: TextStyle(color: HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w600,fontSize: 16),),
            //                       SizedBox(height: height/40,),
            //                       Text('Enable the Marked share extension to save from Safari, or any of your favorite apps like Twitter and Flipboard.',
            //                         style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w400),
            //                       ),
            //                       SizedBox(height: height/40,),
            //                       Row(
            //                         mainAxisAlignment: MainAxisAlignment.center,
            //                         children: [
            //                           Container(
            //                               decoration: BoxDecoration(
            //                                   color: HexToColor(MyConstants.redClr),
            //                                   borderRadius: BorderRadius.all(Radius.circular(width/10))
            //                               ),
            //                               padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            //                               child: Text('Enable',
            //                                 style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500),
            //                                 textAlign: TextAlign.center,
            //                               )
            //                           ),
            //                         ],
            //                       ),
            //                       SizedBox(height: height/40,),
            //                     ],
            //                   )
            //               ),
            //             ],
            //           ),
            //         ),
            //       );
            //     }
            // ),
          )
        ],
      ),
    );
  }

}