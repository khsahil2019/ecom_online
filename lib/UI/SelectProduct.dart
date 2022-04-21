import 'package:ecom_online/UI/SetProductDetail.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectProduct extends StatefulWidget {
  const SelectProduct({Key? key}) : super(key: key);

  @override
  _SelectProductState createState() => _SelectProductState();
}

class _SelectProductState extends State<SelectProduct> {
  @override
  bool isClothes = false;
  bool isElectronic = false;
  bool isFurniture = false;
  String cat = "";

  _SelectProductState() {
    getcat();
  }

  void initState() {
    getcat();

    // TODO: implement initState
    super.initState();
  }

  Future<void> getcat() async {
    print("Hello");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      cat = prefs.getString("cat")!;
      print("Helllo:${cat}");
    });
  }

  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width - 40;
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Select category' + cat,
                    style: TextStyle(
                        color: AppColors.primary,
                        //fontWeight: FontWeight.bold,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  Image.asset(
                    "assets/images/icon0.png",
                    width: 150,
                    height: 120,
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  SizedBox(
                    width: width * .2,
                    child: Theme(
                      data: ThemeData(unselectedWidgetColor: AppColors.primary),
                      child: Checkbox(
                        value: isClothes,
                        activeColor: AppColors.primary,
                        onChanged: (val) {
                          setState(() {
                            isClothes = val!;
                          });
                        },
                      ),
                    ),
                  ),
                  Container(
                    width: width * .4,
                    child: Text(
                      "CLothes",
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                  Image.asset(
                    "assets/images/clothing.png",
                    height: 30,
                    width: 30,
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: width * .2,
                    child: Theme(
                      data: ThemeData(unselectedWidgetColor: AppColors.primary),
                      child: Checkbox(
                        value: isElectronic,
                        activeColor: AppColors.primary,
                        onChanged: (val) {
                          setState(() {
                            isElectronic = val!;
                          });
                        },
                      ),
                    ),
                  ),
                  Container(
                    width: width * .4,
                    child: Text(
                      "Electronics",
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                  Image.asset(
                    "assets/images/electronic.png",
                    height: 30,
                    width: 30,
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: width * .2,
                    child: Theme(
                      data: ThemeData(unselectedWidgetColor: AppColors.primary),
                      child: Checkbox(
                        value: isFurniture,
                        activeColor: AppColors.primary,
                        onChanged: (val) {
                          setState(() {
                            isFurniture = val!;
                          });
                        },
                      ),
                    ),
                  ),
                  Container(
                    width: width * .4,
                    child: Text(
                      "Furniture",
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                  Image.asset(
                    "assets/images/furniture.png",
                    height: 30,
                    width: 30,
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SetProductDetail()));
                },
                child: Container(
                  //width: 90,
                  height: 40,
                  margin: EdgeInsets.symmetric(
                    horizontal: 120,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Add Product",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class AppColors
{
  static const primary = Color(0xFFF19122);
  static const secondary = Color.fromRGBO(6, 202, 192, 1);
}
