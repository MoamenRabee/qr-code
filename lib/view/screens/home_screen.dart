import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_app/controller/home_controller.dart';
import 'package:qr_code_app/view/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  var controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Code"),
        actions: [
          IconButton(
            onPressed: (){
              controller.scanQrCode();
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx((){
                    if (controller.QrTextdata.value == ""){
                      return Container(
                        width: 300.0,
                        height: 300.0,
                        decoration: BoxDecoration(
                          color: Colors.grey[200]
                        ),
                        child: Center(
                            child: Text("Type ...",
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                        ),
                      );
                    }else{
                      return customQrWidget(controller.QrTextdata.value.toString());
                    }
                  }),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    minLines: 1,
                    maxLines: 10,
                    decoration: const InputDecoration(
                        hintText: "Enter Text To Create QR CODE",
                        prefixIcon: Icon(Icons.create),
                        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2))
                    ),
                    onChanged: (data){
                      controller.QrTextdata.value = data.toString();
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 50.0,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: ElevatedButton(
                  onPressed: () {
                    controller.saveQrCode();
                  },
                  child: const Text("Save QR Code"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

