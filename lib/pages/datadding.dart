import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:post/pages/UserObj.dart';
import 'package:post/pages/push.dart';


class DataAdd extends StatefulWidget {

  final String? res;
  final String? id;
  const DataAdd({Key? key, required this.res, required this.id }) : super(key: key);

  @override
  State<DataAdd> createState() => _DataAddState(res,id);
}

class _DataAddState extends State<DataAdd> {

  String? result;
  String? id;
  _DataAddState(this.result,this.id);

  Data data = new Data(
      familiya: '',
      name: '',
      otchestvo: '',
      seriya: '',
      inn: '');

  Future<UserObj> postData(Data data) async {
    final http.Response response = await http.post(
      Uri.parse('http://77.235.20.21:8087/api/Mobiles/Vruchit'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'LastName': data.familiya ?? "",
        'Name': data.name ?? "",
        'Otchestvo': data.otchestvo ?? "",
        'PIN': data.inn ?? "",
        'Passport': data.seriya ?? "",
        'Id':this.id??""
      }),
    );
    print(response.body);
    if (response.statusCode == 200) {
      return UserObj.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create album.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/ultraviolet.jpg'),
          fit: BoxFit.cover
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Отправка отчета'),
          toolbarHeight: 40,
          leading: IconButton(
            onPressed: ()=> Navigator.pushNamed(context, 'scan'),
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body:
        GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
            FocusScopeNode currentFocus = FocusScope.of(context);
            if(!currentFocus.hasPrimaryFocus){
              currentFocus.unfocus();
            }
          },
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top:30)),
                  Padding(
                    padding: const EdgeInsets.only(left:30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Text('Товар: ', style:
                                TextStyle(
                                  fontSize: 25,
                                  color: Colors.white
                                )
                                ,),
                              Text('$result', style:
                              TextStyle(
                                  fontSize: 20,
                                  color: Colors.amber
                              )
                                ,),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 17),
                child: Container(
                padding : EdgeInsets.only(top: 10, bottom: 20,left: 5, right: 15),
                margin: EdgeInsets.fromLTRB(10, 30, 20,0),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top:3),
                      child: TextField(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        onChanged: (String val){
                          data.familiya=val;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.manage_accounts, color: Colors.purple,),
                          focusedBorder:OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Colors.purpleAccent)
                          ) ,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(width: 2, color: Colors.white)
                          ),
                          contentPadding: EdgeInsets.all(20),
                          labelText: 'Фамилия',
                            labelStyle: TextStyle(
                                color: Colors.purple
                            )
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top:20)),
                    Padding(
                      padding: EdgeInsets.only(top:3),
                      child: TextField(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        onChanged: (String val){
                          data.name=val;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.man_3_rounded, color: Colors.purple,),
                            focusedBorder:OutlineInputBorder(
                                borderSide: BorderSide(width: 2, color: Colors.purpleAccent)
                            ) ,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.white
                                )
                            ),
                          contentPadding: EdgeInsets.all(20),
                          labelText: 'Имя',
                          labelStyle: TextStyle(
                            color: Colors.purple
                          )
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top:20)),
                    Padding(
                      padding: EdgeInsets.only(top:3),
                      child: TextField(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        onChanged: (String val){
                          data.otchestvo=val;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.manage_accounts_outlined, color: Colors.purple,),
                            focusedBorder:OutlineInputBorder(
                                borderSide: BorderSide(width: 2, color: Colors.purpleAccent)
                            ) ,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.white
                                )
                            ),
                          contentPadding: EdgeInsets.all(20),
                          labelText: 'Отчество',
                            labelStyle: TextStyle(
                                color: Colors.purple
                            )
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top:20)),
                    Padding(
                      padding: EdgeInsets.only(top:3),
                      child: TextField(
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 18,
                        ),
                        onChanged: (String val){
                          data.seriya=val;
                        },
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(
                              RegExp('[0-9-]')),
                        ],
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.account_box_rounded, color: Colors.purple,),
                          focusedBorder:OutlineInputBorder(
                              borderSide: BorderSide(width: 2, color: Colors.purpleAccent)
                          ) ,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.white
                              )
                          ),
                          contentPadding: EdgeInsets.all(20),
                          labelText: 'Серия паспорта',
                          labelStyle: TextStyle(
                              color: Colors.purple
                          ),
                          hintText: '',
                          hintStyle: TextStyle(color: Colors.black54,fontSize: 16),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top:20)),
                    Padding(
                      padding: EdgeInsets.only(top:3),
                      child: TextField(
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 18,
                        ),
                        onChanged: (String val){
                          data.inn=val;
                        },
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(
                              RegExp('[0-9-]')),
                        ],
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.add, color: Colors.purple,),
                          focusedBorder:OutlineInputBorder(
                              borderSide: BorderSide(width: 2, color: Colors.purpleAccent)
                          ) ,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.white
                              )
                          ),
                          contentPadding: EdgeInsets.all(20),
                          labelText: 'ИНН',
                            labelStyle: TextStyle(
                                color: Colors.purple
                            ),
                          hintStyle: TextStyle(color: Colors.black54,fontSize: 16),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top:40)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: (){
                              postData(data).then((result) {
                               if (result.isAuthSuccessful){
                               Navigator.of(context).pushNamed('new');
                               };
                               });
                            },
                            child: Container(
                              height: 50,
                              width: 250,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text('Отправить',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20
                                ),
                                ),
                              ),
                            ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                          ),
                        )
                      ],
                    )
                  ],
                ),
      ),
              )]),
            ),
          ),
        )),
    );
  }
}
