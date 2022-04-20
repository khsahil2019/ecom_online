import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:ecom_online/UI/select_way_to_upload.dart';
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}
enum AppState {
  free,
  picked,
  cropped,
}
class _RegisterFormState extends State<RegisterForm> {
  XFile ?uploadimage;
  late AppState state;
  ImagePicker picker = ImagePicker();
  TextEditingController shopCtrl = TextEditingController();
  TextEditingController ownerCtrl = TextEditingController();
  TextEditingController gstCtrl = TextEditingController();
  TextEditingController geoCtrl = TextEditingController();
  TextEditingController cityCtrl = TextEditingController();
  TextEditingController stateCtrl = TextEditingController();
  TextEditingController addCtrl = TextEditingController();
  TextEditingController landmarkCtrl = TextEditingController();
  TextEditingController contactCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();

 // late String  shop_name, owner_name="", gst_no="", city="", stat="", address="", landmark="", geo_location="", email="", contact_no="", pic="";
  Location location = new Location();

  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;

  // void initState() {
  //   super.initState();
  //   getLocation();
  // }

  Future<void> getLocation()
  async {

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    print("${_locationData.longitude} ${_locationData.latitude}");
  }





  @override



  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 40;
    return Scaffold(
      backgroundColor: Colors.orange.shade200,
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                SizedBox(height: 20,),
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
                SizedBox(height: 10,),
                Center(child: Text("UPLOAD OWNER IMAGE",style: TextStyle(fontSize: 18),)),
                SizedBox(height: 10,),

                Container(

                  decoration:
                  BoxDecoration(border: buildBottomBorder(Colors.black)),
                  child: BuildTextField(shopCtrl, "Shop Name",""),
                ),

                SizedBox(height: 1,),

                Container(

                  decoration:
                  BoxDecoration(border: buildBottomBorder(Colors.black)),
                  child: BuildTextField(ownerCtrl, "Owner Name" ,""),
                ),
                SizedBox(height: 1,),

                Container(

                  decoration:
                  BoxDecoration(border: buildBottomBorder(Colors.black)),
                  child: BuildTextField(gstCtrl, "GST No." ,""),
                ),
                SizedBox(height: 1,),

                Container(

                  decoration:
                  BoxDecoration(border: buildBottomBorder(Colors.black)),
                  child: BuildTextField(emailCtrl, "Email" ,""),
                ),
                SizedBox(height: 1,),
                Container(

                  decoration:
                  BoxDecoration(border: buildBottomBorder(Colors.black)),
                  child: BuildTextField(cityCtrl, "City" ,""),
                ),
                SizedBox(height: 1,),
                Container(

                  decoration:
                  BoxDecoration(border: buildBottomBorder(Colors.black)),
                  child: BuildTextField(stateCtrl, "State" ,""),
                ),
                SizedBox(height: 1,),
                Container(

                  decoration:
                  BoxDecoration(border: buildBottomBorder(Colors.black)),
                  child: BuildTextField(addCtrl, "Addrerss" ,""),
                ),
                SizedBox(height: 1,),
                Container(

                  decoration:
                  BoxDecoration(border: buildBottomBorder(Colors.black)),
                  child: BuildTextField(landmarkCtrl, "Landmark" ,""),
                ),
                SizedBox(height: 1,),

                Container(

                    decoration:
                    BoxDecoration(border: buildBottomBorder(Colors.black)),
                    child: TextField(

                      controller: geoCtrl,
                      decoration: InputDecoration(
                        icon: GestureDetector(onTap:(){
                         // Navigator.push(context, MaterialPageRoute(builder: (context)=>getLocation()));
                          getLocation();
                        },child: Icon(Icons.gps_fixed)),
                        label: Text("Geo-Location",style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal),),
                        labelStyle: TextStyle(color: Colors.black,),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    )
                ),

                SizedBox(height: 1,),
                Container(

                  decoration:
                  BoxDecoration(border: buildBottomBorder(Colors.black)),
                  child: BuildTextField(contactCtrl, "Contact No" ,""),
                ),

                SizedBox(height: 30,),

                GestureDetector(
                  onTap: (){
                    log("CONTAINER PRESSED");
                    uploadOwnerInfo();

                   // showAlertDialog();

                  },
                  child: Container(
                    //width: 90,
                    height: 40,
                    margin: EdgeInsets.symmetric(
                      horizontal: 120,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      border: Border.all(color: Colors.black,width: 2,),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 100,),









              ],
            ),
          )
        ],
      ),

    );
  }
  TextField BuildTextField(TextEditingController controller, String label ,String pre) {
    return TextField(

      controller: controller,
      decoration: InputDecoration(

        label: Text("$label",style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal),),
        labelStyle: TextStyle(color: Colors.black),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }

  Border buildBottomBorder(var color) {
    return Border(
      bottom: BorderSide(
        color: color,
        width: 1,
      ),
    );

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

  showAlertDialog() {
    // set up the button
    Widget cancelButton = TextButton(
      child: Text("Back"),
      onPressed: () {

        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Sucessfully Registered!"),
      content: Text("Let's Start Your New Journey With Us"),
      actions: [
        cancelButton,

      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

/**************  APi  **********/

//   Future UploadOwnerInfo() async {
// // print(shopCtrl);
//     print("Hello");
// // SERVER LOGIN API URL
//     var url = Uri.parse(
//         'https://echogarden.000webhostapp.com/E_COM_ONLINE_BARGAINING/add_ownerdetail.php');
// // Store all data with Param Name.
//
//     var data = {
//
//       "shop_name": shopCtrl.text,
//       "owner_name": ownerCtrl.text,
//       "gst_no": gstCtrl.text,
//       "city": cityCtrl.text,
//       "state": stateCtrl.text,
//       "address": addCtrl.text,
//       "landmark": landmarkCtrl.text,
//      "geo_location": geoCtrl.text,
//       "email": emailCtrl.text,
//       "contact_no": contactCtrl.text,
//       "pic":picker.toString().trim(),
//     };
// // Starting Web API Call.
//     var response = await http.post(url, body: json.encode(data));
//
// // Getting Server response into variable.
//     var obj = jsonDecode(response.body);
//
// // If the Response Message is Matched.
//     if (obj["result"] == 'S') {
//       print("You are Successfully Registered");
//       setState(() {
//
//       });
//     } else {
//       print("Sorry Something went wrong.");
//     }
//   }

/********************* API **************************/

  Future<void> uploadOwnerInfo() async {
print("Hello");
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              "https://echogarden.000webhostapp.com/E_COM_ONLINE_BARGAINING/add_ownerdetail.php"));

      request.files
          .add(await http.MultipartFile.fromPath('image', uploadimage!.path));

      request.fields["shop_name"] = ownerCtrl.text;
      request.fields["owner_name"] = ownerCtrl.text;
      request.fields["gst_no"] = gstCtrl.text;
      request.fields["city"] = cityCtrl.text;
      request.fields["state"] = stateCtrl.text;
      request.fields["address"] = addCtrl.text;
      request.fields["landmark"] = landmarkCtrl.text;
      request.fields["geo_location"] = geoCtrl.text;
      request.fields["email"] = emailCtrl.text;
      request.fields["contact_no"] = contactCtrl.text;
     // request.fields["pic"] = picker.toString().trim();
      // request.fields["desig"] = designationName!;
      var res = await request.send();

      if (res.statusCode == 200) {
        print("You are Successfully Registered");
      //  Navigator.push(context, MaterialPageRoute(builder: (context)=>WayToUpload()));
      } else {

        print("Sorry Something went wrong.");

      }
      }

}



/****************************/
