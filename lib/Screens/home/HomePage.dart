
// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marked/Constants/MyConstants.dart';
import 'package:marked/Screens/home/tabs/FavoriteTab.dart';
import 'package:marked/Screens/home/tabs/HomeTab.dart';
import 'package:marked/Screens/home/tabs/NotificationTab.dart';
import 'package:marked/Screens/home/tabs/ProfileTab.dart';
// import 'package:marked/Utils/HexColor.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double height = MyConstants.height,
      width = MyConstants.width;

  int _currentIndex = 0;

  final List<Widget> _children = [
    HomeTab(),
    FavouriteTab(),
    NotificationTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Scaffold(
      body:_children[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(

        onTap: onTabTapped, // new
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Image.asset('assets/home.png',color: Colors.grey,height: height/28,),
            activeIcon:  new Image.asset('assets/home_fill.png',height: height/28,),
            title: new Text('',style: TextStyle(color: Colors.black),),
          ),
          BottomNavigationBarItem(
              icon: new Image.asset('assets/star.png',color: Colors.grey,height: height/28,),
              activeIcon:  new Image.asset('assets/star_fill.png',height: height/28,),
              title: Text('',style: TextStyle(color: Colors.black))
          ),
          BottomNavigationBarItem(
              icon: new Image.asset('assets/notification.png',color: Colors.grey,height: height/28,),
              activeIcon:  new Image.asset('assets/notification_fill.png',height: height/28,),
              title: Text('',style: TextStyle(color: Colors.black))
          ),
          BottomNavigationBarItem(
              icon: new Image.asset('assets/profile.png',color: Colors.grey,height: height/28,),
              activeIcon:  new Image.asset('assets/profile_fill.png',height: height/28,),
              title: Text('',style: TextStyle(color: Colors.black))
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

}