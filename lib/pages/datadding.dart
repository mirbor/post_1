import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:post/pages/qrcode.dart' as qrcode;

class DataAdd extends StatefulWidget {

  final String? res;
  const DataAdd({Key? key, required this.res }) : super(key: key);

  @override
  State<DataAdd> createState() => _DataAddState(res);
}

class _DataAddState extends State<DataAdd> {

  String? familiya;
  String? name;
  String? otchestvo;
  int? nomer;
  int? seriya;
  int? INN;
  String? result;
  _DataAddState(this.result);

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
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
                          familiya=val;
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
                          name=val;
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
                          otchestvo=val;
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
                          nomer=int.parse(val);
                        },
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(
                              RegExp('[0-9-+]')),
                        ],
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone, color: Colors.purple,),
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
                            labelText: 'Номер',
                          labelStyle: TextStyle(
                              color: Colors.purple
                          ),
                            hintText: '0999 99 99 99',
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
                          seriya=int.parse(val);
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
                          INN=int.parse(val);
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

                              Navigator.of(context).pushNamed('scan');
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
