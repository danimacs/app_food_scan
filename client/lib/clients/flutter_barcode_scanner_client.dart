import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class FlutterBarcodeScannerClient {
  FlutterBarcodeScannerClient();

  static Future<String> scanBarcode(BuildContext context) async {
    return await FlutterBarcodeScanner.scanBarcode(
      '#FF0000',
      'Cancelar',
      false,
      ScanMode.BARCODE,
    );
  }
}
