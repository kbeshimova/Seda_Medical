import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:seda/global/global.dart';
import 'package:seda/request/getdata.dart';
import 'package:seda/view/screens/description.dart';
import 'package:seda/view/widgets/clipper.dart';

import '../../classes/product.dart';
import '../../global/scanner.dart';

class Catalog extends StatefulWidget {
  const Catalog({super.key, required this.categoryId});

  final int categoryId;

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
        backgroundColor: white,
        appBar: PreferredSize(
            preferredSize: Size(w, h * 0.13),
            child: SafeArea(
              child: Stack(
                children: [
                  CustomPaint(
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
            Expanded(
              child: FutureBuilder<List<Product>>(
                  future: productList(widget.categoryId),
                  builder: (context, product) {
                    if (product.hasData) {
                      if (product.data?.isEmpty == false) {
                        return GridView(
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.80,
                          ),
                          children: [
                            for (var i = 0; i < product.data!.length; i++)
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: border),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      height: h * 0.15,
                                      child: Image.network(
                                        picUrl(product.data![i].image),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: w * 0.04),
                                      child: Text(
                                        product.data![i].name,
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: title,
                                      ),
                                    ),
                                    ElevatedButton(
                                        onPressed: (() {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Description(
                                                        id: product.data![i].id,
                                                      )));
                                        }),
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          elevation:
                                              MaterialStateProperty.all(1),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  secondary),
                                          foregroundColor:
                                              MaterialStateProperty.all(
                                                  primary),
                                        ),
                                        child: const Text('Giňişleýin'))
                                  ],
                                ),
                              )
                          ],
                        );
                      } else {
                        return const Center(
                          child: Text("Enjam ýok"),
                        );
                      }
                    } else {
                      return Center(
                        child: CircularProgressIndicator(color: primary),
                      );
                    }
                  }),
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
    );
  }
}
