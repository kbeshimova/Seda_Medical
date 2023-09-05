import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:seda/view/screens/description.dart';

import 'global.dart';

Future<String> scanBarcodeNormal(BuildContext context) async {
  String barcodeScanRes;

  try {
    barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#5D87FF', 'Отмена', true, ScanMode.QR);
    if (barcodeScanRes.length > 3) {
      List ids = barcodeScanRes.split("%");
      // print(barcodeScanRes);
      int a = int.parse(ids[1]);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Description(id: a)));
    }
  } on PlatformException {
    barcodeScanRes = 'Failed to get platform version.';
  }

  // setState(() {
  barcode = barcodeScanRes;
  // });
  return barcodeScanRes;
}
