import 'package:flutter/material.dart';
import 'package:seda/request/getdata.dart';
import 'package:seda/view/screens/catalog.dart';
import 'package:seda/global/global.dart';
import 'package:seda/view/widgets/clipper.dart';

import '../../global/scanner.dart';

class Directions extends StatefulWidget {
  const Directions({super.key});

  @override
  State<Directions> createState() => _DirectionsState();
}

class _DirectionsState extends State<Directions> {
  var clipper = BlueClipper();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
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
                          onTap: () {
                            scanBarcodeNormal(context);
                          }),
                    ],
                  ),
                ),
              ),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: Text(
                'Ugurlar',
                style: bodyBl,
              ),
            ),
            Expanded(
              child: FutureBuilder(
                  future: categoryList(),
                  builder: (context, category) {
                    if (category.hasData) {
                      return ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          for (var i = 0; i < category.data!.length; i++)
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Catalog(
                                        categoryId: category.data![i].id)));
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 5),
                                margin: const EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(
                                    border: Border.all(color: border, width: 2),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Image.network(
                                      picUrl(category.data![i].icon),
                                      height: 49,
                                    ),
                                    SizedBox(
                                      width: w * 0.5,
                                      child: Text(
                                        category.data![i].name,
                                        overflow: TextOverflow.clip,
                                        maxLines: 2,
                                        style: heading,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: primary,
                                      size: 30,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(color: primary),
                      );
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}

List<Direction> directions = [
  // Direction(img: img, title: title, function: function),
];

class Direction {
  String img;
  String title;
  Function() function;
  Direction({required this.img, required this.title, required this.function});
}
