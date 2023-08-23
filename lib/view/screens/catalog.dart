import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:seda/view/global/global.dart';
import 'package:seda/view/screens/description.dart';
import 'package:seda/view/widgets/clipper.dart';

class Catalog extends StatefulWidget {
  const Catalog({super.key});

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  var clipper = BlueClipper();

  @override
  Widget build(BuildContext context) {
    TabController _controller;
    int _selectedIndex = 0;
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 10,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(w, h * 0.13),
            child: SafeArea(
              child: Stack(
                children: [
                  CustomPaint(
                    painter: ClipShadowShadowPainter(
                      clipper: clipper,
                      shadow: BoxShadow(
                          color: Colors.transparent,
                          offset: const Offset(0, -10),
                          blurRadius: 30,
                          spreadRadius: 10),
                    ),
                    child: ClipPath(
                      clipper: clipper,
                      child: Container(
                        padding: EdgeInsets.only(top: 10),
                        color: secondary,
                        height: h * 0.13,
                        width: w,
                        alignment: Alignment.topCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(),
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
                                  // Navigator.of(context).push(
                                  //     MaterialPageRoute(builder: (context) => FilterSwipe()));
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: GestureDetector(
                      onTap: (() {
                        Navigator.of(context).pop();
                      }),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: black,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            )),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 17),
              padding: EdgeInsets.only(
                left: 20,
              ),
              height: h * 0.036,
              child: TabBar(
                isScrollable: true,
                physics: BouncingScrollPhysics(),
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50), color: primary),
                indicatorColor: white,
                unselectedLabelColor: primary,
                dragStartBehavior: DragStartBehavior.start,
                tabs: [
                  for (var i = 0; i < 10; i++)
                    Tab(
                      child: Text(
                        'Phylips',
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              // height: h * 0.7,
              // width: w,
              child: TabBarView(
                children: [
                  GridView(
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.80,
                    ),
                    children: [
                      for (var i = 0; i < 10; i++)
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: border),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset('assets/products/product.png'),
                              Text(
                                'УЗИ аппарат Philips',
                                overflow: TextOverflow.ellipsis,
                                style: title,
                              ),
                              ElevatedButton(
                                  onPressed: (() {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Description()));
                                  }),
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    elevation: MaterialStateProperty.all(1),
                                    backgroundColor:
                                        MaterialStateProperty.all(secondary),
                                    foregroundColor:
                                        MaterialStateProperty.all(primary),
                                  ),
                                  child: Text('Подробнее'))
                            ],
                          ),
                        )
                    ],
                  ),
                  Container(color: Colors.yellow),
                  Container(color: Colors.red),
                  Container(color: Colors.green),
                  Container(color: Colors.yellow),
                  Container(color: Colors.red),
                  Container(color: Colors.green),
                  Container(color: Colors.yellow),
                  Container(color: Colors.red),
                  Container(color: Colors.red),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
