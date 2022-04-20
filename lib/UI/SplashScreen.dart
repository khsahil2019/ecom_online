import 'package:ecom_online/UI/LoginPage.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 3),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>GetTokenPage()));

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(


        body: Container(
            decoration: BoxDecoration(
              color: Colors.white,

            ),


            child: Center(
              child: Image.asset("assets/images/icon0.png",
                width: 250,
                height: 250,),
            )
        )
    );

  }
}
