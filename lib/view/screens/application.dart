import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:seda/global/global.dart';
import 'package:seda/view/widgets/clipper.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
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
    bool isSended = false;
    return SafeArea(
      child: Scaffold(
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
                          Icons.add_business,
                          color: primary,
                          size: 18,
                        ),
                        hintText: 'Kompaniýanyň ady',
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
                          Icons.add_business,
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
                  // onTap: () async {
                  //   setState(() {
                  //     isLoading = true;
                  //   });
                  //   try {
                  //     await askQuestion(
                  //         name: nameCtrl.text,
                  //         state: stateCtrl.text,
                  //         text: textCtrl.text);
                  //     setState(() {
                  //       isSended = true;
                  //     });
                  //   } on DioError catch (e) {
                  //     showToast("Ошибка отправки");
                  //   }
                  //   setState(() {
                  //     isLoading = false;
                  //   });
                  // },
                  child: Container(
                    margin: EdgeInsets.only(top: 44, bottom: 120),
                    height: 60,
                    width: w,
                    decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        isLoading ? 'Biraz garaşyň ...' : 'Ibermek',
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
