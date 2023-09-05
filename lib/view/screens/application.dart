import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:seda/global/global.dart';
import 'package:seda/request/getdata.dart';
import 'package:seda/view/widgets/clipper.dart';

import '../../global/scanner.dart';

class Application extends StatefulWidget {
  Application({super.key, required this.deviceName});

  String deviceName;

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  TextEditingController companyCtrl = TextEditingController();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController textCtrl = TextEditingController();
  MaskTextInputFormatter mask =
      MaskTextInputFormatter(mask: "+### (##) ##-##-##");

  var clipper = BlueClipper();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    bool isLoading = false;
    return SafeArea(
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Text(
                    'Sorag galdymy?',
                    style: headline,
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: TextField(
                    controller: companyCtrl,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 18, horizontal: 26),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: primary),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30)),
                        ),
                        suffixIcon: Icon(
                          Icons.add_business,
                          color: primary,
                          size: 18,
                        ),
                        hintText: 'Edaranyň ady',
                        hintStyle: bodyTx,
                        fillColor: white,
                        focusColor: white,
                        filled: true,
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                            borderSide: BorderSide(color: white)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: primary),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30)),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                            borderSide: BorderSide.none)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: TextField(
                    controller: nameCtrl,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 18, horizontal: 26),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: primary),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30)),
                        ),
                        suffixIcon: Icon(
                          Icons.account_box,
                          color: primary,
                          size: 18,
                        ),
                        hintText: 'Adyňyz',
                        hintStyle: bodyTx,
                        fillColor: white,
                        focusColor: white,
                        filled: true,
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                            borderSide: BorderSide(color: white)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: primary),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30)),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                            borderSide: BorderSide.none)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: TextField(
                    key: ValueKey("ExampleMask"),
                    controller: phoneCtrl,

                    inputFormatters: [
                      // const UpperCaseTextFormatter(),
                      mask
                    ],
                    autocorrect: false,
                    keyboardType: TextInputType.phone,
                    // autovalidateMode: AutovalidateMode.always,
                    // validator: example.validator,

                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 18, horizontal: 26),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: primary),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30)),
                        ),
                        suffixIcon: Icon(
                          Icons.phone,
                          color: primary,
                          size: 18,
                        ),
                        hintText: '+993 (65) 785895',
                        hintStyle: bodyTx,
                        fillColor: white,
                        focusColor: white,
                        filled: true,
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                            borderSide: BorderSide(color: white)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: primary),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30)),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                            borderSide: BorderSide.none)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    controller: textCtrl,
                    minLines: 4,
                    maxLines: 6,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 18, horizontal: 26),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: primary),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30)),
                      ),
                      suffix: Icon(
                        Icons.create,
                        color: primary,
                        size: 18,
                      ),
                      hintText: 'Habaryňyz',
                      hintStyle: bodyTx,
                      fillColor: white,
                      focusColor: white,
                      filled: true,
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                          borderSide: BorderSide(color: white)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: primary),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30)),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: primary),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30)),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await sendQuestion(widget.deviceName, companyCtrl.text,
                        nameCtrl.text, phoneCtrl.text, textCtrl.text);
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: h * 0.05),
                    height: 60,
                    width: w,
                    decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        isLoading == true ? "Biraz garaşyň" : 'Ibermek',
                        style: bodyTx.copyWith(color: white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
