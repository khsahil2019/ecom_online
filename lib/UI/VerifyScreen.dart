
import 'dart:developer';



import 'package:flutter/material.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';

import 'Category.dart';



class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  @override
  String smsOtp = "";
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          color: Colors.white,
          child: ListView(children: <Widget>[
            SizedBox(
              height: 70,
            ),
            Image.asset(
              "assets/images/icon0.png",
              width: 150,
              height: 150,
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Enter OTP Send On Your Mobile Number",
                style: TextStyle(
                  color: Colors.black,

                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        blurRadius: 8.0,
                        offset: Offset(5, 5))
                  ]),
              height: 220,
              margin: EdgeInsets.all(25),
              child: Column(children: [
                SizedBox(
                  height: 10,
                ),
                Container(

                  child: Column(children: [
                    SizedBox(
                      height: 10,
                    ),
                    PinEntryTextField(

                      showFieldAsBox: true,
                      fields: 6,
                      onSubmit: (text) {
                        smsOtp = text as String;
                      },
                    ),
                  ]),
                ),
                SizedBox(height: 50),
                //ElevatedButton(onPressed: () {}, child: Text("CONTINUE")),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: (){
                        log("RESEND BUTTON PRESS");
                      },

                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade200,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "Resend",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        log("CONTINUE BUTTON PRESS");
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Category()));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade200,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "Continue",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    )
                  ],
                )
              ]),
            )
          ]),
        )
      ]),
    );
  }
}
