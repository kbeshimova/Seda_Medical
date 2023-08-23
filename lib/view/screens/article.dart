import 'package:flutter/material.dart';
import 'package:seda/view/widgets/dragable.dart';
import 'package:seda/view/global/global.dart';

class Article extends StatefulWidget {
  const Article({super.key});

  @override
  State<Article> createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: h * 0.6,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/banners/docban.jpg"),
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
                  child: Image.asset('assets/icons/back.png')),
            ),
            DraggableSearchableListView(),
          ],
        ),
      ),
    );
  }
}
