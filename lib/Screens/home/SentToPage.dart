import 'package:documents_picker/documents_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';

import 'package:marked/Constants/MyConstants.dart';
import 'package:marked/Utils/HexColor.dart';

class SendToPage extends StatefulWidget {

  @override
  _SendToPageState createState() => new _SendToPageState();
}

class _SendToPageState extends State<SendToPage> {

  double height = MyConstants.height,
      width = MyConstants.width;

  bool isTwitter=false;


  List<String> tags=['Beauty','Sports','Technical'];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
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
            padding: EdgeInsets.symmetric(horizontal: width/20,vertical: height/50),
            child:SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Text('Cancel',style: TextStyle(color: HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w600,fontSize: 16),),
                      ),
                      Expanded(child: Container()),
                      Text('Send to friend',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500),maxLines: 1,overflow: TextOverflow.ellipsis,),
                      Expanded(child: Container()),
                      GestureDetector(
                        onTap: () {
                          shareFile();
                          Navigator.pop(context);
                        },
                        child: Text('Send',style: TextStyle(color: HexToColor(MyConstants.redClr),fontWeight: FontWeight.w600,fontSize: 16),),
                      )
                    ],
                  ),
                  SizedBox(height: height/80,),
                  Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(width/25))
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: height/6,width: width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(width/20),
                                    topRight: Radius.circular(width/20),
                                  ),
                                  image: DecorationImage(
                                      fit: BoxFit.fitWidth,
                                      image: AssetImage('assets/card_img.png',)
                                  )
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(15),
                              child:Column(
                                children: [
                                  Text('BMW new model awesome look is here you can test',style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.w600),maxLines: 1,overflow: TextOverflow.ellipsis,),
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Image.asset('assets/globe.png',height: height/30,),
                                      SizedBox(width: 5,),
                                      Text('New York magazine',style: TextStyle(color: Colors.black,fontSize: 10),maxLines: 2,overflow: TextOverflow.ellipsis,),
                                      Expanded(child: Container()),
                                      SizedBox(width: 5,),
                                      Image.asset('assets/clock.png',height: height/30,),
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
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(width/25))
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          height: 150,
                          child: TextField(
                            maxLines: 7,
                            decoration: InputDecoration(
                                hintText: 'write a comment ....',
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none
                            ),
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(width/25))
                        ),
                        child: Container(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Send to',style: TextStyle(color: HexToColor(MyConstants.greyClr),fontWeight: FontWeight.w600,fontSize: 16),),
                              SizedBox(height: height/40,),
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    // isTwitter=!isTwitter;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.mail,color: Colors.black87,),
                                    SizedBox(width: 8,),
                                    Text('Add by name or email',style: TextStyle(color: Colors.black87,fontSize: 15,fontWeight: FontWeight.w500),),
                                    Expanded(child: Container()),
                                    Icon(Icons.arrow_forward_ios,color: Colors.black87,)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),

    );
  }

  Future<void> shareFile() async {
    List<dynamic> docs = await DocumentsPicker.pickDocuments;
    if (docs == null || docs.isEmpty) return null;

    await FlutterShare.shareFile(
      title: 'Example share',
      text: 'Example share text',
      filePath: docs[0] as String,
    );
  }

}
