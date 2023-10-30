import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:post/pages/datadding.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import 'package:post/pages/UserObj.dart';

class QRscanner extends StatefulWidget {

  final int? otdelenieID;

  const QRscanner({Key? key, required this.otdelenieID}) : super(key: key);

  @override
  State<QRscanner> createState() => _QRscannerState(otdelenieID);
}

class _QRscannerState extends State<QRscanner> {

  int? otdelen;

  _QRscannerState(this.otdelen);

  String? result;

  Future<UserObj> authenticate(String? barcode ) async {
    final http.Response response = await http.post(
      Uri.parse('http://77.235.20.21:8087/api/Mobiles/CheckItems'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'Name': barcode ?? "",
        'OtdelenieId':otdelen.toString(),
      }),
    );
    print("Results: "+response.body);
    return UserObj.fromJson(json.decode(response.body));
    // final tt=TokenObj(IsAuthSuccessful: false,errorMessage: "test",Token: "test");

    // tt.IsAuthSuccessful=body['IsAuthSuccessful'];
    //print("Rets: "+body['errorMessage']);
    // return json.decode(response.body);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Сканирование'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        leading: IconButton(
          onPressed: ()=> Navigator.pushNamed(context, 'log'),
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ),
      ),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
          FocusScopeNode currentFocus = FocusScope.of(context);
          if(!currentFocus.hasPrimaryFocus){
            currentFocus.unfocus();
          }
        },
        child: SingleChildScrollView(
          reverse: true,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/37b57509ff47f603e522df4fcb5c3b48.jpg'),
                  fit: BoxFit.cover
                )
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      width: 350,
                      child: TextField(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,

                        ),
                        onChanged: (String val){
                          result=val;
                        },
                        decoration: InputDecoration(
                          labelText: 'BarCode',
                          labelStyle: TextStyle(
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(width: 2, color: Colors.purple)
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Colors.amber)
                          )
                        ),
                      )
                    ),
                    Padding(padding: EdgeInsets.only(top:30)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 40,
                          width: 150,
                          child: ElevatedButton(
                              onPressed: (){
                                authenticate(result).then((data) {
                                  if (data.isAuthSuccessful){
                                    var route= new MaterialPageRoute(
                                      builder: (BuildContext context)=>
                                      new DataAdd(res: result,id:data.Name),
                                    );
                                    Navigator.of(context).push(route);
                                  }
                                });
                              },
                              child: Text('Проверить', style: TextStyle(fontSize: 17),),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple,
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top:450)),
                    Container(
                      width: 350,
                      height: 50,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple),
                        onPressed: () async {
                          var res = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SimpleBarcodeScannerPage(),
                              )
                          );
                          setState(() {
                            if (res is String) {
                              result = res;
                            }
                          });

                          if(result!='-1')
                          {
                            authenticate(result).then((data) {
                              if (data.isAuthSuccessful){
                                var route= new MaterialPageRoute(
                                  builder: (BuildContext context)=>
                                  new DataAdd(res: result,id:data.Name),
                                );
                                Navigator.of(context).push(route);
                              }
                            });
                            //Navigator.of(context).push(route);
                          }


                        },
                        icon: Icon(Icons.camera_alt_outlined),
                        label: Text(
                          'Начать сканирование',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    // Padding(padding: EdgeInsets.only(top:37)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
