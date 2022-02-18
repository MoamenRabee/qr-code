import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_app/view/screens/result_screen.dart';
import 'package:qr_code_app/view/widgets/widgets.dart';
import 'package:screenshot/screenshot.dart';

class HomeController extends GetxController{

  RxString QrTextdata = "".obs;

  ScreenshotController screenshotController = ScreenshotController();

  void saveQrCode(){
    if(QrTextdata.value == ""){
      showToast(data: "Please Type Any Text", color: Colors.red);
    }else{
      screenshotController.captureFromWidget(customQrWidget(QrTextdata.value)).then((image) async {
        Permission.storage.isGranted.then((value) async {
          try{
            await ImageGallerySaver.saveImage(Uint8List.fromList(image),quality: 90,name: QrTextdata.value);
            showToast(data: "Saved", color: Colors.blue);
          }catch(error){
            print(error.toString());
          }
        });
      });
    }

  }

  scanQrCode() async {
    try{
      String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode("#000000","Cancel",true,ScanMode.DEFAULT).then((value)=>value);
      Get.to(ResultScreen(result: barcodeScanRes,));
    }catch(error){
      showToast(data: error.toString(), color: Colors.red);
    }
  }

}