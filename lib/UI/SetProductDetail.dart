import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../Model/BaseCategory.dart';
class SetProductDetail extends StatefulWidget {
  const SetProductDetail({Key? key}) : super(key: key);

  @override
  _SetProductDetailState createState() => _SetProductDetailState();
}

class _SetProductDetailState extends State<SetProductDetail> {
  @override
  List ?data;

  _SetProductDetailState()
  {

    getdata();
  }

  List<BaseCategory> p=[];
  Future<void> getdata() async {
    var prm = {
    };
    // Starting App API Call.
    var response = await http.post(
        Uri.parse(
            "https://echogarden.000webhostapp.com/E_COM_ONLINE_BARGAINING/json_addcat.php"),

        body: null).catchError((e){
      if(e is SocketException)
        print( "No internet connection");
    });
    var obj = jsonDecode(response.body);
    if (obj["result"] == "S") {
      setState(() {
        data=obj["data"];
        int? l =data?.length;
        for(int x=0;x<l!;x++)
        {
          p.add(BaseCategory(data![x]["id"],data![x]["name"],data![x]["pic"],data![x]["activestatus"]));

        }

      });
    } else {
      setState(() {
        // isLoading = false;
        // error = "Student Class is not valid in the list";
      });
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [


          GridView.count(
            primary: false,
            padding: const EdgeInsets.only(top: 100,right: 20,left: 20),
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            crossAxisCount: 1,
            children:
            p.map((value) {
              return GestureDetector(
                onTap: (){
                  log("CONTAINER PRESSED");

               //   Navigator.push(context, MaterialPageRoute(builder: (context)=>WayToUpload()));
                },
                child: Container(

                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 2.0,
                          offset: Offset(2, 2)
                      )
                    ],
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(1),),
                  child: Column(
                    children: [
                      Image.network('https://echogarden.000webhostapp.com/E_COM_ONLINE_BARGAINING/'+value.pic.toString().trim(),height: 200,),
                      SizedBox(height: 50,),
                      Text(value.name,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      Text("RS :- 100",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),

                      SizedBox(height: 10,),
                      Container(
                        decoration: BoxDecoration(color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                blurRadius: 2.0,
                                offset: Offset(2, 2)
                            )
                          ],
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(1),),
                        width: 100,
                        height: 40,
                       // color: Colors.yellowAccent,
                        child: Center(child: Text("Add To Shop")),
                      ),

                    ],
                  ),
                ),
              );

            }).toList(),

          )
        ],
      )

    );
  }
}
