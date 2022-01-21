import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_ware/NEWSSERVICE/businessnews.dart';
import 'package:news_ware/homepage/model.dart';
import 'package:webview_flutter/webview_flutter.dart';
class businessnewsview extends StatefulWidget {

  final String Blogurl;
  businessnewsview({required this.Blogurl});


  @override
  _businessnewsviewState createState() => _businessnewsviewState();
}

class _businessnewsviewState extends State<businessnewsview> {
  List<NewsQueryModel> NEWS = <NewsQueryModel>[];
  bool loading = true;
  final Completer<WebViewController> _completer=Completer<WebViewController>();
  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    NEWS = newsClass.news;
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        actions: <Widget>[
          Opacity(opacity: 0,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Icon(Icons.save)),
          ),
        ],
        toolbarHeight: 100.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('News',
              style:
              TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            Text('Ware',
              style: TextStyle(
                color: Colors.black,
              ),),
          ],
        ),
        elevation: 10,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
          color: Colors.black,
        ),
      ),
      body : Container(

        child: WebView(

          initialUrl: widget.Blogurl ,
          onWebViewCreated: ((WebViewController webViewController){
            _completer.complete(webViewController);
          }),

        ),
      ),
    );
  }
}