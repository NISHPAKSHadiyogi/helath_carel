
import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:helath_care/Api/Models/availModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:helath_care/Constant/Colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Avialabilityscreen extends StatefulWidget {
  const Avialabilityscreen({Key? key}) : super(key: key);

  @override
  _AvialabilityscreenState createState() => _AvialabilityscreenState();
}

class _AvialabilityscreenState extends State<Avialabilityscreen> {
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
  @override
  void initState() {
    super.initState();
   // employees = getEmployeeData();
   // employeeDataSource = EmployeeDataSource(employees: employees);
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
        appBar: AppBar(

          title: Text("My Availability", style: TextStyle(fontSize: 20, color:Colors.white),),
          backgroundColor: kPrimaryColor,
          centerTitle: true,
          automaticallyImplyLeading: true,

        ),
        body: SingleChildScrollView(
          child: Container(
            height: size.height*0.85,
            child: Column(
              children:[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),

                      alignment: Alignment.topRight,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        // ignore: deprecated_member_use
                        child: FlatButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          color: kPrimaryColor,
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (_) =>
                                    CustomEventDialog(title: "titls", content: "content"));

                          },
                          child: Text(
                            "Add Availability ",

                            style:
                            TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        Container(
        child: FutureBuilder<availModel>(
        future: AvailDetail(),
    builder: (BuildContext context,
    AsyncSnapshot<availModel> snapshot) {
      print("objectPrint" +
          snapshot.error
              .toString());
      if (snapshot.hasData) {
        print("objectPrint" +
            snapshot.data!.data
                .toString());
        return
          Expanded(
            child: ListView.builder(
              itemCount: snapshot.data!.data.length,
              itemBuilder: (context, index) {
                return Card(

                  elevation: 8.0,
                  margin: EdgeInsets.all(8.0),

                  child: Container(
                    padding: EdgeInsets.only(right: 5),

                    color: kPrimaryColor,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Wrap(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Image.asset(
                                  'assets/images/shift_date.png', height: 20,
                                  width: 20,),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  " Availability Date :",
                                  style: TextStyle(fontSize: 10,
                                      color: Colors.grey.shade700),

                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  '${snapshot.data!.data[index].date}',
                                  style: TextStyle(fontSize: 10,
                                      color: Colors.grey.shade700),

                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                          Wrap(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Image.asset(
                                  'assets/images/shift_time.png', height: 20,
                                  width: 20,),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  " Availability Time :",
                                  style: TextStyle(fontSize: 10,
                                      color: Colors.grey.shade700),

                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  '${snapshot.data!.data[index].start_time} to ${snapshot.data!.data[index].end_time}',
                                  style: TextStyle(fontSize: 10,
                                      color: Colors.grey.shade700),

                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
      }
      else{return SizedBox();}
    }
    )
    )


              ],
            ),
          ),

        )
    );
  }
    Future<availModel> AvailDetail() async {
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
    String url = 'https://technolite.in/staging/777healthcare/api/get_availability';
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
/*
        print('Response status:  ${jasonDataOffer["data"]["username"]}');
        username1=jasonDataOffer["data"]["username"];
        unique_id=jasonDataOffer["data"]["unique_id"];
        image=jasonDataOffer["data"]["image"];
        email=jasonDataOffer["data"]["email"];
        mobile_no=jasonDataOffer["data"]["mobile_no"];

 */
      var jasonDataOffer = jsonDecode(respone.body);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${jasonDataOffer["message"]}')));
    return availModel.fromJson(jasonDataOffer);


    //  print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');
    // Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen()));
    //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password Changed  Successfully.!!')));

    }else{
    print('Response status: ${respone.statusCode}');
    //  print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');

    // res= jsonDecode(respone.body);
    var jasonDataOffer = jsonDecode(respone.body);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${jasonDataOffer["message"]}')));
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

class CustomEventDialog extends StatefulWidget {
  final title;
  final  content;
  CustomEventDialog({this.title, this.content});

  @override
  CustomEventDialogState createState() => new CustomEventDialogState();
}

class CustomEventDialogState extends State<CustomEventDialog> {

  static TextEditingController datecontroller = TextEditingController();
  static TextEditingController timefromController = TextEditingController();
  static TextEditingController timetocontroller = TextEditingController();
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;

        datecontroller.text=selectedDate.toString();

      });
  }
  @override
  void initState() {
    super.initState();
    // employees = getEmployeeData();
    // employeeDataSource = EmployeeDataSource(employees: employees);
  }
  DateTime _dateTime = DateTime.now();

  var _selectedlanguage = 'hindi';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: size.width*.85,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          color: Colors.white,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Wrap(
            children: <Widget>[

              Container(
                height: size.height*.45,
                width: size.width*.85,


                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      width: double.infinity,
                      color: kPrimaryColor,
                      alignment: Alignment.center,
                      child: Text("Add Availability",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 15,),

                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),

                      child: Text('Select Date',
                        style: TextStyle(color: Colors.grey),),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      height: 50,
                      width: size.width*0.99,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: datecontroller,



                        //maxLength: 10,
                        cursorColor: Colors.blue,
                        //validator: validateUsername,
                        decoration: InputDecoration(
                          labelStyle:
                          TextStyle(color: Colors.black),
                          suffixIcon: GestureDetector(
                            onTap: () {
                            //  _selectDate(context);

                            },
                            child: Container(
                              padding: EdgeInsets.all(9),
                              // color: Colors.cyan,
                              // constraints: BoxConstraints(
                              //   maxHeight: 10.0,
                              //   maxWidth: 10.0,
                              // ),
                              child: Image(
                                image: AssetImage(
                                  'assets/images/shift_date.png',
                                ),
                                height: 4,
                                width: 4,
                              ),
                            ),
                          ),

                          counterStyle: TextStyle(
                            height: double.minPositive,
                          ),
                          counterText: "",
                          // icon: Icon(
                          //   Icons.phone,
                          //   color: kSecondaryLightColor,
                          // ),
                          // labelText:" All_Lan().phoneno",
                          border: OutlineInputBorder(
                            /* borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(width: 1, color: kSecondaryLightColor),*/
                          ),
                          /*focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1, color: kSecondaryLightColor),
                                    borderRadius: BorderRadius.circular(5),
                                  )*/),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Text('Select Time',
                        style: TextStyle(color: Colors.grey),),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          height: 50,
                          width: size.width*0.32,
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                             controller: timefromController,



                            //maxLength: 10,
                            cursorColor: Colors.blue,
                            //validator: validateUsername,
                            decoration: InputDecoration(
                              labelStyle:
                              TextStyle(color: Colors.black),
                              suffixIcon: GestureDetector(
                                onTap: () {

                                },
                                child: Container(
                                  padding: EdgeInsets.all(9),
                                  // color: Colors.cyan,
                                  // constraints: BoxConstraints(
                                  //   maxHeight: 10.0,
                                  //   maxWidth: 10.0,
                                  // ),
                                  child: Image(
                                    image: AssetImage(
                                      'assets/images/shift_time.png',
                                    ),
                                    height: 4,
                                    width: 4,
                                  ),
                                ),
                              ),

                              counterStyle: TextStyle(
                                height: double.minPositive,
                              ),
                              counterText: "",
                              // icon: Icon(
                              //   Icons.phone,
                              //   color: kSecondaryLightColor,
                              // ),
                              // labelText:" All_Lan().phoneno",
                              border: OutlineInputBorder(
                                /* borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(width: 1, color: kSecondaryLightColor),*/
                              ),
                              /*focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1, color: kSecondaryLightColor),
                                        borderRadius: BorderRadius.circular(5),
                                      )*/),
                          ),
                        ),
                        Container(
                           margin: EdgeInsets.only(left: 10, right: 10),
                          height: 50,
                          width: size.width*0.32,
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                             controller: timetocontroller,



                            //maxLength: 10,
                            cursorColor: Colors.blue,
                            //validator: validateUsername,
                            decoration: InputDecoration(
                              labelStyle:
                              TextStyle(color: Colors.black),
                              suffixIcon: GestureDetector(
                                onTap: () {


                                },
                                child: Container(
                                  padding: EdgeInsets.all(9),
                                  // color: Colors.cyan,
                                  // constraints: BoxConstraints(
                                  //   maxHeight: 10.0,
                                  //   maxWidth: 10.0,
                                  // ),
                                  child: Image(
                                    image: AssetImage(
                                      'assets/images/shift_time.png',
                                    ),
                                    height: 4,
                                    width: 4,
                                  ),
                                ),
                              ),

                              counterStyle: TextStyle(
                                height: double.minPositive,
                              ),
                              counterText: "",
                              // icon: Icon(
                              //   Icons.phone,
                              //   color: kSecondaryLightColor,
                              // ),
                              // labelText:" All_Lan().phoneno",
                              border: OutlineInputBorder(
                                /* borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(width: 1, color: kSecondaryLightColor),*/
                              ),
                              /*focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1, color: kSecondaryLightColor),
                                        borderRadius: BorderRadius.circular(5),
                                      )*/),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25,),


                    GestureDetector(
                      onTap: (){
           setState(() {
             addAvail();
           });


                        Navigator.of(context).pop();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            padding: EdgeInsets.all(15),
                            width: size.width*.55,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(1)
                              ),
                              border: Border.all(
                                color: kPrimaryColor,
                              ),
                            ),
                            child: Center(
                              child: Text("Submit",
                                style: TextStyle(color:Colors.white,fontSize: 15),),
                            ),

                          ),
                        ],
                      ),
                    ),







                    //Text(_selectedGender == 'male' ? 'Hello gentlement!' : 'Hi lady!')
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future <void> addAvail() async {
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
      respone = await http.post(Uri.parse ('https://technolite.in/staging/777healthcare/api/add_availability')
        ,
        headers: <String, String>{'authorization': basicAuth,
          'Content-Type':"application/x-www-form-urlencoded",},
        body: ({

          'employee_id': id,
          'date':datecontroller.text,
          'start_time':timefromController.text,
          'end_time':timetocontroller.text
          //  'fcm_id':'dfgdfgdfg',
          //  'device_id':'fhfghfghh',


        })
        ,
      );
      var jasonDataOffer = jsonDecode(respone.body);

      if(respone.statusCode == 200){
        //print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');
        //  Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen()));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${jasonDataOffer["message"]}')));
       // return siftModel.fromJson(jasonDataOffer);

      }else{
        print('Response status: ${respone.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${jasonDataOffer["message"]}')));

        // print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');
      //  return siftModel.fromJson(jasonDataOffer);
        res= jsonDecode(respone.body);
        print('Response status: ${res["message"]}');

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));
      }

    }

    else{
      var jasonDataOffer = jsonDecode(respone.body);
      //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${respone.body}')));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${jasonDataOffer["message"]}')));

    //  return siftModel.fromJson(jasonDataOffer);


    }


  }



}

