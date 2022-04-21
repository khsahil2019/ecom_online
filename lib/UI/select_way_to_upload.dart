import 'dart:developer';

import 'package:ecom_online/UI/Category.dart';
import 'package:ecom_online/UI/SelectProduct.dart';
import 'package:flutter/material.dart';

import 'UploadProduct.dart';
class WayToUpload extends StatefulWidget {
  const WayToUpload({Key? key}) : super(key: key);

  @override
  _WayToUploadState createState() => _WayToUploadState();
}

class _WayToUploadState extends State<WayToUpload> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title:Text("ADD PRODUCT",style: TextStyle(
            color: Colors.white,fontWeight: FontWeight.bold
        ),),

      ),
      backgroundColor: Colors.grey,
      body: Container(
        child: ListView(
          children: [
            SizedBox(height: 20,),

            GestureDetector(onTap: () {
              // Navigator.push(
              //     context,MaterialPageRoute(builder:(context)=> Thirdscreen())
              // );
              // Register();
              log("container tapped");
            },
              child: Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.only(),
                    border: Border.all(color: Colors.grey),

                  ),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(20),
                  child: const Text(
                    'ADD PRODUCT FROM CATLOG',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
            ),

            SizedBox(height: 20,),

            GestureDetector(onTap: () {
              Navigator.push(
                  context,MaterialPageRoute(builder:(context)=> UplaodProduct())
              );
              //Register();
              log("container tapped");
            },
              child: Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.only(),
                    border: Border.all(color: Colors.grey),

                  ),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(20),
                  child: const Text(
                    'ADD PRODUCT YOURSELF',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
            ),

          ],
        ),
      ),


    );
  }
}
