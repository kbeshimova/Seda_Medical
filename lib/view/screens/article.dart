import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:seda/request/getdata.dart';
import 'package:seda/view/widgets/dragable.dart';
import 'package:seda/global/global.dart';

class Article extends StatefulWidget {
  const Article({super.key, required this.newsId});

  final int newsId;

  @override
  State<Article> createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return FutureBuilder(
        future: oneNews(widget.newsId),
        builder: (context, news) {
          if (news.hasData) {
            return Scaffold(
              body: SafeArea(
                child: Stack(
                  children: [
                    Container(
                      height: h * 0.6,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(picUrl(news.data![0].image)),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      top: 25,
                      left: 15,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Image.asset('assets/back.png')),
                    ),
                    DraggableSearchableListView(
                        w: w,
                        name: news.data![0].name,
                        description: news.data![0].description,
                        author: news.data![0].author,
                        date: DateFormat('dd.MM.yyyy')
                            .format(news.data![0].createdAt)),
                  ],
                ),
              ),
            );
          } else {
            return Container(
              width: w,
              height: h,
              color: white,
              child: Center(
                child: CircularProgressIndicator(color: primary),
              ),
            );
          }
        });
  }
}
