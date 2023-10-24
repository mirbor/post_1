import 'package:flutter/material.dart';
import 'package:post/pages/datadding.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class QRscanner extends StatefulWidget {
  const QRscanner({Key? key}) : super(key: key);

  @override
  State<QRscanner> createState() => _QRscannerState();
}

class _QRscannerState extends State<QRscanner> {
  static const kprimaryColor = Color(0xFFBA68C8);
  String? result;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/37b57509ff47f603e522df4fcb5c3b48.jpg'),
              fit: BoxFit.cover
            )
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
                        ));
                    setState(() {
                      if (res is String) {
                        result = res;
                      }
                    });
                    var route= new MaterialPageRoute(
                      builder: (BuildContext context)=>
                        new DataAdd(res: result),
                    );
                    Navigator.of(context).push(route);
                  },
                  icon: Icon(Icons.camera_alt_outlined),
                  label: Text(
                    'Начать сканирование',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
