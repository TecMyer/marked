
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marked/Constants/MyConstants.dart';
import 'package:marked/Preferences/MySharedPreference.dart';
import 'package:marked/Utils/HexColor.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

class BoardingPage extends StatefulWidget {

  @override
  _BoardingState createState() => new _BoardingState();
}

class _BoardingState extends State<BoardingPage> {

  double height=MyConstants.height,width=MyConstants.width;


  List<String> colorsList = [
    MyConstants.redClr,
    MyConstants.blueClr,
    MyConstants.yellowClr,
  ];
  List<String> bgList = [
    'red_bg',
    'blue_bg',
    'yellow_bg',
  ];
  List<String> imgList = [
    'first',
    'second',
    'third',
  ];

  List<String> titleList = [
    'Save what really interests you',
    'Make the most of any moment',
    'Your quite corner of the internet',
  ];
  List<String> subtitleList = [
    'Collect articles, videos or any online content you like. Settle in with them anytime, on any phone,tablet or browser.',
    'Save from safari, Twitter, YouTube or your favorite news app (for starters). Your articles and videos will be ready for you in Marked.',
    'Marked saves articles in a clean layout designed for reading-no interruptions, no popup-so you can sidestep the internet\'s noise.',
  ];

  final _controller = new IndexController();


  @override
  void initState() {
    super.initState();
    setFirstTimeFalse();
  }

  @override
  Widget build(BuildContext context) {

    return Material(
      child: new TransformerPageView(
          loop: false,
          controller: _controller,
          itemBuilder: (BuildContext context, index) {
            return Container(
              color: Colors.white,
              child:Column(
                children: [
                  Stack(
                    children: [
                      Image.asset('assets/'+bgList[index]+'.png',height: height*0.7,width: width,fit: BoxFit.fill,),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.all(Radius.circular(width))
                          ),
                          margin: EdgeInsets.only(top: height/10),
                          padding: EdgeInsets.all(20),
                          child: Image.asset('assets/'+imgList[index]+'.png',height: height/3.5,),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: height/30,),
                  Container(
                    width: width*0.8,
                    child: Column(
                      children: [
                        Text(titleList[index],textAlign:TextAlign.center,style: TextStyle(color: Colors.black87,fontSize: 16,fontWeight: FontWeight.w800),),
                        SizedBox(height: height/30,),
                        Text(subtitleList[index],textAlign:TextAlign.center,style: TextStyle(color: Colors.black54,fontSize: 14,fontWeight: FontWeight.w300),)
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                  Row(
                    children: [
                      SizedBox(width: width*0.1,),
                      Container(
                        margin: EdgeInsets.only(right: width*0.02),
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          color: index==0?HexToColor(colorsList[0]):Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(8))
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: width*0.02),
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          color: index==1?HexToColor(colorsList[0]):Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(8))
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: width*0.02),
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          color: index==2?HexToColor(colorsList[0]):Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(8))
                        ),
                      ),
                      Expanded(child: Container()),

                      index<2?
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            _controller.next();
                            // index=index+1;
                          });
                        },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: HexToColor(colorsList[0]),
                                shape: BoxShape.circle
                            ),
                            child: Icon(Icons.arrow_forward_sharp,color: Colors.white,),
                          )
                      ):
                      GestureDetector(
                        onTap: (){
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                          decoration: BoxDecoration(
                              color: HexToColor(colorsList[0]),
                              borderRadius: BorderRadius.all(Radius.circular(width))
                              // shape: BoxShape.circle
                          ),
                          child: Text('Get Started',style: TextStyle(color: Colors.white),),
                        ),
                      ),
                      SizedBox(width: width*0.07,),
                    ],
                  ),
                  Expanded(child: Container()),
                ],
              )
            );
          },
          itemCount: 3,
      ),
    );
  }

  Future<void> setFirstTimeFalse() async {
    MySharedPreferennce mySharedPreferennce=MySharedPreferennce();
    await mySharedPreferennce.setFirstTime(false);
  }
}