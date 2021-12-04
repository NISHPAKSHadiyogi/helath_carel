

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helath_care/Constant/Colors.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:helath_care/Api/Models/siftModel.dart';

class mytimesheetScreen extends StatefulWidget {

  const mytimesheetScreen({Key? key}) : super(key: key);

  @override
  _mytimesheetScreenState createState() => _mytimesheetScreenState();
}

class _mytimesheetScreenState extends State<mytimesheetScreen> {
  DateTime selectedDate = DateTime.now();
  final DateTime initialDate  =DateTime.now();
  late String year="";
  late String month="";
  late String hour1="0";
  late String min1="0";
  late String sec1="0";

  @override
  void initState() {
    super.initState();
    selectedDate = initialDate;
    year=selectedDate.year.toString();
    if(selectedDate.month<10) {
      month = "0"+selectedDate.month.toString();
    }else{
      month = selectedDate.month.toString();
    }
   // month=selectedDate.month.toString();
    //Accept1();

  }
  Future<void> _selectDate(BuildContext context) async {

    showMonthPicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 1, 5),
      lastDate: DateTime(DateTime.now().year + 1, 9),
      initialDate: selectedDate ,
      locale: Locale("en"),
    ).then((date) {
      if (date != null) {

        setState(() {

          selectedDate = date;
          year=selectedDate.year.toString();
          if(selectedDate.month<10) {
            month = "0"+selectedDate.month.toString();
          }else{
            month = selectedDate.month.toString();
          }


        });
      }
    });


/*
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });

 */
  }
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          centerTitle: true,
          title: Container(
            child: Text(
              'My Timesheet',
            ),
          ),
          automaticallyImplyLeading: false,
          leading: new IconButton(
            icon: new Icon(
              Icons.arrow_back,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body:FutureBuilder<siftModel>(
        future: Accept1(),
    builder: (BuildContext context,
    AsyncSnapshot<siftModel> snapshot) {
    print("objectPrint" +
    snapshot.error
        .toString());
    if (snapshot.hasData ) {
    print("objectPrint---" +
    snapshot.data!.data.length
        .toString());
    int h=0;
    int min=0;
    int sec=0;

    for(int i=0;i<snapshot.data!.data.length;i++){
    if(snapshot.data!.data[i].total_work_time!=null ||snapshot.data!.data[i].total_work_time==0) {
   // List<String>hours = snapshot.data!.data[i].total_work_time.toString().split(":");
       int minI = snapshot.data!.data[i].total_work_time;

      print("objectPrint---" +
        snapshot.data!.data[i].total_work_time.toString() + "####");

     // print("objectPrint333" + snapshot.data!.data[i].total_work_time + "lllll" + snapshot.data!.data.length.toString() + "" + min );

    //  h = int.parse(hours[0]) + h;
     // min = int.parse(hours[1]) + min;
     // sec = int.parse(hours[2]) + sec;
    //  var minI=int.parse(mins);
       var min2;
       var h1=0;
       if(minI>=60) {
         min2= minI / 60;
         h1=min2.toInt();
      }
      else{
        min2=minI;

      }
     // var sec2=sec/60;

      if(minI>=60) {
        min2 = minI % 60;
      }
      else{
        min2=minI;

      }

      min=min2+min;
      h=h1+h;

     // sec=sec%60;



      //sec1=sec.toString();

    }


    }

    hour1=h.toString();
    min1=min.toString();

    return Container(
          height: size.height*0.85,
          child:
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: GestureDetector(
                          onTap: () {
                            // handleReadOnlyInputClick(context);
                            _selectDate(context);


                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '${month}/${year}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              CircleAvatar(
                                backgroundColor: kPrimaryColor,
                                radius: 18.0,
                                child:
                                  Image.asset('assets/images/calender.png', height: 20,)
                              )
                            ],
                          )),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                              color: kblueColor,
                              child: Column(
                                children: [
                                  Container(
                                    decoration: new BoxDecoration(
                                        border: new Border(
                                          //right: new BorderSide(width: 2.0, color: Colors.orange),
                                          //left: new BorderSide(width: 1.0, color: Colors.orange)
                                        )),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Work Hour's : ${hour1}: ${min1}:${sec1}",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    height: 1,
                                    color: Colors.black54,
                                  ),
                                ],
                              ))),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                            color: kPrimaryColor,
                            /*  color: setthemecolor == null
                                ? ksecondaryColor
                                : HexColor(setthemecolor),*/
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Date",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: Container(
                            color: kPrimaryColor,
                            /*  color: setthemecolor == null
                                ? ksecondaryColor
                                : HexColor(setthemecolor),*/
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Start Shift",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: Container(
                            color: kPrimaryColor,
                            /*  color: setthemecolor == null
                                ? ksecondaryColor
                                : HexColor(setthemecolor),*/
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "End Shift",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ),
                          ),
                      ),



                    ],
                  ),
        Container(
      child:

          Expanded(
            child: ListView.builder(
                itemCount: snapshot.data!.data.length, itemBuilder: (context, index) {
              return Container(

                child: Card(
                  elevation: 1,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child:
                          FittedBox(
                              child:
                              Container(
                                color: Color(0xfff1f1f1),
                                /*  color: setthemecolor == null
                                ? ksecondaryColor
                                : HexColor(setthemecolor),*/
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '${snapshot.data!.data[index].shift_date}',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                ),
                              )
                          )),
                      Expanded(
                          flex: 1,

                          child: Container(
                            color: Color(0xfff1f1f1),
                            /*  color: setthemecolor == null
                                ? ksecondaryColor
                                : HexColor(setthemecolor),*/
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${snapshot.data!.data[index].check_in}',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.green),
                              ),
                            ),
                          )),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Color(0xfff1f1f1),
                          /*  color: setthemecolor == null
                                ? ksecondaryColor
                                : HexColor(setthemecolor),*/
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${snapshot.data!.data[index].check_out}',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.red),
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              );
            }),

        )
    )




                ],
              ),
            ),


        );


      }
    else{
      if(snapshot.hasError)
      {
        return Center(
          child: SizedBox(width: size.width*0.5,
            height: size.height*0.5, child: Text("NO Data Found" ,style: TextStyle(color: Colors.red),),),) ;}
      else{

        return Center(child: SizedBox(width: size.width*0.5,
          height: size.height*0.5, child: Text("Loading..."),),) ;
      }
    }

    })

    );
  }
  Future <siftModel> Accept1() async {
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
      respone = await http.post(Uri.parse ('https://technolite.in/staging/777healthcare/api/my_timeline')
        ,
        headers: <String, String>{'authorization': basicAuth,
          'Content-Type':"application/x-www-form-urlencoded",},
        body: ({

          'year': year,
          'employee_id':id,
          'month':month
          //  'fcm_id':'dfgdfgdfg',
          //  'device_id':'fhfghfghh',


        })
        ,
      );
      var jasonDataOffer = jsonDecode(respone.body);

      if(respone.statusCode == 200){
        //print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');
        //  Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen()));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar( behavior: SnackBarBehavior.floating,content: Text('${jasonDataOffer["message"]}'),backgroundColor: Colors.green,));

       // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${jasonDataOffer["message"]}')));
        return siftModel.fromJson(jasonDataOffer);

      }else{
        print('Response status: ${respone.statusCode}');

        ScaffoldMessenger.of(context).showSnackBar(SnackBar( behavior: SnackBarBehavior.floating,content: Text('${jasonDataOffer["message"]}'),backgroundColor: Colors.red,));

        // print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');
        return siftModel.fromJson(jasonDataOffer);
        res= jsonDecode(respone.body);
        print('Response status: ${res["message"]}');

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));
      }

    }

    else{
      var jasonDataOffer = jsonDecode(respone.body);
      //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${respone.body}')));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${jasonDataOffer["message"]}')));

      return siftModel.fromJson(jasonDataOffer);


    }


  }



}
