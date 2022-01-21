import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_ware/NEWSSERVICE/businessnews.dart';
import 'package:news_ware/homepage/model.dart';
import 'package:news_ware/news_view/business_news.dart';
class businessPage extends StatefulWidget {

  @override
  _businessPageState createState() => _businessPageState();
}

class _businessPageState extends State<businessPage> {

  List<NewsQueryModel> NEWS=<NewsQueryModel>[];
  bool loading=true;
  @override
  void initState(){
    super.initState();
    getNews();
  }
  getNews() async{
    News newsClass=News();
    await newsClass.getNews();
    NEWS=newsClass.news;
    setState(() {
      loading=false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      body:  loading ?Center(
        child: Container(
          child: SpinKitRotatingCircle(
            color: Colors.red,
            size: 70.0,
          ),
        ),
      ):

      Container(
        child:
        Padding(padding: EdgeInsets.all(8.0),
          child: Container(
            margin: EdgeInsets.all(1),
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: NEWS.length,
              itemBuilder: (context,index){
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(

                        builder: (context) => businessnewsview(
                          Blogurl: NEWS[index].newsUrl,
                        )));
                  },
                  child: Container(
                      margin: EdgeInsets.all(6),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 8,
                        child: Stack(
                          children: [
                            ClipRRect(
                                borderRadius : BorderRadius.circular(15),
                          child: Image.network(NEWS[index].newsImg ,fit: BoxFit.fitHeight, height: 300,width: double.infinity, )),

                            Positioned(
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child:Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.black26.withOpacity(0),
                                          Colors.black,
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      )
                                  ),
                                  padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                                  child:Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:[ Text(NEWS[index].newsHead,
                                          style:TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          )
                                      ),
                                    Text(
                                      NEWS[index].newsDes,
                                      style: TextStyle(
                                          color: Colors.white60,
                                          fontSize: 12)
                                      ,)
                                    ],
                                  ),
                                )
                            ),
                          ],
                        ),
                      )
                  ),
                );
              },
            ),

          ),
        ),
      ),
    );
  }
}
