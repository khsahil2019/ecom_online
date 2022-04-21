import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';
import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
class UplaodProduct extends StatefulWidget {
  const UplaodProduct({Key? key}) : super(key: key);

  @override
  _UplaodProductState createState() => _UplaodProductState();
}

enum AppState {
  free,
  picked,
  cropped,
}


class _UplaodProductState extends State<UplaodProduct> {
  XFile ?uploadimage;
  late AppState state;
  ImagePicker picker = ImagePicker();
  TextEditingController productname = new TextEditingController();
  TextEditingController brandname = new TextEditingController();
  TextEditingController mrp = new TextEditingController();
  TextEditingController discount = new TextEditingController();
  TextEditingController description = new TextEditingController();
  TextEditingController stock = new TextEditingController();

 // List subcatList = ["Select Sub Category","Mobile","Tablet","Laptop","Headphone","Ear Bud","Neck Band","Smart Watch","Smart Band","TV"];
 // String? subcat;


  Future<void> Register() async{}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title:Text("ADD PRODUCT YOURSELF",style: TextStyle(
              color: Colors.white,fontWeight: FontWeight.bold
          ),),
        ),
        backgroundColor: Colors.white,
        body: Container(
          child: ListView(
            children: [
              GestureDetector(
                onTap: () {
                  showPicker(context);
                },
                child: uploadimage == null
                    ? Container(
                  width: 120.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF111D3A),),
                    shape: BoxShape.circle,
                    color: Colors.orange,
                  ),
                  child: const Icon(
                    Icons.add_a_photo_outlined,
                    size: 80,
                    color: Colors.blueGrey,
                  ),
                )
                    : Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(

                    shape: BoxShape.circle,
                    color: Colors.black,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: FileImage(File(uploadimage!.path.toString())),
                    ),
                  ),
                ),
              ),


              SizedBox(height: 5,),





              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: 20),
              //   // decoration:
              //   // BoxDecoration(border: buildBottomBorder(Colors.orange)),
              //   child: DropdownButton(
              //       onChanged: (value) {
              //         setState(() {
              //           subcat = value as String;
              //         });
              //       },
              //       hint: Text(
              //         "Select Sub Category",
              //         style: TextStyle(color: Colors.teal),
              //       ),
              //       underline: Text(""),
              //       isExpanded: true,
              //       value: subcat,
              //       items: subcatList.map<DropdownMenuItem<String>>((e) {
              //         return DropdownMenuItem<String>(
              //           child: Text(
              //             e,
              //             style: TextStyle(color: Colors.teal),
              //           ),
              //           value: e,
              //         );
              //       }).toList()),
              // ),
              //
              //

              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.teal),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.teal,
                        offset: Offset(0, 0),
                        blurRadius: 2,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.white),
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: TextField(
                    controller: productname,
                    decoration: InputDecoration(
                        labelText: 'Product Name', border: InputBorder.none),
                    //input decoration
                  ), //textfield
                ),
              ),


              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.teal),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.teal,
                        offset: Offset(0, 0),
                        blurRadius: 2,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.white),
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: TextField(
                    controller: brandname,
                    decoration: InputDecoration(
                        labelText: 'Brand Name', border: InputBorder.none),
                    //input decoration
                  ), //textfield
                ),
              ),



              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.teal),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.teal,
                        offset: Offset(0, 0),
                        blurRadius: 2,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.white),
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: TextField(
                    controller: mrp,
                    decoration: InputDecoration(
                        labelText: 'Product Mrp', border: InputBorder.none),
                    //input decoration
                  ), //textfield
                ),
              ),



              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              //   decoration: BoxDecoration(
              //       border: Border.all(color: Colors.teal),
              //       boxShadow: const [
              //         BoxShadow(
              //           color: Colors.teal,
              //           offset: Offset(0, 0),
              //           blurRadius: 2,
              //         ),
              //       ],
              //       borderRadius: BorderRadius.circular(25.0),
              //       color: Colors.white),
              //   child: Padding(
              //     padding: EdgeInsets.only(left: 10),
              //     child: TextField(
              //       controller: discount,
              //       decoration: InputDecoration(
              //           labelText: 'Discount', border: InputBorder.none),
              //       //input decoration
              //     ), //textfield
              //   ),
              // ),


              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.teal),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.teal,
                        offset: Offset(0, 0),
                        blurRadius: 2,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.white),
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: TextField(
                    controller: description,
                    decoration: InputDecoration(
                        labelText: 'Description', border: InputBorder.none),
                    //input decoration
                  ), //textfield
                ),
              ),


              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.teal),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.teal,
                        offset: Offset(0, 0),
                        blurRadius: 2,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.white),
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: TextField(
                    controller: stock,
                    decoration: InputDecoration(
                        labelText: 'Stock', border: InputBorder.none),
                    //input decoration
                  ), //textfield
                ),
              ),

SizedBox(height: 10,),

              GestureDetector(onTap: () {
                // Navigator.push(
                //     context,MaterialPageRoute(builder:(context)=> Upload())
                // );
                // Register();
                log("container tapped");
              },
                child: Container(
                    margin: EdgeInsets.only(left: 120, right: 120),
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.teal),

                    ),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(5),
                    child: const Text(
                      'SUBMIT',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
              ),



            ],
          ),
        ));
  }
  void showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Photo Library'),
                    onTap: () {
                      chooseImageFromGalary();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    chooseImageFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }
  Future<void> chooseImageFromGalary() async {
    XFile? choosedimage = await picker.pickImage(source: ImageSource.gallery);
    //set source: ImageSource.camera to get image from camera
    setState(() {
      uploadimage = choosedimage!;
    });
  }

  Future<void> chooseImageFromCamera() async {
    XFile? choosedimage = await picker.pickImage(source: ImageSource.camera);
    //set source: ImageSource.camera to get image from camera
    setState(() {
      uploadimage = choosedimage!;
    });
  }


  Future<Null> _cropImage() async {
    File? croppedFile = await ImageCropper().cropImage(
        sourcePath: uploadimage!.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ]
            : [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio5x3,
          CropAspectRatioPreset.ratio5x4,
          CropAspectRatioPreset.ratio7x5,
          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          title: 'Cropper',
        ));
    if (croppedFile != null) {
      uploadimage = croppedFile as XFile?;
      setState(() {
        state = AppState.cropped;
      });
    }
  }
  void _clearImage() {
    uploadimage = null;
    setState(() {
      state = AppState.free;
    });
  }
}



Border buildBottomBorder(var color) {
  return Border(
    bottom: BorderSide(
      color: color,
      width: 2,
    ),
  );
}

BuildTextField(TextEditingController controller, String label) {
  return Container(
    decoration: BoxDecoration(border: buildBottomBorder(Colors.orange)),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        label: Text(label),
        labelStyle: TextStyle(color: Colors.teal),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.orange),
        ),
      ),
    ),
  );
  }



