import 'package:flutter/material.dart';

var primary = const Color(0xff3E5AE1);
var secondary = const Color(0xffDFE4FC);
var black = const Color(0xff000000);
var white = const Color(0xffFFFFFF);
var grey = const Color(0xffC4C4C4);
var border = const Color(0xffEEEEEE);
var name = const Color(0xff35383F);
var text = const Color(0xff19202D);
var purple = const Color(0xff3E5AE1);

var headline = TextStyle(fontSize: 26, color: text);
var heading = TextStyle(fontSize: 20, color: text);
var bodyBl = TextStyle(fontSize: 16, color: black, fontWeight: FontWeight.w700);
var bodyTx = const TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: Color.fromARGB(125, 25, 32, 45),
);
var title = const TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
var smallTextPr = TextStyle(fontSize: 12, color: primary);
var smallTextBl = TextStyle(fontSize: 12, color: grey);

// Accordion
const headerStyle = TextStyle(
    color: Color(0xff3E5AE1), fontSize: 15, fontWeight: FontWeight.w500);
const contentStyleHeader = TextStyle(
    color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
const contentStyle = TextStyle(
    color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.normal);

// Barcode
String barcode = '-1';
