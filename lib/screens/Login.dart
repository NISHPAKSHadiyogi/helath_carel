import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helath_care/Constant/Colors.dart';
import 'package:helath_care/screens/Home.dart';
import 'package:helath_care/screens/Updateprofile.dart';
import 'package:http/http.dart' as http;
import 'package:dart_ipify/dart_ipify.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bottomBar.dart';
import 'forgotpassword.dart';
import 'Login.dart';


class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}


@override
class _LoginScreenState extends State<LoginScreen> {
  static TextEditingController usernameController = TextEditingController();
  static TextEditingController passController = TextEditingController();
  var username, password;
  SharedPreferences? preferences;
  var deviceId, fcm_token;
  late FirebaseMessaging messaging;
  bool hidepassword = true;
  // ignore: prefer_typing_uninitialized_variables, non_constant_identifier_names


  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  FocusNode focusNode = new FocusNode();

  bool progress = false;
  String Ipv4="";

  @override
  void initState() {
    super.initState();
    //createAlbum();
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
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Form(
                key: formkey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: kPrimaryColor
                        ),
                      ),
                      SizedBox(
                        height: 30,
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
                                'assets/images/user.png',
                                height: 20,
                                width: 25,
                              ),
                            ),
                            Container(
                              width: size.width * 0.60,
                              padding: EdgeInsets.only(left: 10),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                controller: usernameController,

                                /*validator: ((value) {
                                  if (value!.isEmpty) {
                                    return "Username Required!!";
                                  }
                                  return null;
                                }),*/
                                decoration: InputDecoration(

                                  //labelText: firstName,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  enabled: true,
                                  hintStyle: TextStyle(
                                      color: Colors.grey.shade400, fontSize: 15),

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
                                keyboardType: TextInputType.visiblePassword,
                                controller: passController,
                                decoration: InputDecoration(
                                  //labelText: password,
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
                            Image.asset(
                              'assets/images/eye.png',
                              height: 20,
                              width: 25,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 7,
                      ),

                      GestureDetector(
                        onTap: (){

                          Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetScreen()));


                        },
                        child: Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(left: 16),
                          child: Text(
                            "Forgot Password? ",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 15),
                          ),
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
                              ip();
                              login();
                              /*
                              //createAlbum();
                              if (formkey.currentState!.validate()) {
                                var urname = usernameController.text;
                                var pass = passController.text;

                                //SendLoginData(urname, pass);
                                var bottom =2;
                                Timer(
                                  Duration(seconds: 1),
                                      () => Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => bottomBar(bottom: bottom,),
                                    ),
                                  ),
                                );
                                //main();

                              }

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
                                  "LOG IN ",
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



  void ip() async {
    final ipv4 = await Ipify.ipv4();
     Ipv4=ipv4;

    print(ipv4); // 98.207.254.136

    final ipv6 = await Ipify.ipv64();
    print(ipv6); // 98.207.254.136 or 2a00:1450:400f:80d::200e

    final ipv4json = await Ipify.ipv64(format: Format.JSON);
    print(ipv4json); //{"ip":"98.207.254.136"} or {"ip":"2a00:1450:400f:80d::200e"}

    // The response type can be text, json or jsonp
  }

/*  main() async {
    String username = 'adiyogi';
    String password = 'adi12345';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    print(basicAuth);

     var response  = await http.post(Uri.parse('https://technolite.in/staging/777healthcare/api/login'),
        headers: <String, String>{'authorization': basicAuth},
        body: jsonEncode(<String, String>{
         'username': "test_hello",
         'password': "hello@123",
         'fcm_id': "gghhfjf",
         'device_id': "xcfkvb",
         'ip': "21262",
       }),
     );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    //sprint(response.body);
  }
*/
  Future<String> _getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId; // unique ID on Android
    }
  }

  Future<void> getData() async {
    setState(() async {
      this.preferences = await SharedPreferences.getInstance();
      deviceId = await _getId();
      this.preferences?.setString("device", deviceId);

      var dev = this.preferences?.getString("device");
      messaging = FirebaseMessaging.instance;
      messaging.getToken().then((value) {
        fcm_token = value;
        print("objectToken" + fcm_token);
      });
    });
  }
  Future <void> login() async{
    ScaffoldMessenger.of(context).showSnackBar(SnackBar( behavior: SnackBarBehavior.floating,content: Text('Loading')));

    String username = 'adiyogi';
    String password = 'adi12345';
    String ip= Ipv4;
    var respone;
    var res;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    print(basicAuth);
   int i=0;
    if(i==0){
       respone  =  await http.post(Uri.parse('https://technolite.in/staging/777healthcare/api/login'),
        headers: <String, String>{'authorization': basicAuth},
       body: ({
            'username': usernameController.text,
            'password': passController.text,
            'fcm_id':'dfgdfgdfg',
            'device_id':'fhfghfghh',
            'ip':'4465464'


          }),);

      if(respone.statusCode == 200){
        print('Response status: ${respone.body}');
         res= jsonDecode(respone.body);
        this.preferences = await SharedPreferences.getInstance();
        this.preferences?.setString("username", usernameController.text);
        this.preferences?.setString("password", passController.text);
        this.preferences?.setString("userid",res["data"]['id'] );
        print('Response status: ${res["data"]['id']}');
       // res= jsonDecode(respone.body);
        print('Response status: ${res["message"]}');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(behavior: SnackBarBehavior.floating,content: Text('${res["message"]}')));

        Navigator.push(context, MaterialPageRoute(builder: (context) => bottomBar( bottom: 2,jobid: "0")));

      }else{
        res= jsonDecode(respone.body);
        print('Response status: ${res["message"]}');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(behavior: SnackBarBehavior.floating,content: Text('${res["message"]}')));
      }

    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(behavior: SnackBarBehavior.floating,content: Text('${res["message"]}')));
    }
  }



}






