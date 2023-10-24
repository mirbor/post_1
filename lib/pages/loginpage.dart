import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late String email;
  late String pass;
  bool _obscured = true;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
    });
  }
  static const kprimaryColor = Color(0xFFF1E6FF);
  static const primaryColor = Color(0xFFE1BEE7);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimaryColor,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          height: 900,
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //         image: AssetImage('assets/IMG_20231014_084218.jpg'),
          //         fit: BoxFit.cover
          //     )
          // ),
          child:
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top:80)),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     SizedBox(
                //       child: Text(
                //         'Привет',
                //         style: TextStyle(
                //           fontSize: 60,
                //           color: Colors.white,
                //
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // Padding(padding: EdgeInsets.only(top:10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Text(
                        'Войдите в свой аккаунт',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.purple,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top:20)),
                Image(image: AssetImage('assets/—Pngtree—postman taking a letter_4404340.png')),
                Padding(padding: EdgeInsets.only(top:10)),
                Container(
                  padding : EdgeInsets.only(top: 10, bottom: 20,left: 5, right: 15),
                  margin: EdgeInsets.fromLTRB(10, 30, 20,0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          style: TextStyle(
                              color: Colors.purple,
                              fontSize: 15
                          ),
                          onChanged: (String val){
                            email=val;
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(10),
                              prefixIcon: Icon(
                                Icons.manage_accounts,
                                color: Colors.purple,
                                size: 20,
                              ),
                              prefixIconConstraints: BoxConstraints(
                                  maxHeight: 20,
                                  minWidth: 40
                              ),
                              hintText: ' Email',
                              hintStyle: TextStyle(color: Colors.purpleAccent,fontSize: 15)
                          ),
                        ),

                      ),
                      Padding(padding: EdgeInsets.only(top:20)),
                      Container(
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          keyboardType:TextInputType.visiblePassword,
                          obscureText:_obscured,
                          style: TextStyle(
                            color: Colors.purple,
                            fontSize: 15,
                          ),
                          onChanged: (String val){
                            pass=val;
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                              contentPadding: EdgeInsets.all(14),
                              prefixIcon: Icon(
                                Icons.key,
                                color: Colors.purple,
                                size: 20,
                              ),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                child: GestureDetector(
                                  onTap: _toggleObscured,
                                  child: Icon(
                                    _obscured
                                        ? Icons.visibility_off_rounded
                                        : Icons.visibility_rounded,
                                    size: 24,
                                    color: Colors.purple,
                                  ),
                                ),
                              ),
                              prefixIconConstraints: BoxConstraints(
                                  maxHeight: 20,
                                  minWidth: 40
                              ),
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.purpleAccent,fontSize: 15)
                          ),
                        ),
                        // padding: EdgeInsets.only(bottom:20),
                      ),
                      Padding(padding: EdgeInsets.only(top:20)),
                      Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left:140)),
                          Image(image: AssetImage('assets/postbox.png'), width: 60,height: 80,),
                          Padding(padding: EdgeInsets.only(left:35)),
                          ElevatedButton(
                            onPressed: (){
                              if(email=='test' && pass=='test'){
                                Navigator.restorablePushReplacementNamed(context, 'scan');}
                              else if(email=='' || pass=='' || email==pass && pass==''){
                                final snackBar1 = SnackBar(
                                  closeIconColor: Colors.red,
                                  content: Text('Заполните все данные'),
                                  duration: Duration(seconds: 2),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar1);
                              }
                              else{
                                final snackBar = SnackBar(
                                  closeIconColor: Colors.red,
                                  content: Text('Вы неправильно ввели свои данные'),
                                  duration: Duration(seconds: 2),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            };
                              },
                            child: Text('Войти'),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purple
                            ),
                          )
                        ],
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Text('Добро пожаловать в Dmad!',
                      //         style: TextStyle(
                      //             fontSize: 25,
                      //             color: Colors.white60,
                      //             fontWeight: FontWeight.bold
                      //         ))
                      //   ],
                      // ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );


  }
}
