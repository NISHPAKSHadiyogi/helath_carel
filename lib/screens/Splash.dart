import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helath_care/Component/BottomBar.dart';
import 'package:helath_care/screens/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Login.dart';
import 'bottomBar.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);



  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  void initState() {
    super.initState();
     getData();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
          children: [
            Container(
                constraints: BoxConstraints.tight(size),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/splash.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    "assets/images/logo.png",
                    height: 180,
                  ),
                )),
          ],
        ));
  }

  Future<void> getData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      //SharedPreferences preferences = await SharedPreferences.getInstance();
      String? userid = preferences.getString("userid");
      String id= userid.toString();

      Future.delayed(
        Duration(seconds: 4),
            () {
          if (id==null) {
            print(id);
             Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => BottomBar(bottom: 0)),
             );

            }
           else {
             // Navigator.push(context, MaterialPageRoute(builder: (context) => bottomBar(bottom: 2,jobid: id,)),);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );


          }
        },
      );
    });
  }
 /* getPrefance() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userid = preferences.getString("userid");
    String id= userid.toString();

    setState(() {
      //int bottom=9;

      Timer(
        Duration(seconds: 5),
            () =>



      Navigator.pushReplacement(
      context,
      MaterialPageRoute(
      builder: (context) => Homescreen(),
      ),
      )
      ,

      );

    });
  }

  */
}
