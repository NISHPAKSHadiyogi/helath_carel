import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helath_care/Constant/Colors.dart';

import 'Home.dart';


class ForgetScreen extends StatefulWidget {

  @override
  _ForgetScreenState createState() => _ForgetScreenState();
}


@override
class _ForgetScreenState extends State<ForgetScreen> {
  static TextEditingController usernameController = TextEditingController();
  static TextEditingController passController = TextEditingController();
  static TextEditingController Emailcontroller = TextEditingController();
  bool hidepassword = true;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  FocusNode focusNode = new FocusNode();

  bool progress = false;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(

        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,

                height: size.height * 0.38,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Positioned(
                      width: size.width,
                      top: 0,
                      child: Image.asset(
                        "assets/images/shape.png",
                        width: size.width * .7,

                      ),
                    ),
                    Positioned(
                      width: size.width * 0.5,
                      //top: 120,
                      child: Image.asset(
                        "assets/images/logo.png",
                        width: size.width * 0.3,
                        height: size.width * 0.35,
                      ),
                    ),
                    Positioned(
                        top: 70,
                        child: Container(
                          width: size.width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Icon(Icons.arrow_back_ios_rounded,
                                  color: Colors.white,),
                              ),

                              Container(
                                color: Colors.red,
                                width: 50,
                              )
                            ],
                          ),
                        )
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                key: formkey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        "Forgot Password",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            color: kPrimaryColor
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: size.height * 0.05,
                        width: size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0.5),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.grey, spreadRadius: 0.5),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: size.height * 0.06,
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                    color: Colors.grey,
                                    width: size.width * 0.0025,
                                  ),
                                ),
                              ),
                              child: Image.asset(
                                'assets/images/mail_clr.png',
                                height: 20,
                                width: 25,
                              ),
                            ),
                            Container(
                              width: size.width * 0.60,
                              padding: EdgeInsets.only(left: 10),
                              child: TextFormField(
                                controller: Emailcontroller,
                                decoration: InputDecoration(
                                  //labelText: firstName,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  enabled: true,
                                  hintStyle: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontSize: 15),
                                  counterStyle: TextStyle(
                                    height: double.minPositive,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),


                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        width: size.width * 0.95,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          // ignore: deprecated_member_use
                          child: FlatButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            color: kPrimaryColor,
                            onPressed: () {
                              Forget();
                              /* var bottom =0;
                              Timer(
                                Duration(seconds: 5),
                                    () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => bottomBar(bottom: bottom,),
                                  ),
                                ),
                              );*/
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "SEND ",
                                  style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                                ),
                                Image.asset(
                                  'assets/images/next.png',
                                  height: 20,
                                  width: 25,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Future <void> Forget() async {
    String username = 'adiyogi';
    String password = 'adi12345';
    var respone;

    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    print(basicAuth);
    if(Emailcontroller.text.isNotEmpty){
     respone = await http.post(Uri.parse ('https://technolite.in/staging/777healthcare/api/reset_password_request')
    ,
    headers: <String, String>{'authorization': basicAuth},
    body: ({
    //'username': usernameController.text,
    'email': Emailcontroller.text,
    'fcm_id':'dfgdfgdfg',
    'device_id':'fhfghfghh',


    })
    ,
    );


    if(respone.statusCode == 200){
    print('Response status: ${respone.body}');
    Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen()));
    var res= jsonDecode(respone.body);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(behavior: SnackBarBehavior.floating,content: Text('${res["message"]}')));

    }else{
    print('Response status: ${respone.statusCode}');
    var res= jsonDecode(respone.body);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(behavior: SnackBarBehavior.floating,content: Text('${res["message"]}')));
    }

    }

    else{
      var res= jsonDecode(respone.body);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(behavior: SnackBarBehavior.floating,content: Text('${res["message"]}')));
    }


  }


}
