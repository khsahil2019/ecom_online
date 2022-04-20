import 'package:ecom_online/UI/Category.dart';
import 'package:ecom_online/UI/SelectProduct.dart';
import 'package:flutter/material.dart';
class WayToUpload extends StatefulWidget {
  const WayToUpload({Key? key}) : super(key: key);

  @override
  _WayToUploadState createState() => _WayToUploadState();
}

class _WayToUploadState extends State<WayToUpload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectProduct()));
          },
          child: Container(
            width: 100,
            height: 40,
            color: Colors.red,
            child: Center(child: Text("UPLOAD")),
          ),
        ),
      ),
    );
  }
}
