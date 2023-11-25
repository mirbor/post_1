import 'package:flutter/material.dart';
import 'package:post/pages/datadding.dart';

class Poluch extends StatefulWidget {
  final String? res;
  final int? id;
  final int? otdelenieId;
  final String? lastName;
  final String? firstName;
  final String? patName;
  const Poluch({Key? key, required this.res, required this.id, required this.otdelenieId,required this.lastName,required this.firstName, required this.patName})
      : super(key: key);
  @override
  State<Poluch> createState() => _PoluchState(res, id, otdelenieId, lastName,firstName,patName);
}

class _PoluchState extends State<Poluch> {
  String? result;
  int? id;
  int? otdelen;
  String? last;
  String? first;
  String? pat;
  _PoluchState(this.result, this.id, this.otdelen, this.last,this.first, this.pat);

  static const backColor = Color(0xFFEF9A9A);
  static const primaryColor = Color(0xFFE53935);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Получатель :',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Container(
              width: 350,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
                onPressed: () {
                  var route = new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new DataAdd(res: result, id: id, otdelenie: otdelen,fam: last,name: first,otch: pat,),
                  );
                  Navigator.of(context).push(route);
                },
                child: Text(
                  'Лично',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Container(
              width: 350,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
                onPressed: () {
                  var route = new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new DataAdd(res: result, id: id, otdelenie: otdelen,fam: '',name: '',otch: '',),
                  );
                  Navigator.of(context).push(route);
                },
                child: Text(
                  'Доверенное лицо',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
