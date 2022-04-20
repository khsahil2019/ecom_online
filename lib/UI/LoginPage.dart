import 'package:device_info/device_info.dart';
import 'package:ecom_online/UI/SplashScreen.dart';
import 'package:ecom_online/UI/VerifyScreen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';


class MyApp extends StatelessWidget {
  MyApp() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class GetTokenPage extends StatefulWidget {
  GetTokenPage() {}

  @override
  _GetTokenPageState createState() => _GetTokenPageState();
}

class _GetTokenPageState extends State<GetTokenPage> {
  // String token1 = "";
  String hint = "";
  DeviceInfoPlugin deviceInfo =
  DeviceInfoPlugin(); // instantiate device info plugin
  late AndroidDeviceInfo androidDeviceInfo;

  late String  board, brand, device, hardware, host, iddevice, manufacture, model, product, type, androidid;
  late bool isphysicaldevice;

  bool isLoading = false;

/***/

  Future UploadDeviceInfo() async {
    print("Hello");
// SERVER LOGIN API URL
    var url = Uri.parse(
        'https://echogarden.000webhostapp.com/E_COM_ONLINE_BARGAINING/add_deviceinfo.php');
// Store all data with Param Name.

    var data = {

      "token": token,
      "board": board.toString(),
      "brand": brand.toString(),
      "device": device.toString(),
      "hardware": hardware.toString(),
      "host": host.toString(),
      "iddevice": iddevice.toString(),
      "manufacture": manufacture.toString(),
      "model": model.toString(),
      "product": product.toString(),
      "type": type.toString(),
      "isphysicaldevice": isphysicaldevice.toString(),
      "androidid": androidid.toString()
    };
// Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));

// Getting Server response into variable.
    var obj = jsonDecode(response.body);

// If the Response Message is Matched.
    if (obj["result"] == 'S') {
      print("You are Successfully Registered");
      setState(() {
        device = "";
      });
    } else {
      print("Sorry Something went wrong.");
    }
  }

  /// ***/

  void getDeviceinfo() async {
    androidDeviceInfo = await deviceInfo
        .androidInfo; // instantiate Android Device Infoformation
    setState(() {
      // token = androidDeviceInfo.token;
      board = androidDeviceInfo.board;
      brand = androidDeviceInfo.brand;
      device = androidDeviceInfo.device;
      hardware = androidDeviceInfo.hardware;
      host = androidDeviceInfo.host;
      iddevice = androidDeviceInfo.id;
      manufacture = androidDeviceInfo.manufacturer;
      model = androidDeviceInfo.model;
      product = androidDeviceInfo.product;
      type = androidDeviceInfo.type;
      isphysicaldevice = androidDeviceInfo.isPhysicalDevice ;
      androidid = androidDeviceInfo.androidId; });
  }

  late String token;

  Future<void> firebaseCloudMessagingListeners() async {
    token = (await FirebaseMessaging.instance.getToken())!;

// ignore: avoid_print
    print("Token:" + token);
  }

  @override
  void initState() {
    super.initState();
    firebaseCloudMessagingListeners();
    getDeviceinfo();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                color: Colors.orange,
                margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * .05,
                ),
                child: Card(
                  elevation: 5,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Image.asset(
                        "assets/images/icon0.png",
                        height: 120,
                      ),
                      const Text(
                        "E-COM",
                        style: TextStyle(
                            fontFamily: "Pacifico-Regular", fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text(
                          "Enter your phone number for verification!",
                          style: TextStyle(color: Colors.black,fontSize: 15),
                        ),
                      ),
                      Card(
                        color: Colors.orange,
                        margin: const EdgeInsets.only(left: 15, right: 15),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: TextFormField(
                            onChanged: (text) {
                              setState(() {
                                hint = text;
                              });
                            },
                            maxLength: 10,
                            keyboardType: TextInputType.phone,
                            cursorColor: Colors.black,
                            style: const TextStyle(color: Colors.white,letterSpacing: 10,fontSize: 25),
                            decoration: const InputDecoration(
                                counterText: "",
                                icon: Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                ),
                                hintText: "Enter Phone No",
                                hintStyle: TextStyle(color: Colors.white,letterSpacing: 3),
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      hint.length == 10
                          ? RaisedButton(
                        color: Colors.orange.shade300,
                        onPressed: () {
                          UploadDeviceInfo();
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>VerifyScreen()));
                        },
                        child: const Text(
                          'Send',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                          : SizedBox(),
                      const SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}