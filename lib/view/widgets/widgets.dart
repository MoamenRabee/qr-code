import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_flutter/qr_flutter.dart';

Widget customQrWidget(String data){
  return SizedBox(
    width: 300.0,
    height: 300.0,
    child: QrImage(
      padding: const EdgeInsets.all(10.0),
      data: data,
      version: QrVersions.auto,
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      size: 320,
      gapless: true,
    ),
  );
}

showToast({
  required String data,
  required Color color,
}) async {
  return await Fluttertoast.showToast(
      msg: data,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0
  );
}