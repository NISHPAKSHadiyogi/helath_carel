
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helath_care/Constant/Colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'bottomBar.dart';

class Woksheetsubmitscreen extends StatefulWidget {
  //const Woksheetsubmitscreen({Key? key}) : super(key: key);
  String jobid="";


  Woksheetsubmitscreen({required this.jobid});

  @override
  _WoksheetsubmitscreenState createState() => _WoksheetsubmitscreenState();
}

class _WoksheetsubmitscreenState extends State<Woksheetsubmitscreen> {
  String rate="";
  String jobid1="";
  String job_name="";
  String address="";
  String shift_date="";
  String shift_start_time="";
  String shift_end_time="";
  String job_description="";
  String job_long="";
  String job_lat="";
  String job_status="";
  String client_name="";
  String job_price="";
  String job_id="";
  String break_time="";
  String total_work_time="";
  String start="";
  String end="";
  String check_in="";
  String check_out="";
  String client_review= "";
      String client_rate= "0";
  String client_signature= "";
  Color completecolor= Colors.red;
String path="";
  @override
  void initState() {
    // TODO: implement initState
    jobid1=widget.jobid==null?"":widget.jobid;
    jobDetail();
    setState(() {

    });
    super.initState();






  }
  Future<bool> onWillPop() async {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>bottomBar(bottom: 13, jobid: jobid1)));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop:onWillPop ,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,

          title: Text('Worksheet',style: TextStyle(color: Colors.white),),
          centerTitle: true,
          automaticallyImplyLeading: true,
          leading: Container(

            child: GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>bottomBar(bottom: 13, jobid: jobid1)));
              },
              child: Icon(Icons.arrow_back_ios_rounded,color: Colors.white,),

            ),
          ),
        ),
        body: SingleChildScrollView(

          child:
          FutureBuilder<String>(
          future: jobDetail(),
      builder: (BuildContext context,
      AsyncSnapshot<String> snapshot) {
      print("objectPrint" +
      snapshot.error
          .toString());
      if (snapshot.data=="success") {
      print("objectPrint" +
      snapshot.data!
          .toString());

      return
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 5,
                margin: EdgeInsets.all(10),
                child:
                Container(
                  padding: EdgeInsets.all(5),

                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,

                          children: [
                            Wrap(
                              // spacing: 0.5,

                                children: [

                                  Container(
                                    width: size.width*0.7,
                                    padding:EdgeInsets.all(5.8),
                                    child: Text(job_name,
                                      style: TextStyle(color: kPrimaryColor, fontSize: 14,fontWeight: FontWeight.bold),),
                                  ),
                                  Container(
                                    width:75,
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                                    margin:
                                    EdgeInsets.only(left: 3,bottom: 5,top: 5),
                                    height: 30,
                                    decoration: ShapeDecoration(
                                      color: ksecondaryColor,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 1.0,
                                            style: BorderStyle.solid,
                                            color: kPrimaryColor),
                                        borderRadius: BorderRadius.all(Radius.circular(1)),
                                      ),
                                    ),
                                    child: Text("\$${job_price}              ", style: TextStyle( color: kPrimaryColor),),
                                  ),

                                ])
                          ],
                        ),

                      ),


                      Container(
                        width: width,


                        child: Wrap(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //  mainAxisSize: MainAxisSize.max,
                          children: [

                            Container(

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Row(
                                    //  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                      children:[
                                        Container(
                                          //padding: EdgeInsets.all(2.8),
                                          child: Image.asset('assets/images/location.png',
                                            height: 20,
                                            width: 20,),
                                        ),

                                        SizedBox(width: 5,),
                                        Container(
                                          // margin: EdgeInsets.only(top: size.height*0.02),
                                          width: width*0.7,
                                          child:
                                          Text(
                                            address,
                                            style: TextStyle(fontSize: 11),),
                                        ),
                                      ]
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(2.8),
                                    child: Wrap(

                                      children: [
                                        Image.asset('assets/images/shift_date.png',
                                          height: 18,
                                          width: 20,),
                                        SizedBox(width: 5,),
                                        Text('Shift Date :', style: TextStyle(fontSize: 11),),
                                        Text(shift_date, style: TextStyle(fontSize: 11),),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(2.8),
                                    child: Wrap(
                                      children: [
                                        Image.asset('assets/images/shift_time.png',
                                          height: 18,
                                          width: 20,),
                                        SizedBox(width: 5,),
                                        Text('Shift Time :', style: TextStyle(fontSize: 11),),
                                        Text('${shift_start_time} To ${shift_end_time}', style: TextStyle(fontSize: 11),),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding:EdgeInsets.all(2.8),
                                    child: Text(job_description,
                                      style: TextStyle( fontSize: 10),),
                                  ),
                                ],
                              ),
                            ),


                          ],
                        ),

                      ),
                      Container(
                          width: width,
                          padding: EdgeInsets.all(5),
                          child:
                          Wrap(
                              spacing: 2,
                              children: [

                                Container(

                                  padding:
                                  EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                                  margin:
                                  EdgeInsets.only(left: 0,bottom: 5,right: 5),
                                  height: 30,
                                  decoration: ShapeDecoration(
                                    color: Colors.grey,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1.0,
                                        style: BorderStyle.solid,
                                        color:  Colors.grey,),
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                    ),
                                  ),
                                  child:  Text("Start Shift",
                                    style: TextStyle( color: Colors.white),),
                                ),
                                Container(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                                  margin:
                                  EdgeInsets.only(left: 0,bottom: 5),
                                  height: 30,
                                  decoration: ShapeDecoration(
                                    color: Colors.grey,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1.0,
                                        style: BorderStyle.solid,
                                        color: Color(0xffc4c4c4),),
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                    ),
                                  ),
                                  child:  Text("End  Shift", style: TextStyle( color: Colors.white),),
                                ),
                              ])
                      ),
                      Divider(
                        height: 5,
                        thickness: 1,
                        color: Colors.grey,
                      ),

                      FittedBox(
                        child:
                        Row(
                          children: [
                            /*  Container(
                          padding:EdgeInsets.all(8.8),
                          child: Text('Client Name :',
                            style: TextStyle(color: Colors.black,
                                fontSize: 16,fontWeight: FontWeight.w600),),
                        ),



                        Container(
                          padding:EdgeInsets.all(8.8),
                          child: Text(client_name,
                            style: TextStyle(color: Colors.black, fontSize: 16),),
                        ),

                       */
                            Container(
                              width: width*0.72,
                              child:
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.fromLTRB(2.8,2.8,2.8,10),
                                    child: Text('Client Name :',
                                      style: TextStyle(color: Colors.black,
                                          fontSize: 13, fontWeight: FontWeight.w600),),
                                  ),

                                  Container(
                                    width: width*0.35,
                                    padding: EdgeInsets.fromLTRB(2.8,2.8,2.8,10),
                                    child:  Text(client_name ,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 13),),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.fromLTRB(2.8,2.8,2.8,10),
                              child: Text(job_status,
                                style: TextStyle(color: completecolor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600),),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              /*
              Card(
                elevation: 5,
                margin: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: size.width*0.6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding:EdgeInsets.all(2.8),
                                  child: Text('Sugar Patient Checkup',
                                    style: TextStyle(color: kPrimaryColor, fontSize: 16),),
                                ),
                                Container(
                                  padding: EdgeInsets.all(2.8),
                                  child: Wrap(
                                    children: [
                                      Image.asset('assets/images/location.png',
                                        height: 20,
                                        width: 20,),
                                      SizedBox(width: 5,),

                                      Text('Port Washington North,New York ', style: TextStyle(fontSize: 12),),


                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(2.8),
                                  child: Wrap(

                                    children: [
                                      Image.asset('assets/images/shift_date.png',
                                        height: 18,
                                        width: 20,),
                                      SizedBox(width: 5,),
                                      Text('Shift Date :', style: TextStyle(fontSize: 12),),
                                      Text('14-09-2021', style: TextStyle(fontSize: 12),),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(2.8),
                                  child: Wrap(
                                    children: [
                                      Image.asset('assets/images/shift_time.png',
                                        height: 18,
                                        width: 20,),
                                      SizedBox(width: 5,),
                                      Text('Shift Time :', style: TextStyle(fontSize: 12),),
                                     // Text('11:00 AM To 01:30 PM', style: TextStyle(fontSize: 12),),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding:EdgeInsets.all(2.8),
                                  child: Text('Sugar Patient Checkup Sugar Patient Checkup Sugar Patient Checkup Sugar Patient Checkup Sugar Patient Checkup',
                                    style: TextStyle( fontSize: 12),),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  width:75,
                                  padding:
                                  EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                                  margin:
                                  EdgeInsets.only(left: 3,bottom: 5),
                                  height: 30,
                                  decoration: ShapeDecoration(
                                    color: ksecondaryColor,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 1.0,
                                          style: BorderStyle.solid,
                                          color: kPrimaryColor),
                                      borderRadius: BorderRadius.all(Radius.circular(1)),
                                    ),
                                  ),
                                  child: Text("110/H", style: TextStyle( color: kPrimaryColor),),
                                ),
                                Container(

                                  padding:
                                  EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                                  margin:
                                  EdgeInsets.only(left: 3,bottom: 5,right: 5),
                                  height: 30,
                                  decoration: ShapeDecoration(
                                    color: Colors.grey,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1.0,
                                        style: BorderStyle.solid,
                                        color: Color(0xffc4c4c4),),
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                    ),
                                  ),
                                  child:  Text("Start Shift", style: TextStyle( color: Colors.black),),
                                ),
                                Container(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                                  margin:
                                  EdgeInsets.only(left: 3,bottom: 5),
                                  height: 30,
                                  decoration: ShapeDecoration(
                                    color: Colors.grey,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1.0,
                                        style: BorderStyle.solid,
                                        color: Color(0xffc4c4c4),),
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                    ),
                                  ),
                                  child:  Text("End  Shift", style: TextStyle( color: Colors.black),),
                                ),


                              ],
                            ),
                          ),


                        ],
                      ),
                    ),
                    Divider(
                      height: 5,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    Wrap(
                   crossAxisAlignment: WrapCrossAlignment.start,

                      children: [
                        Container(
                          width: width*0.67,
                          child:
                          Wrap(



                          children: [
                            Container(
                              padding:EdgeInsets.all(2.8),
                              child: Text('Client Name :',
                                style: TextStyle(color: Colors.black,
                                    fontSize: 13,fontWeight: FontWeight.w600),),
                            ),

                            Container(
                              padding:EdgeInsets.all(2.8),
                              child: Text('Benjium William',
                                style: TextStyle(color: Colors.black, fontSize: 13),),
                            ),
                          ],
                        ),
                        ),

                        Container(
                          padding:EdgeInsets.all(2.8),
                          child: Text('Complete',
                            style: TextStyle(color: Colors.green, fontSize: 16,fontWeight: FontWeight.w600),),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

               */
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),

                child: Wrap(
                  children: [
                    Text('Total Working Time :',
                      style: TextStyle(color: kPrimaryColor,
                          fontSize: 14,fontWeight: FontWeight.w600),),
                    Text(total_work_time,
                      style: TextStyle(color: kPrimaryColor,
                          fontSize: 14,fontWeight: FontWeight.w600),),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),

                child: Wrap(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(

                      padding: EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.all(
                              Radius.circular(8)
                          )
                      ),
                      child:Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(5)
                            )
                        ),

                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('assets/images/checkin.png',
                                width: width/4,
                                height:  width/10,
                              ),
                            ),
                            Container(
                              padding:EdgeInsets.all(2.8),
                              child: Text('${check_in} ',
                                style: TextStyle(color: Colors.black,
                                    fontSize: 12,fontWeight: FontWeight.w600),),
                            ),
                            Container(
                              padding:EdgeInsets.all(2.8),
                              child: Text('Check In Time',
                                style: TextStyle(color: Colors.black,
                                    fontSize: 12,fontWeight: FontWeight.w600),),
                            ),
                          ],
                        ),
                      ) ,
                    ),
                    Container(

                      padding: EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.all(
                              Radius.circular(8)
                          )
                      ),
                      child:Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(5)
                            )
                        ),

                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('assets/images/check_out.png',
                                width: width/4,
                                height:  width/10,
                              ),
                            ),
                            Container(
                              padding:EdgeInsets.all(2.8),
                              child: Text('${check_out} ',
                                style: TextStyle(color: Colors.black,
                                    fontSize: 12,fontWeight: FontWeight.w600),),
                            ),
                            Container(
                              padding:EdgeInsets.all(2),
                              child: Text('Check Out Time',
                                style: TextStyle(color: Colors.black,
                                    fontSize: 12,fontWeight: FontWeight.w600),),
                            ),
                          ],
                        ),
                      ) ,
                    ),
                    Container(

                      padding: EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.all(
                              Radius.circular(8)
                          )
                      ),
                      child:Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(5)
                            )
                        ),

                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('assets/images/break_hr.png',
                                width: width/4,
                                height:  width/10,
                              ),
                            ),
                            Container(
                              padding:EdgeInsets.all(2.8),
                              child: Text('${break_time} min',
                                style: TextStyle(color: Colors.black,
                                    fontSize: 12,fontWeight: FontWeight.w600),),
                            ),
                            Container(
                              padding:EdgeInsets.all(2.8),
                              child: Text('  Break Hour ',
                                style: TextStyle(color: Colors.black,
                                    fontSize: 12,fontWeight: FontWeight.w600),),
                            ),
                          ],
                        ),
                      ) ,
                    ),
                  ],
                ),
              ),
            Row(children: [  Container(
                padding:EdgeInsets.only(top: 20,bottom: 10,left: 10),
                child: Text('Client Review ',
                  style: TextStyle(color: Colors.black,
                      fontSize: 14,fontWeight: FontWeight.normal),),
              ),
              Container(
                  width: width*0.2,

                  padding:EdgeInsets.only(top: 20,bottom: 10,left: 10),
                  child: Image.asset(path)
              ),
            ],),
              Container(
                padding:EdgeInsets.all(10),
                child: Text(client_review,
                  style: TextStyle(color: Colors.black,
                      fontSize: 12,fontWeight: FontWeight.normal),),
              ),



              Container(
                padding:EdgeInsets.all(10),
                child: Text('Digital Signature',
                  style: TextStyle(color: Colors.black,
                      fontSize: 14,fontWeight: FontWeight.normal),),
              ),
              Container( // gray box
             margin: EdgeInsets.only(left: 50,),
              height: 150,
                  child:  new Transform(
                    child: Image.network(client_signature,),
                    alignment: FractionalOffset.center,
                    transform: new Matrix4.identity()
                      ..rotateZ(-90 * 3.1415927 / 180),

                ),
              ),
            /*  Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                height: 150,
                child: Image.network(client_signature,),
                    // icon: Icon(
                    //   Icons.phone,
                    //   color: kSecondaryLightColor,
                    // ),
                    // labelText:" All_Lan().phoneno",
                   // border: OutlineInputBorder(
                      /* borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(width: 1, color: kSecondaryLightColor),*/

                    /*focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1, color: kSecondaryLightColor),
                                        borderRadius: BorderRadius.circular(5),
                                      )*/),


             */

              Container(
                padding:EdgeInsets.all(10),
                child: Text('Task Status',
                  style: TextStyle(color: Colors.black,
                      fontSize: 14,fontWeight: FontWeight.normal),),
              ),
              Container(
                padding:EdgeInsets.symmetric(horizontal: 10,),
                child: Text(job_status,
                  style: TextStyle(color: Colors.green,
                      fontSize: 14,fontWeight: FontWeight.normal),),
              ),




            ],
      );
      }
      else{return SizedBox(child:Text("loading...."));}
      })
        )
      ),
    );
  }

  Future <String> jobDetail() async {
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
    String url = 'https://technolite.in/staging/777healthcare/api/job_details';
    //Map<String, String> queryParameter = {
    //   routeKey: routeGetCount,
    //  };

    // String queryString = Uri(queryParameters: queryParameter).query;
    var requestUrl = url + '/' + jobid1 ;
    print(requestUrl);
    int i=1;
    if(i==1){
      respone  =  await http.post(Uri.parse(url),
        headers: <String, String>{'authorization': basicAuth,
          'Content-Type':"application/x-www-form-urlencoded",},
        body: ({
          'job_id':jobid1,

          'employee_id':id,




        }),);
      var jasonDataOffer = jsonDecode(respone.body);

      if(respone.statusCode == 200){
        var jasonDataOffer = jsonDecode(respone.body);
        print('Response status:  ${jasonDataOffer["data"]["username"]}');
        job_name=jasonDataOffer["data"]["job_name"];
        address=jasonDataOffer["data"]["address"];
        shift_date=jasonDataOffer["data"]["shift_date"];
        shift_start_time=jasonDataOffer["data"]["shift_start_time"];
        shift_end_time=jasonDataOffer["data"]["shift_end_time"];
        job_description=jasonDataOffer["data"]["job_description"];
        job_price=jasonDataOffer["data"]["job_price"];
        job_long=jasonDataOffer["data"]["job_long"];
        job_lat=jasonDataOffer["data"]["job_lat"];
        job_status=jasonDataOffer["data"]["job_status"];
        client_name=jasonDataOffer["data"]["client_name"];
        check_in=jasonDataOffer["data"]["check_in"];
        check_out=jasonDataOffer["data"]["check_out"];
        client_review=jasonDataOffer["data"]["client_review"];
        client_rate=jasonDataOffer["data"]["client_rate"];
        client_signature=jasonDataOffer["data"]["client_signature"];
        break_time=jasonDataOffer["data"]["break_time"];
        total_work_time=jasonDataOffer["data"]["total_work_time"];

        if(client_rate=="1") {

         path="assets/images/1.jpg";

        }

        if(client_rate=="2") {
          path="assets/images/2.jpg";


        }
        if(client_rate=="3") {
          path="assets/images/3.jpg";


        }



        if(job_status=="0")
        {
          job_status="pending";
          completecolor=Colors.red;
        }
        if(job_status == "1")
        {
          job_status="process";
          completecolor=Colors.red;
        }
        if(job_status == "3")
        {
          job_status="Review Updated";
          completecolor=Colors.green;

        }
        if(job_status == "4")

        {
          completecolor=Colors.red;
          job_status="Closed";

        }
        if(job_status == "2")
        {
          job_status="complete";
          completecolor=Colors.green;

        }
        if(check_in=="0")
        {
          start="0";
        }
        if(check_out=="0"){end="0";}






        jasonDataOffer = jsonDecode(respone.body);
       // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${jasonDataOffer["message"]}')));
        //return availModel.fromJson(jasonDataOffer);


        //  print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');
        // Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen()));
        //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password Changed  Successfully.!!')));
setState(() {

});
        return ("success");
      }else{
        print('Response status: ${respone.statusCode}');
        //  print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');

        // res= jsonDecode(respone.body);
        var jasonDataOffer = jsonDecode(respone.body);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${jasonDataOffer["message"]}')));
        //return jasonDataOffer;
        print('Response status: ${res["message"]}');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));

        return ("fail");
      }

    }

    else{
      print('Response status1: ${respone.statusCode}');
      // res= jsonDecode(respone.body);
      var jasonDataOffer = jsonDecode(respone.body);
      //return jasonDataOffer;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));
      return ("fail");
    }


  }

}
