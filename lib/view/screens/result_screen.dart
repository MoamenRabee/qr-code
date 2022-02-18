import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_app/view/widgets/widgets.dart';

class ResultScreen extends StatelessWidget {

  String result;
  ResultScreen({required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Code Result"),
        actions: [
          IconButton(
            onPressed: (){
              Clipboard.setData(ClipboardData(text: result));
              showToast(data: "Copied", color: Colors.blue);
            },
            icon: const Icon(Icons.copy),
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(result,style: const TextStyle(fontSize: 16.6),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

