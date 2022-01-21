
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:news_ware/CategoryTile/business.dart';
import 'package:news_ware/CategoryTile/entertainment.dart';
import 'package:news_ware/CategoryTile/homepage.dart';
import 'package:news_ware/CategoryTile/science.dart';
import 'package:news_ware/CategoryTile/sports.dart';
import 'package:news_ware/CategoryTile/tech.dart';
import 'package:news_ware/homepage/model.dart';

import 'model.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home>


  with SingleTickerProviderStateMixin {
  final List<Tab> _tabList = [
    Tab(child: Text("TOP"),),
    Tab(child: Text("BUSINESS"),),
    Tab(child: Text("SPORTS"),),
    Tab(child: Text("TECHNOLOGY"),),
    Tab(child: Text("SCIENCE"),),
    Tab(child: Text("ENTERTAINMENT"),),

  ];

  late TabController _tabController;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabList.length);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
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
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(30.0),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              tabs: _tabList,
              unselectedLabelColor: Colors.blueAccent,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.blue,
              ),

            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            homepage(),
            businessPage(),
            sportsPage(),
            techPage(),
            sciencePage(),
            entertainmentPage(),
          ],
        ),
      ),
    );
  }
}







