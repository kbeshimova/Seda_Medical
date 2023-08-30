import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:seda/classes/news.dart';
import 'package:seda/request/getdata.dart';
import 'package:seda/view/screens/article.dart';
import 'package:seda/global/global.dart';
import 'package:seda/view/widgets/clipper.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var clipper = BlueClipper();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: white,
        appBar: PreferredSize(
            preferredSize: Size(w, h * 0.13),
            child: SafeArea(
              child: CustomPaint(
                painter: ClipShadowShadowPainter(
                  clipper: clipper,
                  shadow: const BoxShadow(
                      color: Colors.transparent,
                      offset: Offset(0, -10),
                      blurRadius: 30,
                      spreadRadius: 10),
                ),
                child: ClipPath(
                  clipper: clipper,
                  child: Container(
                    padding: const EdgeInsets.only(top: 10),
                    color: secondary,
                    height: h * 0.13,
                    width: w,
                    alignment: Alignment.topCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(),
                        Image.asset(
                          'assets/sedalogo.png',
                          height: 38,
                        ),
                        GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.qr_code_scanner,
                                color: black,
                                size: 30,
                              ),
                            ),
                            onTap: () {}),
                      ],
                    ),
                  ),
                ),
              ),
            )),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 25, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Последние новости',
                        style: bodyBl,
                      ),
                      // Icon(
                      //   Icons.tune,
                      //   color: black,
                      //   size: 25,
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  width: w,
                  height: h * 0.3,
                  child: FutureBuilder(
                      future: newsList(),
                      builder: (context, news) {
                        if (news.hasData) {
                          if (news.data?.isEmpty == false) {
                            return ListView(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              children: [
                                for (var i = 0; i < 3; i++)
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (context) => Article(
                                                    newsId: news.data![i].id,
                                                  )));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 18),
                                      width: w * 0.66,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image.network(
                                                picUrl(news.data![i].image),
                                                fit: BoxFit.cover,
                                              )),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8),
                                            child: Text(
                                              news.data![i].name,
                                              style: title,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: w * 0.4,
                                                child: Text(
                                                  news.data![i].author,
                                                  style: smallTextPr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                child: Text(
                                                  ' • ',
                                                  style: smallTextBl,
                                                ),
                                              ),
                                              Text(
                                                DateFormat('dd.MM.yyyy').format(
                                                    news.data![i].createdAt),
                                                style: smallTextBl,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                              ],
                            );
                          } else {
                            return const Center(
                              child: Text("Нет новостей"),
                            );
                          }
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              color: primary,
                            ),
                          );
                        }
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: Text(
                    'Все новости',
                    style: bodyBl,
                  ),
                ),
                FutureBuilder<List<News>>(
                    future: newsList(),
                    builder: (context, news) {
                      if (news.hasData) {
                        if (news.data?.isEmpty == false) {
                          return ListView(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            children: [
                              for (var i = 3; i < news.data!.length; i++)
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => Article(
                                                  newsId: news.data![i].id,
                                                )));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(right: w * 0.05),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8),
                                              child: SizedBox(
                                                width: w * 0.65,
                                                child: Text(
                                                  news.data![i].name,
                                                  overflow: TextOverflow.clip,
                                                  maxLines: 2,
                                                  style: title,
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                SizedBox(
                                                  width: w * 0.4,
                                                  child: Text(
                                                    news.data![i].author,
                                                    style: smallTextPr,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Text(
                                                  ' • ',
                                                  style: smallTextBl,
                                                ),
                                                Text(
                                                  DateFormat('dd.MM.yyyy')
                                                      .format(news
                                                          .data![i].createdAt),
                                                  style: smallTextBl,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.network(
                                              picUrl(news.data![i].image),
                                              height: h * 0.09,
                                              width: w * 0.19,
                                              fit: BoxFit.cover,
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          );
                        } else {
                          return const Center(
                            child: Text("Нет новостей"),
                          );
                        }
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            color: primary,
                          ),
                        );
                      }
                    })
              ],
            ),
          ),
        ));
  }
}
