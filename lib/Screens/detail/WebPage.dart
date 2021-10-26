import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:marked/Constants/MyConstants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  @override
  WebPageState createState() => WebPageState();
}

class WebPageState extends State<WebPage> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: MyConstants.currentArticleData.pageUrl,
    );
  }
}