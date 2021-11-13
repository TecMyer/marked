// import 'dart:convert';

// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Screens/ManageOtherSites/ArsTechnicaLoginPage.dart';
import 'Screens/ManageOtherSites/ManageSiteLoginPage.dart';
import 'package:marked/Screens/AccountScreens/SignupPage.dart';
import 'package:marked/Screens/AddTags/AddTagpage.dart';
import 'package:marked/Screens/EditProfile/ChangePasswordPage.dart';
import 'package:marked/Screens/EditProfile/EditProfilePage.dart';
import 'package:marked/Screens/FollowPeople/FollowPage.dart';
import 'package:marked/Screens/HelpScreen/DetailScreens/FavouriteHelpPage.dart';
import 'package:marked/Screens/HelpScreen/DetailScreens/HowToSavePage.dart';
import 'package:marked/Screens/HelpScreen/DetailScreens/ManageDataHelpPage.dart';
import 'package:marked/Screens/HelpScreen/DetailScreens/ReadPage.dart';
import 'package:marked/Screens/HelpScreen/DetailScreens/ReverseAuthPage.dart';
import 'package:marked/Screens/HelpScreen/DetailScreens/SendToFriendsPage.dart';
import 'package:marked/Screens/HelpScreen/DetailScreens/SyncHelpPage.dart';
import 'package:marked/Screens/HelpScreen/DetailScreens/TagsHelpPage.dart';
import 'package:marked/Screens/HelpScreen/HelpPage.dart';
import 'package:marked/Screens/OnboardingScreens/BoardingPage.dart';
import 'package:marked/Screens/detail/DetailPage.dart';
import 'package:marked/Screens/home/HomePage.dart';
import 'package:marked/Screens/home/RecommendToPage.dart';
import 'package:marked/Screens/home/SentToPage.dart';
import 'package:marked/drawer/contentType/article/ArticlePage.dart';
import 'package:marked/drawer/contentType/bestof/BestOfPage.dart';
import 'package:marked/drawer/contentType/trending/TrendingPage.dart';
import 'package:marked/drawer/contentType/videos/VideoPage.dart';
import 'package:marked/drawer/tags/BeautyPage.dart';
import 'package:marked/drawer/tags/NoTagPage.dart';

import 'Constants/MyConstants.dart';
import 'Preferences/MySharedPreference.dart';
import 'Screens/AccountScreens/LoginPage.dart';
import 'Screens/HelpScreen/DetailScreens/AppBasicsPage.dart';
import 'Screens/Options/ProfileOptions.dart';
import 'drawer/Lists/archive/ArchivePage.dart';
import 'drawer/Lists/favourites/FavouritePage.dart';
import 'drawer/Lists/highlight/HighlightPage.dart';
import 'drawer/Lists/sharedtome/SharedPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      routes: {
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/home': (context) => HomePage(),
        '/detail': (context) => DetailPage(),
        '/options': (context) => OptionsPage(),
        '/archive': (context) => ArchivePage(),
        '/favourite': (context) => FavouritePage(),
        '/highlight': (context) => HighlightPage(),
        '/shared': (context) => SharedPage(),
        '/article': (context) => ArticlePage(),
        '/videos': (context) => VideoPage(),
        '/bestOf': (context) => BestOfPage(),
        '/trending': (context) => TrendingPage(),
        '/noTag': (context) => NoTagPage(),
        '/beauty': (context) => BeautyPage(),
        '/addTags': (context) => AddTagPage(),
        '/followPage': (context) => FollowPage(),
        '/help': (context) => HelpPage(),
        '/appBasics': (context) => AppBasicsPage(),
        '/favouriteHelp': (context) => FavouritesHelpPage(),
        '/howToSave': (context) => HowToSavePage(),
        '/manageData': (context) => ManageDataPage(),
        '/read': (context) => ReadPage(),
        '/reverseAuth': (context) => ReverseAuthPage(),
        '/sendToFriends': (context) => SendToFriendsPage(),
        '/sync': (context) => SyncHelpPage(),
        '/tagsHelp': (context) => TagsHelpPage(),
        '/editProfile': (context) => EditProfilePage(),
        '/recommend': (context) => RecommendToPage(),
        '/share': (context) => SendToPage(),
        '/changePass': (context) => ChangePasswordPage(),
        '/manageSiteLogin': (context) => ManageSiteLoginPage(),
        '/arsTechnica': (context) => ArsTechnicaLoginPage(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Social Saver',
      theme: ThemeData(
        primaryColor: Colors.grey,
//        iconTheme: IconThemeData(color: HexToColor(MyConstants.green)),
        accentColor: Colors.black,
        hintColor: Colors.grey,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _startTimer(context);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    MyConstants.width = MediaQuery.of(context).size.width;
    MyConstants.height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 150,
          child: Image.asset(
            'assets/Logo-2.png',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  _startTimer(BuildContext context) async {
    Future.delayed(Duration(seconds: 3), navigationPage);
  }

  navigationPage() async {
    MySharedPreferennce mySharedPreference = MySharedPreferennce();
    bool data = await mySharedPreference.getisFirstTime();
    if (data == null || data) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => BoardingPage()));
    } else {
      var data = await mySharedPreference.getUserrLogIn();
      print("user Data: " + data.toString());
      if (data.toString() != "logout") {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        Navigator.pushReplacementNamed(context, '/login');
      }
    }
  }
}
