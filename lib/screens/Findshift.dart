import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helath_care/Constant/Colors.dart';
import 'package:helath_care/screens/bottomBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'Home.dart';
import 'Shiftdetails.dart';
import 'package:helath_care/Api/Models/siftModel.dart';

class FindshiftScreen extends StatefulWidget {
  const FindshiftScreen({Key? key}) : super(key: key);

  @override
  _FindshiftScreenState createState() => _FindshiftScreenState();
}

class _FindshiftScreenState extends State<FindshiftScreen> {

  String limit = '10';
  String offset = '0';
  String job_name="";
  String client_name="";
  String shift_date="";
  String shift_start_time="";
  String shift_end_time="";
  String address="";
  int countera=0;
late List <Color> acolors=<Color>[];
  late String id;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,

        title: Text('Findshift',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: Container(
          padding: EdgeInsets.only(top: 20),

          child: SingleChildScrollView(
            child: Column(
              children: [

             Container(


                   height: height*0.80,
    child: FutureBuilder<siftModel>(
    future: jobsiftopen(),
    builder: (BuildContext context,
    AsyncSnapshot<siftModel> snapshot) {
            if (snapshot.hasData) {
                print("objectPrint" +
                    snapshot.data!.data
                        .toString());


                return

                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: refresh,
                      child: ListView.builder(
                        itemCount: snapshot.data!.data.length, itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              if(acolors[index]==kPrimaryColor) {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) =>
                                        bottomBar(bottom: 14,
                                            jobid: snapshot.data!.data[index]
                                                .id)));
                              }
                              else{
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) =>
                                        bottomBar(bottom: 9,
                                            jobid: snapshot.data!.data[index]
                                                .id)));

                              }

                            },
                            child:
    Card(
    elevation: 5,
    margin: EdgeInsets.all(10),
    child:
    Container(
    padding: EdgeInsets.all(5),
    child: Column(

    mainAxisAlignment: MainAxisAlignment.spaceBetween,

    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Wrap(
    // spacing: 0.5,

    children: [
    Container(
    padding: EdgeInsets.all(2.8),
    width: size.width * 0.7,
    child:  Text(
    '${snapshot.data!
                .data[index].job_name}',
    style: TextStyle(
    color: kPrimaryColor, fontSize: 16,fontWeight: FontWeight.bold),),
    ),
    Container(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    /*  Container(

                                    padding:
                                    EdgeInsets.symmetric(
                                        horizontal: 7, vertical: 5),
                                    margin:
                                    EdgeInsets.only(left: 3, bottom: 5, right: 5),
                                    height: 30,
                                    decoration: ShapeDecoration(
                                      color: ksecondaryColor,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 1.0,
                                            style: BorderStyle.solid,
                                            color: kPrimaryColor),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(1)),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset('assets/images/map.png'),
                                        SizedBox(width: 3,),
                                        Text("Map",
                                          style: TextStyle(color: kPrimaryColor),),

                                      ],
                                    ),
                                  ),

                                 */
    Container(

    padding: EdgeInsets.all(2.8),
    margin:
    EdgeInsets.only(left: 3, bottom: 5),


    child: Text(" \$110/H",
    style: TextStyle(color: kPrimaryColor,
    fontWeight: FontWeight.bold),),
    ),


    ],
    ),
    ),

    ],),
    Container(
    width: width,
    child: Wrap(
    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //mainAxisSize: MainAxisSize.max,
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
                '${snapshot.data!
                    .data[index].address}',
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
    Text('Shift Date :',
    style: TextStyle(fontSize: 11),),
    Text(
    '${snapshot.data!
                .data[index].shift_date}',
    style: TextStyle(fontSize: 11),),
    ],
    ),
    ),

    Container(
    padding: EdgeInsets.fromLTRB(2.8,2.8,2.8,10),
    child: Wrap(
    children: [
    Image.asset('assets/images/shift_time.png',
    height: 18,
    width: 20,),
    SizedBox(width: 5,),
    Text('Shift Time :',
    style: TextStyle(fontSize: 11),),
    Text(
    '${snapshot.data!
                .data[index].shift_start_time}  To ${snapshot.data!
                .data[index].shift_end_time}',
    style: TextStyle(fontSize: 12),),
    ],
    ),
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
    FittedBox(
    child:
    Wrap(
    crossAxisAlignment: WrapCrossAlignment.start,

    // mainAxisAlignment: MainAxisAlignment.spaceBetween,

    children: [
    Container(
    width: width*0.72,
    child:
    Wrap(
    children: [
    Container(
    padding: EdgeInsets.fromLTRB(2.8,2.8,2.8,10),
    child: Text('Client Name :',
    style: TextStyle(color: Colors.black,
    fontSize: 13, fontWeight: FontWeight.w600),),
    ),

    Container(
    padding: EdgeInsets.fromLTRB(2.8,2.8,2.8,10),
    child:  Text('${snapshot.data!
                .data[index].client_name} ',
    style: TextStyle(
    color: Colors.black, fontSize: 13),),
    ),
    ],
    ),
    ),
            GestureDetector(
                onTap: () {
    // handleReadOnlyInputClick(context);
    if(countera==0){
    Accept(snapshot.data!
        .data[index].id);

    setState(() {


    });
    }
    if(countera==1){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar( behavior: SnackBarBehavior.floating,content: Text('Already Accepted Job')));

    }

    countera=1;


                },
                child:
                Container(

                  padding:
                  EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                  margin:
                  EdgeInsets.only(
                        left: 3, bottom: 0, right: 0),

                  decoration: ShapeDecoration(
                      color: acolors[index],
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1.0,
                          style: BorderStyle.solid,
                          color: Color(0xfff7efef),),
                        borderRadius: BorderRadius.all(
                            Radius.circular(5)),
                      ),
                  ),
                  child: Text("Accept",
                      style: TextStyle(color: Colors.white),),
                ),
            )

    ],
    ),
    ),
    ],
    ),
    )
    ));

    /*             Card(
                                elevation: 5,
                                margin: EdgeInsets.all(10),
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Wrap(children: [
                                        Container(
                                          width: size.width * 0.7,
                                          padding: EdgeInsets.all(2.8),
                                          child: Text('${snapshot.data!.data[index].job_name}',
                                            style: TextStyle(
                                                color: kPrimaryColor, fontSize: 16),),
                                        ),
                                        Container(

                                          padding: EdgeInsets.all(2.8),
                                          margin:
                                          EdgeInsets.only(left: 3, bottom: 5),


                                          child:  Text('${snapshot.data!.data[index].id}',
                                            style: TextStyle(color: kPrimaryColor,
                                                fontWeight: FontWeight.bold),),
                                        ),
                                      ]),
                                      Container(
                                        width: width,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceBetween,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(

                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
                                                children: [

                                                  Container(
                                                    padding: EdgeInsets.all(2.8),
                                                    child: Wrap(
                                                      children: [
                                                        Image.asset(
                                                          'assets/images/location.png',
                                                          height: 20,
                                                          width: 20,),
                                                        SizedBox(width: 5,),
                                                        Text('${snapshot.data!.data[index].address}',
                                                          style: TextStyle(
                                                              fontSize: 11),),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(2.8),
                                                    child: Wrap(

                                                      children: [
                                                        Image.asset(
                                                          'assets/images/shift_date.png',
                                                          height: 18,
                                                          width: 20,),
                                                        SizedBox(width: 5,),
                                                        Text('Shift Date :',
                                                          style: TextStyle(
                                                              fontSize: 11),),
                                                        Text('${snapshot.data!.data[index].shift_date}',
                                                          style: TextStyle(
                                                              fontSize: 11),),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.fromLTRB(
                                                        2.8, 2.8, 2.8, 10),
                                                    child: Wrap(
                                                      children: [
                                                        Image.asset(
                                                          'assets/images/shift_time.png',
                                                          height: 18,
                                                          width: 20,),
                                                        SizedBox(width: 5,),
                                                        Text('Shift Time :',
                                                          style: TextStyle(
                                                              fontSize: 11),),
                                                        Text('${snapshot.data!.data[index].shift_start_time}To ${snapshot.data!.data[index].shift_end_time} ',
                                                          style: TextStyle(
                                                              fontSize: 11),),
                                                      ],
                                                    ),
                                                  ),

                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  /*  Container(

                                            padding:
                                            EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                                            margin:
                                            EdgeInsets.only(left: 3,bottom: 5,right: 5),
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
                                            child: Row(
                                              children: [
                                                Image.asset('assets/images/map.png'),
                                                SizedBox(width: 3,),
                                                Text("110/H",
                                                  style: TextStyle( color: kPrimaryColor),),

                                              ],
                                            ),
                                          ),

                                         */


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
                                        // crossAxisAlignment: WrapCrossAlignment.start,

                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                        children: [
                                          Container(
                                            width: width * 0.67,
                                            child:
                                            Wrap(

                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(3.8),
                                                  child: Text('Client Name :',
                                                    style: TextStyle(color: Colors.black,
                                                        fontSize: 13,
                                                        fontWeight: FontWeight.w600),),
                                                ),

                                                Container(
                                                  padding: EdgeInsets.all(3.8),
                                                  child:  Text('${snapshot.data!.data[index].job_name}',
                                                    style: TextStyle(color: Colors.black,
                                                        fontSize: 13),),
                                                ),
                                              ],

                                            ),
                                          ),

                                          GestureDetector(
                                            onTap: () {
                                              // handleReadOnlyInputClick(context);
                                              Accept();
                                            },
                                            child:
                                            Container(

                                              padding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 10),
                                              margin:
                                              EdgeInsets.only(
                                                  left: 3, bottom: 0, right: 0),

                                              decoration: ShapeDecoration(
                                                color: Colors.green,
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                    width: 1.0,
                                                    style: BorderStyle.solid,
                                                    color: Color(0xfff7efef),),
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(5)),
                                                ),
                                              ),
                                              child: Text("Accept",
                                                style: TextStyle(color: Colors.white),),
                                            ),
                                          )

                                        ],

                                      ),

                                    ],
                                  ),
                                )
                            ));

     */
                      },),
                    ),


                  );
            }
            else{
                if(snapshot.hasError)
                {
                  return Center(child: SizedBox(
                    child: Text("NO Data Found" ,style: TextStyle(color: Colors.red),),),) ;}
                else{

                  return Center (child:SizedBox( child: Text("loading"),));
                }
            }
    })
               ),





              ],
            ),
          ),
        ),
      ),
    );
  }
  Future <void> refresh()
  async {
    setState(() {

    });
  }
  Future <void> Accept(String jobid) async {
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
    print('Response status: ${jobid}---${id}');
    int i=1;
    if(i==1){
      respone = await http.post(Uri.parse ('https://technolite.in/staging/777healthcare/api/accept_open_jobs')
        ,
        headers: <String, String>{'authorization': basicAuth,
          'Content-Type':"application/x-www-form-urlencoded",},
        body: ({

          'job_id': jobid ,
          'employee_id':id,
          //  'fcm_id':'dfgdfgdfg',
          //  'device_id':'fhfghfghh',


        })
        ,
      );


      if(respone.statusCode == 200){
        //print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');
      //  Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen()));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));

      }else{
        print('Response status: ${respone.statusCode}');
       // print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');

        res= jsonDecode(respone.body);
        print('Response status: ${res["message"]}');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));
      }

    }

    else{
      // res= jsonDecode(respone.body);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));
    }


  }
  Future <siftModel> jobsiftopen() async {
  //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('loading.!!')));

    String username = 'adiyogi';
    String password = 'adi12345';
    var respone;
    var res;
   // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('loading2.!!')));

    SharedPreferences preferences = await SharedPreferences.getInstance();
      String? userid = preferences.getString("userid");
      String id= userid.toString();
  //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('loading1.!!')));

    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    print(basicAuth);
    String url = 'https://technolite.in/staging/777healthcare/api/job_list';
  //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('loading2.!!')));

    //Map<String, String> queryParameter = {
    //   routeKey: routeGetCount,
    //  };

    // String queryString = Uri(queryParameters: queryParameter).query;
    var requestUrl = url + '/'+"10"+'/'+"0";
    print('Response status3a:${requestUrl}');

    int i=0;
    if(i==0){
      respone  =  await http.post(Uri.parse(requestUrl),
        headers: <String, String>{'authorization': basicAuth,
          'Content-Type':"application/x-www-form-urlencoded",},
        body: ({
          'job_status':"0",
          'job_type': "2" ,
          'employee_id':id,




        }),);

      var jasonDataOffer = jsonDecode(respone.body);
      if(respone.statusCode == 200){
       // print('Response status1: ---${jasonDataOffer["data"][3]["employee_id"]}');


        /* job_name=jasonDataOffer["data"]["job_name"];
        client_name=jasonDataOffer["data"]["client_name"];
        shift_date=jasonDataOffer["data"]["shift_date"];
        shift_start_time=jasonDataOffer["data"]["shift_start_time"];
        shift_end_time=jasonDataOffer["data"]["shift_end_time"];
        address=jasonDataOffer["data"]["address"];
        */
       int i=0;
        for( i=0;i<jasonDataOffer["data"].length;)
        {
       if(jasonDataOffer["data"][i]["employee_id"]==null)
       { acolors.insert(i, kPrimaryColor);}
       else
       {
         acolors.insert(i, Colors.grey);
       countera==1;

       }



          i++;

        }


        return siftModel.fromJson(jasonDataOffer);




        //  print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');
        // Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen()));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password Changed  Successfully.!!')));

      }else{
        print('Response status:11 ${respone.statusCode}');
        //  print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');

        // res= jsonDecode(respone.body);
        var jasonDataOffer = jsonDecode(respone.body);
        return jasonDataOffer;
        print('Response status: ${res["message"]}');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));
      }

    }

    else{
      print('Response status: ${respone.statusCode}');
      // res= jsonDecode(respone.body);
      var jasonDataOffer = jsonDecode(respone.body);
      return jasonDataOffer;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));
    }


  }



}
