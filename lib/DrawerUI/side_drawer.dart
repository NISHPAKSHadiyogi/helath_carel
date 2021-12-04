import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:helath_care/Component/Utils.dart';
import 'package:helath_care/Constant/Colors.dart';
import 'package:helath_care/screens/Changepassword.dart';
import 'package:helath_care/screens/Faq.dart';
import 'package:helath_care/screens/Findshift.dart';
import 'package:helath_care/screens/Home.dart';
import 'package:helath_care/screens/Login.dart';
import 'package:helath_care/screens/Myavailability.dart';
import 'package:helath_care/screens/Mytimesheet.dart';
import 'package:helath_care/screens/Notification.dart';
import 'package:helath_care/screens/Timesheet.dart';
import 'package:helath_care/screens/Updateprofile.dart';
import 'package:helath_care/screens/Worksheet.dart';
import 'package:helath_care/screens/bottomBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:helath_care/Api/Models/userModel.dart';

class SideDrawer extends StatefulWidget {
  //const SideDrawer({Key key}) : super(key: key);

  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  var username, name, role_id, id,mobile_no;
  String username1="";
  String unique_id="";
  String image="";
  String email="";
  String mobile_no1="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  Future<void> getdata() async {
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    //
    // setState(() {
    //   username = preferences.getString("username");
    //   name = preferences.getString("name");
    //   email = preferences.getString("email");
    //   mobile_no = preferences.getString("mobile_no");
    //   role_id = preferences.getString("role_id");
    //   id = preferences.getString("id");
    // });
  }

  @override
  Widget build(BuildContext context) {
    double height, width;

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
      child: SafeArea(
        child: Container(
          width: width * 0.75,

          child: Drawer(
            child: ListView(
              children: [
                Container(

                  padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                  color: kblueColor,
                  child:  FutureBuilder<userModel>(
    future: UserDetail(),
    builder: (BuildContext context,
    AsyncSnapshot<userModel> snapshot) {
      int i = 0;
      if (i == 0) {
        return
          Column(
            children: [

              Container(
                width: 100,
                height: 100,
                margin: EdgeInsets.fromLTRB(20, 0, 5, 0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade500,
                  boxShadow: [
                    /*BoxShadow(
                                          color: Colors.black.withOpacity(.1),
                                          blurRadius: 8,
                                          spreadRadius: 3)*/
                  ],
                  borderRadius: BorderRadius.circular(80.0),
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


                /*child:FittedBox(
                    fit: BoxFit.fill,
                    child:CircleAvatar(
                        radius: 80,

                        child: ClipOval(
                            child:       image==null || image==""?Image.asset("assets/images/user.png"):Image.network(image)
                        )
                    )


          ),

                 */


              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Padding(
                        padding:
                        const EdgeInsets.fromLTRB(5, 0, 0, 0),
                        child: Text(
                          name != null ? name : username1,
                          style: TextStyle(
                              fontSize: 21, color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 8, left: 0, right: 0, bottom: 0),
                      padding: EdgeInsets.only(
                          top: 5, left: 8, right: 8, bottom: 5),
                      /*decoration: BoxDecoration(
                                color: Utils.TextWhite,
                                borderRadius: BorderRadius.circular(30),
                              ),*/
                      child: Text(
                       unique_id,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 5, left: 0, right: 0, bottom: 0),
                      padding: EdgeInsets.only(left: 8, right: 8, bottom: 5),
                      /*decoration: BoxDecoration(
                                color: Utils.TextWhite,
                                borderRadius: BorderRadius.circular(30),
                              ),*/
                      child: Text(
                        email,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 5, left: 0, right: 0, bottom: 0),
                      padding: EdgeInsets.only(left: 8, right: 8, bottom: 5),
                      /*decoration: BoxDecoration(
                                color: Utils.TextWhite,
                                borderRadius: BorderRadius.circular(30),
                              ),*/
                      child: Text(
                        mobile_no1,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
      }
      else{return SizedBox();}
    }),
                ),
                Container(
                  color: Color(0xff0e70b9),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => bottomBar( bottom: 2,jobid: "",)),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40, left: 20),
                          child: Wrap(
                            children: [
                              Container(
                                height: 30,
                                child: Container(
                                  child: Image.asset(
                                    "assets/images/home.png",
                                    fit: BoxFit.contain,
                                    color: Utils.TextGrey,
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    "Home",
                                    style: TextStyle(color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => bottomBar( bottom: 4,jobid: "",)),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40, left: 20),
                          child: Wrap(
                            children: [
                              Container(
                                height: 30,
                                child: Container(
                                  child: Image.asset(
                                    "assets/images/profile.png",
                                    fit: BoxFit.contain,
                                    color: Utils.TextGrey,
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    "Profile",
                                    style: TextStyle(color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => changepasswordScreen()),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40, left: 20),
                          child: Wrap(
                            children: [
                              Container(
                                height: 30,
                                child: Container(
                                  child: Image.asset(
                                    "assets/images/cp.png",
                                    fit: BoxFit.contain,
                                    color: Utils.TextGrey,
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    "Change Password",
                                    style: TextStyle(color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>bottomBar( bottom: 3,jobid: "",)),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40, left: 20),
                          child: Wrap(
                            children: [
                              Container(
                                height: 30,
                                child: Container(
                                  child: Image.asset(
                                    "assets/images/notification.png",
                                    fit: BoxFit.contain,
                                    color: Utils.TextGrey,
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    "Notification",
                                    style: TextStyle(color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => bottomBar( bottom: 0,jobid: "",)),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40, left: 20),
                          child: Wrap(
                            children: [
                              Container(
                                height: 30,
                                child: Container(
                                  child: Image.asset(
                                    "assets/images/my_shift.png",
                                    fit: BoxFit.contain,
                                    color: Utils.TextGrey,
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    "Task List",
                                    style: TextStyle(color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => bottomBar( bottom: 5,jobid: "",)),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40, left: 20),
                          child: Wrap(
                            children: [
                              Container(
                                height: 30,
                                child: Container(
                                  child: Image.asset(
                                    "assets/images/findshift.png",
                                    fit: BoxFit.contain,
                                    color: Utils.TextGrey,
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    "Find Shift",
                                    style: TextStyle(color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => bottomBar( bottom: 6,jobid: "",)),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40, left: 20),
                          child: Wrap(
                            children: [
                              Container(
                                height: 30,
                                child: Container(
                                  child: Image.asset(
                                    "assets/images/mytimeshift.png",
                                    fit: BoxFit.contain,
                                    color: Utils.TextGrey,
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    "My Timesheet",
                                    style: TextStyle(color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => bottomBar( bottom: 1,jobid: "",)),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40, left: 20),
                          child: Wrap(
                            children: [
                              Container(
                                height: 30,
                                child: Container(
                                  child: Image.asset(
                                    "assets/images/calender.png",
                                    fit: BoxFit.contain,
                                    color: Utils.TextGrey,
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    "Availability",
                                    style: TextStyle(color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  bottomBar( bottom: 7,jobid: "",)),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40, left: 20),
                          child: Wrap(
                            children: [
                              Container(
                                height: 30,
                                child: Container(
                                  child: Image.asset(
                                    "assets/images/faq.png",
                                    fit: BoxFit.contain,
                                    color: Utils.TextGrey,
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    "FAQ",
                                    style: TextStyle(color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => mytimesheetScreen()),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30, left: 20,right: 20,bottom: 40),
                          child:Container(
                            //margin: EdgeInsets.symmetric(vertical: 10),
                            //width: size.width * 0.85,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              // ignore: deprecated_member_use
                              child: FlatButton(
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 20),
                                color: Colors.white,
                                onPressed: () async {
                                 SharedPreferences sp = await SharedPreferences.getInstance();
                                 sp.clear();
                                 Navigator.pushReplacement(
                                   context,
                                   MaterialPageRoute(builder: (context) => LoginScreen()),
                                 );


                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Logout ",
                                      style:
                                      TextStyle(color: kPrimaryColor, fontSize: 15),
                                    ),
                                    Image.asset(
                                      'assets/images/next_clr.png',
                                      height: 20,
                                      width: 25,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),




                    ],
                  ),
                ),

               /* GestureDetector(
                  onTap: () async {
                    final cameras = await availableCameras();
                    final firstCamera = cameras.first;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DocumentUploadScreen(
                          camera: firstCamera,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40, left: 50),
                    child: Row(
                      children: [
                        Container(
                          height: 30,
                          child: Center(
                            child: Image.asset(
                              "assets/icons/gift.png",
                              fit: BoxFit.contain,
                              color: Utils.TextGrey,
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "Invite Friends",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),*/

              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<userModel> UserDetail() async {
    String username = 'adiyogi';
    String password = 'adi12345';
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userid = preferences.getString("userid");
    String id= userid.toString();
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
        mobile_no1=jasonDataOffer["data"]["mobile_no"];

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
