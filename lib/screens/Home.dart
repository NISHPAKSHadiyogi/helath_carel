import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:helath_care/Component/Utils.dart';
import 'package:helath_care/Constant/Colors.dart';
import 'package:helath_care/DrawerUI/side_drawer.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:helath_care/Api/Models/userModel.dart';

import '../LocationServices/locationmodel.dart';
import 'Findshift.dart';
import 'Myshift.dart';
import 'Shiftdetails.dart';
import 'Worksheet.dart';
import 'bottomBar.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
   String username1="";
  String unique_id="";
  String image="";
  String email="";
  String mobile_no="";
  String id="";
  List leave_list = [];



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var userLocation = Provider.of<UserLocation>(context,listen: false);

    UserDetail();
    setState(() { });
    //super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  Future<bool> onWillPop() async {

    return false;
  }

  @override
  Widget build(BuildContext context) {
    setState(() {

    });
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;

   // Size size = MediaQuery.of(context).size;
    UserDetail();
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(

        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          elevation: 0,
          toolbarHeight: 80,
          centerTitle: true,
          leading:IconButton(
            onPressed: () {
              scaffoldKey.currentState?.openDrawer();
            },
            icon: Image.asset(
              'assets/images/menu.png',
              height: 35,
              width: 35,
            ),
          ),
          title: Container(
            child:Image.asset(
              'assets/images/logo_h.png',
              height: 50,
            ) ,
          ),
          actions:<Widget> [
            GestureDetector(
              onTap: (){
                setState(() {

                });

              },
              child: Container(
                margin: EdgeInsets.all(5),
                alignment: Alignment.center,

                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>bottomBar(bottom: 3, jobid: id)));

                  },
                  child: Image.asset(
                    'assets/images/notify.png',
                    height: 35,
                  ),
                ),
              ),
            ),
          ],
        ),
        drawer: SideDrawer(),
        body: SingleChildScrollView(child: Stack(

          children: [

            Container(
              margin: EdgeInsets.only(top: 110, left: 7, right: 7),
              width: Size.infinite.width,

              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),


                ],

              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(

                    onTap: (){
                    //  print("ghdg");
                      Navigator.push(context, MaterialPageRoute(builder: (context) => bottomBar( bottom: 0,jobid: "")));
                     // Shiftscreen();
                      },
                      child:
                  Container(
                    //color: Color(0xfff54337),

                    height: size.height * 0.18,
                    width: size.width * 0.93,
                      decoration: BoxDecoration(
                       // color: Colors.red,
                      image: DecorationImage(
                      image: AssetImage(
                      'assets/images/red.png'),


                        ),

                      ),

                    child: Container(

                      margin: EdgeInsets.only(left: width/4),

                      child:

      Center(
                        child: Text(
                          "My shift",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                  ),
      ),
                    GestureDetector(

                    onTap: (){
                    //  print("ghdg");
                    Navigator.push(context, MaterialPageRoute(builder: (context) => bottomBar( bottom: 5,jobid: "",)));
                    // Shiftscreen();
                    },
                    child:
                  Container(
                    //color: Color(0xfff54337),

                    height: size.height * 0.18,
                    width: size.width * 0.93,
                    decoration: BoxDecoration(
                      // color: Colors.red,
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/blue.png'),


                      ),

                    ),

                    child: Container(
                      margin: EdgeInsets.only(left: width/4),

                      child: Center(
                        child: Text(
                          "Find shift",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),),
      GestureDetector(

      onTap: (){
      //  print("ghdg");
      Navigator.push(context, MaterialPageRoute(builder: (context) => bottomBar( bottom: 13,jobid: "",)));
      // Shiftscreen();
      },
      child:
                  Container(
                    //color: Color(0xfff54337),

                    height: size.height * 0.18,
                    width: size.width * 0.93,
                    decoration: BoxDecoration(
                      // color: Colors.red,
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/green.png'),


                      ),

                    ),

                    child: Container(
                      margin: EdgeInsets.only(left: width/4),

                      child: Center(
                        child: Text(
                          "My Worksheet",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
      ),

                ],
              ),
            ),

            Positioned(
              child: Container(
                width: Size.infinite.width,
                height: size.height * 0.05,

                decoration: BoxDecoration(
                  color:kPrimaryColor,
                  border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 2),
                  ),
                ),
              ),
            ),
            Positioned(
      child:
   Container(
      child: FutureBuilder<userModel>(
      future: UserDetail(),
      builder: (BuildContext context,
      AsyncSnapshot<userModel> snapshot) {
        int i=0;
      if (i==0) {

      return
      Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 10),

      child: Container(
      width: Size.infinite.width,
      padding: EdgeInsets.all(5),
      //height: size.height * 0.15,

      decoration: BoxDecoration(
      color: Colors.white,
      border: Border(
      top: BorderSide(color: ksecondaryColor,width: 2),
      ),
      ),
      child: Wrap(
   spacing: 15,
      children: [
      Container(
      margin: EdgeInsets.only(left: 10),
      height: size.height * 0.12,
      width: size.width * 0.24,

      decoration: BoxDecoration(
      color: ksecondaryColor,

      borderRadius: BorderRadius.circular(100.0),
      ),
        child:
        image==null || image==""? CircleAvatar(
              backgroundColor: Colors.grey,
                radius: 100,


                backgroundImage:AssetImage("assets/images/user.png")




                   // child:  image==null || image==""?Image.asset("assets/images/user.png",fit: BoxFit.cover):Image.network(image,fit: BoxFit.cover)




        ):

        CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 100,


             backgroundImage:NetworkImage(image ,)




            //child:  Image.asset("assets/images/user.png",fit: BoxFit.cover):Image.network(image,fit: BoxFit.cover)




        ),


        /*ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: image == null
                              ? Image.asset(
                            "assets/images/date.png",
                            fit: BoxFit.contain,
                          )
                              : Image.network(
                            image,
                            fit: BoxFit.cover,
                          ),
                        ),*/
      ),
      Container(
      //margin: EdgeInsets.only(left: 20, top: 20),
      width: size.width * 0.60,

      child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Container(
      //height: 30,
      width: Size.infinite.width,
      //color: ksecondaryColor,
      child: Text(
      '${username1}',
      style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w800,
      color: Utils.app_black_color,
      ),
      ),
      ),
      Text(
      '${unique_id}',
      style: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color:Colors.grey,
      ),
      ),
      Row(
      children: [
      Container(
        child: Image.asset(
        "assets/images/mail.png",
        height: 22,
        width: 22,
        ),
      ),
      SizedBox(width: 5,),
    Container(
      width: width*0.5,
      child:  Text(
      '${email}',

      style: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color:Colors.grey,
      // color: Utils.Primary_color,
      ),
      )
      ,)
      ],
      ),
      Row(
      children: [
      Image.asset(
      "assets/images/contact.png",
      height: 22,
      width: 22,
      ),
      SizedBox(width: 5,),
      Text(
      '${mobile_no}',
      style: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color:Colors.grey,
      // color: Utils.Primary_color,
      ),
      )
      ],
      ),
      ],
      ),
      ),
      ],
      ),
      ),
      );
      }
      else{return SizedBox();}
      })
            ),
            )
            ],
       )
        )
      ),
    );
  }
 Future<userModel> UserDetail() async {
    String username = 'adiyogi';
    String password = 'adi12345';
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userid = preferences.getString("userid");
     id= userid.toString();
   //  String id= "22";


    var respone;
    var res;
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    //  String? userid = preferences.getString("userid");
    //  String id= userid.toString();
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    print(basicAuth);
    String url = 'https://technolite.in/staging/777healthcare/api/user';
    //Map<String, String> queryParameter = {
    //   routeKey: routeGetCount,
    //  };

    // String queryString = Uri(queryParameters: queryParameter).query;
    var requestUrl = url + '/' + id ;
    print(requestUrl);
    int i=1;
    if(i==1){
      respone = await http.get(Uri.parse (requestUrl)
        ,
        headers: <String, String>{'authorization': basicAuth},
      );

      var jasonDataOffer = jsonDecode(respone.body);

      if(respone.statusCode == 200){

       print('Response status:  ${jasonDataOffer["data"]["username"]}');
               username1=jasonDataOffer["data"]["username"];
       unique_id=jasonDataOffer["data"]["unique_id"];
       image=jasonDataOffer["data"]["image"];
       email=jasonDataOffer["data"]["email"];
       mobile_no=jasonDataOffer["data"]["mobile_no"];

        return userModel.fromJson(jasonDataOffer);


        //  print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');
        // Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen()));
      //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password Changed  Successfully.!!')));

      }else{
        print('Response status: ${respone.statusCode}');
        //  print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');

        // res= jsonDecode(respone.body);
        var jasonDataOffer = jsonDecode(respone.body);
        return jasonDataOffer;
        print('Response status: ${res["message"]}');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));
      }

    }

    else{
      print('Response status1: ${respone.statusCode}');
      // res= jsonDecode(respone.body);
      var jasonDataOffer = jsonDecode(respone.body);
      return jasonDataOffer;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));
    }


  }


}
