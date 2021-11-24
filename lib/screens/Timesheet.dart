import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:helath_care/Api/Models/shiftDetailModel.dart';
import 'package:helath_care/Constant/Colors.dart';
import 'package:helath_care/screens/bottomBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
DateTime _dateTime = DateTime.now();
 TextEditingController textController = TextEditingController();
int time1=0;
String valuebr="";
ValueNotifier<String> Breakhr = ValueNotifier<String>("");
//ValueNotifier<int> min = ValueNotifier<int>(0);
class timesheetScreen extends StatefulWidget {
 // const timesheetScreen({Key? key}) : super(key: key);
  String jobid="";


  timesheetScreen({required this.jobid});



  @override
  _timesheetScreenState createState() => _timesheetScreenState();
}

class _timesheetScreenState extends State<timesheetScreen> {
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

  String start="";
  String end="";
  String check_in="";
  String check_out="";
  @override
  void initState() {
    // TODO: implement initState
    jobid1=widget.jobid==null?"":widget.jobid;
   // jobDetail();
    super.initState();
    setState(() {

    });






  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,

        title: Text('Timesheet',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        automaticallyImplyLeading: true,
          leading: Container(

            child: GestureDetector(
              onTap: (){
                Navigator.of(context).pop();

              },
              child: Icon(Icons.arrow_back_ios_rounded,color: Colors.white,),

            ),
          ),

      ),
      body:SingleChildScrollView (

          child: FutureBuilder<String>(
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
    child: Text("\$${job_price}/H", style: TextStyle( color: kPrimaryColor),),
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

    Container(
    padding: EdgeInsets.all(2.8),
    child: Wrap(
    children: [
    Image.asset('assets/images/location.png',
    height: 20,
    width: 20,),
    SizedBox(width: 5,),
    Text(address,
    style: TextStyle(fontSize: 11),),
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
    Text('${shift_start_time}AM To ${shift_end_time}PM', style: TextStyle(fontSize: 11),),
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
    color: Colors.grey,),
    borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
    ),
    child: Text("Start Shift",
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
    child: Text("End  Shift", style: TextStyle( color: Colors.white),),
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
    mainAxisAlignment: MainAxisAlignment.spaceBetween,

    children: [
    Row(
    children: [
    Container(
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
    ],
    ),

    Container(
    padding:EdgeInsets.all(8.8),
    child: Text(job_status,
    style: TextStyle(color: Colors.red, fontSize: 16,fontWeight: FontWeight.w600),),
    ),
    ],
    ),
    ),
    ],
    ),
    ),
    ),

    Card(
    elevation: 5,
    margin: EdgeInsets.all(5),
    child: Column(
    children: [
    Row(
    children: [
    Container(
    margin: EdgeInsets.all(5),
    child: Image.asset('assets/images/checkin.png',
    width: width/8,
    height: width/10,
    ),
    ),
    Container(
    margin: EdgeInsets.all(5),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text('Check In Time',
    style: TextStyle(color: kPrimaryColor, fontSize: 16,fontWeight: FontWeight.w600),),
    SizedBox(width: 15,),
    Text('${check_in}AM',
    style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.w400),),
    ],
    ),
    ),
    ],
    ),

    Row(
    children: [
    Container(
    margin: EdgeInsets.all(5),
    child: Image.asset('assets/images/check_out.png',
    width: width/8,
    height: width/10,
    ),
    ),
    Container(
    margin: EdgeInsets.all(5),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text('Check Out Time',
    style: TextStyle(color: kPrimaryColor, fontSize: 16,fontWeight: FontWeight.w600),),
    SizedBox(width: 15,),
    Text('${check_out} AM',
    style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.w400),),
    ],
    ),
    ),
    ],
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Row(
    children: [
    Container(
    margin: EdgeInsets.all(5),
    child: Image.asset('assets/images/break_hr.png',
    width: width/8,
    height: width/10,
    ),
    ),
    Container(
    margin: EdgeInsets.all(5),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text('Break Hr',
    style: TextStyle(color: kPrimaryColor, fontSize: 16,fontWeight: FontWeight.w600),),
    SizedBox(width: 15,),
    ValueListenableBuilder(
    builder: (ctx, value, child) {
    return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
    Text(
    '$value min',
    style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.w400),
    ),

    ],
    );
    },
    valueListenable: Breakhr,
    child: Text('${time1} min',
    style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.w400),),

    ),
    ],
    ),
    ),
    ],
    ),

    GestureDetector(
    onTap: (){
    showDialog(
    context: context,
    builder: (_) =>
    CustomEventDialog(title: "titls", content: "content"));
    },
    child: Container(
    padding:
    EdgeInsets.symmetric(horizontal: 7, vertical: 12),
    margin:
    EdgeInsets.all(5),
    height: 50,
    decoration: ShapeDecoration(
    color: Colors.white,
    shape: RoundedRectangleBorder(
    side: BorderSide(
    width: 1.0,
    style: BorderStyle.solid,
    color: Colors.grey),
    borderRadius: BorderRadius.all(Radius.circular(1)),
    ),
    ),
    child: Text("Select Time", style: TextStyle( color: Colors.grey, fontWeight: FontWeight.w600),),
    ),
    ),


    ],
    ),
    SizedBox(height: 5,),
    Container(
    margin: EdgeInsets.symmetric(vertical: 20),
    width: size.width * 0.89,
    child: ClipRRect(
    borderRadius: BorderRadius.circular(5),
    // ignore: deprecated_member_use
    child: FlatButton(
    padding: EdgeInsets.symmetric(
    vertical: 20, horizontal: 20),
    color: kPrimaryColor,
    onPressed: () {


    Breakhrset();


    },
    child: Text(
    "Save",
    style:
    TextStyle(color: Colors.white, fontSize: 15),
    ),
    ),
    ),
    ),


    ],

    ),
    )
    ],
    );
    }
    else{return SizedBox();}
    })
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
      print('Response status:  ${requestUrl}');
      //var jasonDataOffer = jsonDecode(respone.body);

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
        job_id=jasonDataOffer["data"]["job_id"];

        if(job_status=="0")
        {
          job_status="pending";
        }
        if(job_status == "1")
        {
          job_status="process";
        }
        if(job_status == "2"){ job_status="complete";}
        if(check_in=="0")
        {
          start="0";
        }
        if(check_out=="0"){end="0";}






        jasonDataOffer = jsonDecode(respone.body);
     //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${jasonDataOffer["message"]}')));
        //return availModel.fromJson(jasonDataOffer);

        return ("success");
        //  print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');
        // Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen()));
        //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password Changed  Successfully.!!')));

      }else{
        print('Response status: ${respone.statusCode}');
        //  print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');

        // res= jsonDecode(respone.body);
        var jasonDataOffer = jsonDecode(respone.body);
      //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${jasonDataOffer["message"]}')));
        //return jasonDataOffer;
      //  print('Response status: ${res["message"]}');
      //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));
        return ("fail");
      }

    }

    else{
      print('Response status1: ${respone.statusCode}');
      // res= jsonDecode(respone.body);
      var jasonDataOffer = jsonDecode(respone.body);
      //return jasonDataOffer;
    //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));
      return ("fail");
    }


  }



  void Breakhrset() async {
    String username = 'adiyogi';
    String password = 'adi12345';
    String valuebr1=valuebr+":00";
    var respone;
    var res;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userid = preferences.getString("userid");
    String id= userid.toString();
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    print(basicAuth);

    String url = 'https://technolite.in/staging/777healthcare/api/job_break_time';
    print('${url}------ ${jobid1}---${id}--${valuebr}');
    //Map<String, String> queryParameter = {
    //   routeKey: routeGetCount,
    //  };

    // String queryString = Uri(queryParameters: queryParameter).query;
    var requestUrl = url ;
    int i=0;
    if(i==0){
      respone  =  await http.post(Uri.parse(url),
        headers: <String, String>{'authorization': basicAuth,
          },
        body: ({
          'job_id':jobid1,

          'employee_id':id,

          'break_time':valuebr1


        }),);

      print('Response status3a11:${requestUrl}');
      var res = jsonDecode(respone.body);
      if(respone.statusCode == 200){
        //  print('Response status3: ${jasonDataOffer["data"]["job_name"]}');
        print('Response status3a:${requestUrl}');
        print('Response status: ${respone.body}');
        /* job_name=jasonDataOffer["data"]["job_name"];
        client_name=jasonDataOffer["data"]["client_name"];
        shift_date=jasonDataOffer["data"]["shift_date"];
        shift_start_time=jasonDataOffer["data"]["shift_start_time"];
        shift_end_time=jasonDataOffer["data"]["shift_end_time"];
        address=jasonDataOffer["data"]["address"];

        */

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return bottomBar(bottom: 11, jobid: jobid1);
            },
          ),
        );

        //  return siftDetailModel.fromJson(jasonDataOffer);




        //  print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');
        // Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen()));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));

      }else{
        print('Response statusp: ${respone.statusCode}');
        //  print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');

        // res= jsonDecode(respone.body);
        var jasonDataOffer = jsonDecode(respone.body);
       // return jasonDataOffer;
        print('Response status: ${res["message"]}');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));
      }

    }

    else{
      print('Response statusp1: ${respone.statusCode}');
      // res= jsonDecode(respone.body);
      var jasonDataOffer = jsonDecode(respone.body);
    //  return jasonDataOffer;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));
    }


  }



}
class CustomEventDialog extends StatefulWidget {
  final title;
  final  content;
  CustomEventDialog({this.title, this.content});

  @override
  CustomEventDialogState createState() => new CustomEventDialogState();
}

class CustomEventDialogState extends State<CustomEventDialog> {
 // DateTime _dateTime = DateTime.now();
  var _selectedlanguage = 'hindi';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: size.width*0.55,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          color: Colors.white,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Wrap(
            children: <Widget>[

              Center(
                child: Container(
                  height: size.height*.45,
                  width: size.width*.6,

                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TimePickerSpinner(
                        is24HourMode: true,
                        normalTextStyle: TextStyle(
                            fontSize: 24,
                            color: Colors.black
                        ),
                        highlightedTextStyle: TextStyle(
                            fontSize: 24,
                            color: kPrimaryColor,
                        ),

                        itemHeight: 80,
                        isForce2Digits: true,
                        onTimeChange: (time) {
                          setState(() {
                            _dateTime = time;
                          });
                        },
                      ),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 5),

                              height: 40,
                              width: size.width*.25,
                              //alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(5)
                                ),
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                              ),
                              child: Center(
                                child: Text("Cancel",
                                  style: TextStyle(color:kPrimaryColor,fontSize: 15),),
                              ),

                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: (){
                              _incrementCounter();

                              Navigator.of(context).pop();
                            },
                            child:
                          Container(
                            margin: EdgeInsets.only(top: 5),

                            height: 40,
                            width: size.width*.25,
                            //alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5)
                              ),
                              border: Border.all(
                                color: kPrimaryColor,
                              ),
                            ),
                            child: Center(
                              child: Text("Save",
                                style: TextStyle(color:Colors.white,fontSize: 15),),
                            ),

                          ),
                          )
                        ],
                      ),







                      //Text(_selectedGender == 'male' ? 'Hello gentlement!' : 'Hi lady!')
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _incrementCounter() async {
    setState(() {
      Breakhr.value=_dateTime.hour.toString()+":"+_dateTime.minute.toString();
       valuebr=Breakhr.value;
      textController=TextEditingController(text: time1.toString());
      print('${_dateTime} hi............................................');

    });
  }

}
