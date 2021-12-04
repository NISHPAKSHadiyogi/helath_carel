import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helath_care/Constant/Colors.dart';
import 'package:helath_care/screens/Home.dart';
import 'package:helath_care/screens/Updateprofile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Login.dart';

import 'bottomBar.dart';
import 'forgotpassword.dart';
import 'package:http/http.dart' as http;

class changepasswordScreen extends StatefulWidget {

  @override
  _changepasswordScreenState createState() => _changepasswordScreenState();
}


@override
class _changepasswordScreenState extends State<changepasswordScreen> {
  static TextEditingController oldpassController = TextEditingController();
  static TextEditingController newpassController = TextEditingController();
  static TextEditingController cnfpassController = TextEditingController();

  bool hidepassword = true;
  bool _isObscure = true;
  bool _isObscure1 = true;
  bool _isObscure2 = true;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  FocusNode focusNode = new FocusNode();

  bool progress = false;

  @override
  void initState() {

    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,

                height:size.height*0.38,
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
                              GestureDetector(
                                onTap: (){
                                  Navigator.of(context).pop();

                                },
                                child: Icon(Icons.arrow_back_ios_rounded,color: Colors.white,),

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
              Form(
                key: formkey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        "Change Password",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
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
                              height: size.height * 0.08,
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
                                'assets/images/key.png',
                                height: 20,
                                width: 25,
                              ),
                            ),
                            Container(
                              width: size.width * 0.68,
                              padding: EdgeInsets.only(left: 10),
                              child: TextFormField(
                                controller: oldpassController,
                                obscureText: _isObscure,
                                decoration: InputDecoration(
                                  hintText: "Current Password",
                                  //labelText: firstName,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  enabled: true,
                                  hintStyle: TextStyle(
                                      color: Colors.grey.shade400, fontSize: 15),
                                  counterStyle: TextStyle(
                                    height: double.minPositive,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap:  (){

                                var a   = oldpassController.text;
                                setState(() {
                                  _isObscure = !_isObscure;
                                });

                              },
                              child: Image.asset(
                                'assets/images/eye.png',
                                height: 20,
                                width: 25,
                              ),
                            ),
                          ],
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
                              height: size.height * 0.08,
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
                                'assets/images/key.png',
                                height: 20,
                                width: 25,
                              ),
                            ),
                            Container(
                              width: size.width * 0.68,
                              padding: EdgeInsets.only(left: 10),
                              child: TextFormField(
                                controller: newpassController,
                                obscureText: _isObscure1,
                                decoration: InputDecoration(
                                  //labelText: firstName,
                                  hintText: "New Password",
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  enabled: true,
                                  hintStyle: TextStyle(
                                      color: Colors.grey.shade400, fontSize: 15),
                                  counterStyle: TextStyle(
                                    height: double.minPositive,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap:  (){

                                var a   = newpassController.text;
                                setState(() {
                                  _isObscure1 = !_isObscure1;
                                });

                              },
                              child: Image.asset(
                                'assets/images/eye.png',
                                height: 20,
                                width: 25,
                              ),
                            ),
                          ],
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
                              height: size.height * 0.08,
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
                                'assets/images/key.png',
                                height: 20,
                                width: 25,
                              ),
                            ),
                            Container(
                              width: size.width * 0.68,
                              padding: EdgeInsets.only(left: 10),
                              child: TextFormField(
                                controller: cnfpassController,
                                obscureText: _isObscure2,
                                decoration: InputDecoration(
                                  //labelText: firstName,
                                  hintText: "Confirm Password",
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  enabled: true,
                                  hintStyle: TextStyle(
                                      color: Colors.grey.shade400, fontSize: 15),
                                  counterStyle: TextStyle(
                                    height: double.minPositive,
                                  ),
                                ),
                              ),
                            ),

                            GestureDetector(
                              onTap:  (){

                                var a   = cnfpassController.text;
                                setState(() {
                                  _isObscure2 = !_isObscure2;
                                });

                              },
                              child: Image.asset(
                                'assets/images/eye.png',
                                height: 20,
                                width: 25,
                              ),
                            ),
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
                              chagepassord();
                             /* var bottom =2;
                              Timer(
                                Duration(seconds: 1),
                                    () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => bottomBar(bottom: bottom,),
                                  ),
                                ),
                              );

                              */
                              /* Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Homescreen();
                                  },
                                ),
                              );*/

                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "CONFIRM ",
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

  Future <void> chagepassord() async {
    String username = 'adiyogi';
    String password = 'adi12345';
    var respone;
    var res;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userid = preferences.getString("userid");
    String id= userid.toString();
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    print(basicAuth);
    int i=1;
    if(i==1){
      respone = await http.post(Uri.parse ('https://technolite.in/staging/777healthcare/api/change_password')
        ,
        headers: <String, String>{'authorization': basicAuth},
        body: ({
          'id': id,
          'old_password': oldpassController.text,
          'new_password': newpassController.text,
          'confrim_password':cnfpassController.text,
        //  'fcm_id':'dfgdfgdfg',
        //  'device_id':'fhfghfghh',


        })
        ,
      );


      if(respone.statusCode == 200){
        print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');
        Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen()));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.green,content: Text('${res["message"]}')));

      }else{
        print('Response status: ${respone.statusCode}');
        print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');

        res= jsonDecode(respone.body);
        var data=res["data"].split("\n");
        var data1=data[0].split("<p>");
        var data2=data1[1].split("</p>");
        print('Response status: ${res["message"]}');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.red,content: Text(data2[0])));
      }

    }

    else{
      // res= jsonDecode(respone.body);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));
    }


  }


}




