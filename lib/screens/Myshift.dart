

import 'dart:convert';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helath_care/Api/Models/siftModel.dart';
import 'package:helath_care/Constant/Colors.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'Shiftdetails.dart';
import 'bottomBar.dart';
class Shiftscreen extends StatefulWidget {
  const Shiftscreen({Key? key}) : super(key: key);

  @override
  _ShiftscreenState createState() => _ShiftscreenState();
}

class _ShiftscreenState extends State<Shiftscreen> {


  static TextEditingController fromdateController = TextEditingController();
  static TextEditingController fromtimeController = TextEditingController();
  static TextEditingController totimeController = TextEditingController();

  String start="";
  String end="";
  String check_in="";
  String check_out="";
  Color sscolor =kPrimaryColor;
  String break_time="";
  String client_review="";

  String client_rate="";
  String client_signature="";
  String sdate ="";
      String ftime="";
  String ttime="";

  var scaffoldKey = GlobalKey<ScaffoldState>();
  String job_name="";
  String client_name="";
  String shift_date="";
  String shift_start_time="";
  String shift_end_time="";
  String address="";
  String limit = '10';
  String offset = '0';
  String job_description="";
  String job_long="";
  String job_lat="";
  String job_status="";
  String jobid1="";
  String job_price="";
  String job_id="";
  String pending="0";
  String process="0";
  String complete="0";

  late String id;
  Future<void> _selectDate(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userid = preferences.getString("userid");
    id= userid.toString();


  }

  @override
  void initState() {
   // jobid1=widget.jobid==null?"":widget.jobid;
    jobsiftcomplate();
    jobsiftprocess();
    jobsiftpending();
    super.initState();
    _selectDate(context);
  }


  int current_index = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
        length: 3,

        child: Scaffold(

          appBar: AppBar(

            title: Text(
              "My Shift",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            backgroundColor: kPrimaryColor,

            centerTitle: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: size.width,
            color: Colors.white,
            child:
             Center(
            child:TabBar(


               // backgroundColor: kPrimaryColor,
               // unselectedBackgroundColor: Colors.grey[300],
              //  unselectedLabelStyle: TextStyle(color: Colors.black),
                isScrollable: true,
                labelPadding: EdgeInsets.only(left: 10, right: 10),
                unselectedLabelStyle: TextStyle(color:Colors.blue,fontWeight: FontWeight.bold, fontSize: 13),
                indicatorPadding: EdgeInsets.all(0),
                labelColor: Colors.black,
                labelStyle:
                TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                tabs: [
                  Tab(text: "(${pending}) Pending",),
                  Tab(text: "(${process}) Process",
                  ),
                  Tab(text: "(${complete}) Complete",),

                ],
                  //isScrollable = true,

                  
                  //indicatorColor: Colors.deepOrange,
                 // indicatorWeight: 5,

              ),
        ),
              ),
             /* Row(
                children: [
                  Expanded(
                    flex: 1,
                      child: Center(
                          child: Text('Pending(10)'),
                      ),
                  ),
                  Expanded(
                    flex: 1,
                      child: Center(child: Text('Pending(10)'))),
                  Expanded(
                    flex: 1,
                      child: Center(child: Text('Pending(10)'))),
                ],
              ),*/
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      showModalBottomSheet<void>(

                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: size.height*0.4,
                          child:

                         FittedBox(
                           child:
                               Container(
                                 child:
                              Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                 Container(
                                   padding: EdgeInsets.all(10),
                                   child: Center(
                                       child: Text('Filter',
                                         style: TextStyle(color: kPrimaryColor, fontSize: 20, fontWeight: FontWeight.w700),)),
                                 ),
                                SizedBox(height: 15,),

                                Container(
                                  margin: EdgeInsets.only(left: 10, right: 10),

                                  child: Text('Select Date',
                                    style: TextStyle(color: Colors.grey),),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10, right: 0),
                                  height: 50,
                                  width: size.width,
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    controller: fromdateController,



                                    //maxLength: 10,
                                    cursorColor: Colors.blue,
                                    //validator: validateUsername,
                                    decoration: InputDecoration(
                                      labelStyle:
                                      TextStyle(color: Colors.black),
                                      suffixIcon: GestureDetector(
                                        onTap: () {},
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
                                      width: size.width*0.5,

                                      child: TextFormField(
                                        controller: fromtimeController,

                                        keyboardType: TextInputType.text,
                                        cursorColor: Colors.blue,
                                        //validator: validateUsername,
                                        decoration: InputDecoration(
                                          labelStyle:
                                          TextStyle(color: Colors.black),
                                          suffixIcon: GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              padding: EdgeInsets.all(9),

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
                                      width: size.width*0.45,
                                      child: TextFormField(
                                        controller: totimeController,
                                        keyboardType: TextInputType.text,
                                        cursorColor: Colors.blue,
                                        //validator: validateUsername,
                                        decoration: InputDecoration(
                                          labelStyle:
                                          TextStyle(color: Colors.black),
                                          suffixIcon: GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              padding: EdgeInsets.all(9),

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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        sdate=fromdateController.text;
                                        ftime=fromtimeController.text;
                                        ttime=totimeController.text;
                                      });
                                      Navigator.pop(context);


                                    },
                                child:
                                    Container(
                                      padding:
                                      EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                      margin:
                                      EdgeInsets.only(left: 10,bottom: 5,right: 10),

                                    width: size.width*0.58,

                                      decoration: ShapeDecoration(
                                        color: kPrimaryColor,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 1.0,
                                              style: BorderStyle.solid,
                                              color: kPrimaryColor),
                                          borderRadius: BorderRadius.all(Radius.circular(5)),
                                        ),
                                      ),
                                      child:  Center(child: Text("Apply", style: TextStyle( color: Colors.white),
                                      ),
                                      ),
                                    ),
                                    ),
                            GestureDetector(
                              onTap: () {
                                fromdateController.text="";
                                ftime=fromtimeController.text="";
                                ttime=totimeController.text="";


                              },
                              child:
                                    Container(
                                      padding:
                                      EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                      margin:
                                      EdgeInsets.only(right: 10,bottom: 5),

                                      width: size.width*0.4,

                                      decoration: ShapeDecoration(
                                        color: kPrimaryColor,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 1.0,
                                              style: BorderStyle.solid,
                                              color: kPrimaryColor),
                                          borderRadius: BorderRadius.all(Radius.circular(5)),
                                        ),
                                      ),
                                      child:  Center(child: Text("Reset", style: TextStyle( color: Colors.white),
                                      ),
                                      ),
                                    ),
                            )
                                  ],
                                )
                              ],
                            ),
                               )
                         ),
                          );
                        },
                      );
                    },
                    child: Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                      margin:
                      EdgeInsets.only(left: 10,bottom: 5),

                      width: 100,

                      decoration: ShapeDecoration(
                        color: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 1.0,
                              style: BorderStyle.solid,
                              color: kPrimaryColor),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                      ),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/filter.png",
                            height: 20,
                            width: 20,
                          ),
                          Text("Filter", style: TextStyle( color: Colors.white),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                //  physics: NeverScrollableScrollPhysics(),
                  children: [
                    // first tab bar view widget
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                       // padding: EdgeInsets.all(10),
                        color:  Color(0xffd5c8d5),
                        child: pendingScreen(),
                      ),
                    ),
                    // second tab bar viiew widget
                    GestureDetector(
                      onTap: () {},
                      child: Container(

                        color: Color(0xffd5c8d5),
                        child: processScreen(),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        color:  Color(0xffd5c8d5),
                        child: completeScreen(),
                      ),
                    ),
                  ],
                ),
              )
              // _addRemoveCartButtons(),
            ],
          ),
        ));
  }
  Widget pendingScreen(){
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
     // crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        Container(
        height: 650,
        child: Container(
        child: FutureBuilder<siftModel>(
        future: jobsiftpending(),
    builder: (BuildContext context,
    AsyncSnapshot<siftModel> snapshot) {
      print("objectPrint" +
          snapshot.error
              .toString());
    if (snapshot.hasData) {
      print("objectPrint" +
          snapshot.data!.data
              .toString());


      return


        Expanded(
          child: ListView.builder(itemCount: snapshot.data!.data.length, itemBuilder: (context, index) {

            return
            GestureDetector(

            onTap: (){
            //  print("gh
              jobDetail(snapshot.data!.data[index].id);
            // Shiftscreen();

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
                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     // mainAxisSize: MainAxisSize.max,
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
                                    Text(
                                      '${snapshot.data!
                                          .data[index].address}',
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
                                        .data[index].shift_start_time} AM To ${snapshot.data!
                                            .data[index].shift_end_time} PM',
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

                      Container(
                        padding: EdgeInsets.fromLTRB(2.8,2.8,2.8,10),
                        child: Text('Pending',
                          style: TextStyle(color: Colors.red,
                              fontSize: 13,
                              fontWeight: FontWeight.w600),),
                      ),
                    ],
                  ),
              ),
                ],
              ),
      )
            ));
          },),

        );
    }
    else{return SizedBox();}
        })
    )
    )

      ],
        )
    );



  }
  Widget processScreen(){
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        Container(
        height: 650,
        child: Container(
        child: FutureBuilder<siftModel>(
        future: jobsiftprocess(),
    builder: (BuildContext context,
    AsyncSnapshot<siftModel> snapshot) {
    if (snapshot.hasData) {
      print("objectPrint" +
          snapshot.data!.data[0].id
              .toString());
      process =snapshot.data!.data.length.toString();
      return

        Expanded(
          child: ListView.builder(itemCount:  snapshot.data!.data.length, itemBuilder: (context, index) {
            return
            GestureDetector(

              onTap: (){
                //  print("ghdg");if
                jobDetail(snapshot.data!.data[index].id);
                // Shiftscreen();

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
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // mainAxisSize: MainAxisSize.max,
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
                                          Text(
                                            '${snapshot.data!
                                                .data[index].address}',
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
                                                .data[index].shift_start_time} AM To ${snapshot.data!
                                                .data[index].shift_end_time} PM',
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

                              Container(
                                padding: EdgeInsets.fromLTRB(2.8,2.8,2.8,10),
                                child: Text('Process',
                                  style: TextStyle(color: Colors.red,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
              ));
          },),
        );

    }
    else{return SizedBox();}
    })
    )
    )
      ],
        )
    );
  }

  Widget completeScreen()
  {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        Container(
        height: 650,
        child: Container(
        child: FutureBuilder<siftModel>(
        future: jobsiftcomplate(),
    builder: (BuildContext context,
    AsyncSnapshot<siftModel> snapshot) {
    if (snapshot.hasData) {
    print("objectPrint" +
    snapshot.data!.data
        .toString());
    complete=snapshot.data!.data.length.toString();

    return

    Expanded(
    child: ListView.builder(itemCount: snapshot.data!.data.length, itemBuilder: (context, index) {
    return
      GestureDetector(

        onTap: (){
      //  print("ghdg");
          jobDetail(snapshot.data!.data[index].id);
          // Shiftscreen();

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
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // mainAxisSize: MainAxisSize.max,
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
                                  Text(
                                    '${snapshot.data!
                                        .data[index].address}',
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
                                        .data[index].shift_start_time} AM To ${snapshot.data!
                                        .data[index].shift_end_time} PM',
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

                      Container(
                        padding: EdgeInsets.fromLTRB(2.8,2.8,2.8,10),
                        child: Text('Complete',
                          style: TextStyle(color: Colors.red,
                              fontSize: 13,
                              fontWeight: FontWeight.w600),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
      ));

    },),
    );
    }
      else{ return SizedBox();}

    })
    )
    )
      ],
        )
    );
  }


  Future <siftModel> jobsiftpending() async {
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
    String url = 'https://technolite.in/staging/777healthcare/api/job_list';
    //Map<String, String> queryParameter = {
    //   routeKey: routeGetCount,
    //  };

    // String queryString = Uri(queryParameters: queryParameter).query;
    var requestUrl = url + '/'+limit+'/'+offset;
   int i=0;
     if(i==0){
      respone  =  await http.post(Uri.parse(requestUrl),
        headers: <String, String>{'authorization': basicAuth,
          'Content-Type':"application/x-www-form-urlencoded",},
        body: ({
          'job_status':"0",
          'job_type': "1" ,
          'employee_id':id,
          'shift_start_time':sdate,
          'shift_date':ftime,
          'shift_end_time':ttime,



        }),);

      print('Response status3a:${requestUrl}');
      var jasonDataOffer = jsonDecode(respone.body);
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
        setState(() {
          pending=jasonDataOffer["data"].length.toString();
        });


        return siftModel.fromJson(jasonDataOffer);




        //  print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');
        // Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen()));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password Changed  Successfully.!!')));

      }else{
        print('Response statusp: ${respone.statusCode}');
        //  print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');

        // res= jsonDecode(respone.body);
        var jasonDataOffer = jsonDecode(respone.body);
        return jasonDataOffer;
        print('Response status: ${res["message"]}');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));
      }

    }

    else{
      print('Response statusp1: ${respone.statusCode}');
      // res= jsonDecode(respone.body);
      var jasonDataOffer = jsonDecode(respone.body);
      return jasonDataOffer;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));
    }


  }

  Future <siftModel> jobsiftprocess() async {
    String username = 'adiyogi';
    String password = 'adi12345';
    var respone;
    var res;
     SharedPreferences preferences = await SharedPreferences.getInstance();
      String? userid = preferences.getString("userid");
      String id1= userid.toString();
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    print(basicAuth);
    String url = 'https://technolite.in/staging/777healthcare/api/job_list';
    //Map<String, String> queryParameter = {
    //   routeKey: routeGetCount,
    //  };

    // String queryString = Uri(queryParameters: queryParameter).query;
    var requestUrl = url + '/'+limit+'/'+offset;
    int i=0;
    if(i==0){
      respone  =  await http.post(Uri.parse(requestUrl),
        headers: <String, String>{'authorization': basicAuth,
          'Content-Type':"application/x-www-form-urlencoded",},
        body: ({
          'job_status':"1",
          'job_type': "1" ,
          'employee_id':id1,
          'shift_start_time':sdate,
          'shift_date':ftime,
          'shift_end_time':ttime,



        }),);

      print('Response status3a:${requestUrl}');
      var jasonDataOffer = jsonDecode(respone.body);
      if(respone.statusCode == 200){
        print('Response statusprocc: ${respone.statusCode}');
       /*
        job_name=jasonDataOffer["data"]["job_name"];
        client_name=jasonDataOffer["data"]["client_name"];
        shift_date=jasonDataOffer["data"]["shift_date"];
        shift_start_time=jasonDataOffer["data"]["shift_start_time"];
        shift_end_time=jasonDataOffer["data"]["shift_end_time"];
        address=jasonDataOffer["data"]["address"];
*/
        setState(() {
          process=jasonDataOffer["data"].length.toString();
        });

        return siftModel.fromJson(jasonDataOffer);




        //  print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');
        // Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen()));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password Changed  Successfully.!!')));

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
      print('Response status: ${respone.statusCode}');
      // res= jsonDecode(respone.body);
      var jasonDataOffer = jsonDecode(respone.body);
      return jasonDataOffer;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));
    }


  }

  Future <siftModel> jobsiftcomplate() async {
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
    String url = 'https://technolite.in/staging/777healthcare/api/job_list';
    //Map<String, String> queryParameter = {
    //   routeKey: routeGetCount,
    //  };

    // String queryString = Uri(queryParameters: queryParameter).query;
    var requestUrl = url + '/'+limit+'/'+offset;
    int i=0;
    if(i==0){
      respone  =  await http.post(Uri.parse(requestUrl),
        headers: <String, String>{'authorization': basicAuth,
          'Content-Type':"application/x-www-form-urlencoded",},
        body: ({
          'job_status':"2",
          'job_type': "1" ,
          'employee_id':id,
          'shift_start_time':sdate,
          'shift_date':ftime,
          'shift_end_time':ttime,



        }),);

    //  print('Response status3a:${requestUrl}');
      var jasonDataOffer = jsonDecode(respone.body);
      if(respone.statusCode == 200){
        print('Response status: ${respone.body}');


       /* job_name=jasonDataOffer["data"]["job_name"];
        client_name=jasonDataOffer["data"]["client_name"];
        shift_date=jasonDataOffer["data"]["shift_date"];
        shift_start_time=jasonDataOffer["data"]["shift_start_time"];
        shift_end_time=jasonDataOffer["data"]["shift_end_time"];
        address=jasonDataOffer["data"]["address"];
        */

setState(() {
  complete=jasonDataOffer["data"].length.toString();
});

        return siftModel.fromJson(jasonDataOffer);




        //  print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');
        // Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen()));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password Changed  Successfully.!!')));

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
      print('Response status: ${respone.statusCode}');
      // res= jsonDecode(respone.body);
      var jasonDataOffer = jsonDecode(respone.body);
      return jasonDataOffer;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));
    }


  }


  void jobDetail(String jobid) async {
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
   // var requestUrl = url + '/' + jobid ;
    print('url----${jobid}---${id}');
    int i=1;
    if(i==1){
      respone  =  await http.post(Uri.parse(url),
        headers: <String, String>{'authorization': basicAuth,
          'Content-Type':"application/x-www-form-urlencoded",},
        body: ({
          'job_id':jobid,

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
        job_id=jasonDataOffer["data"]["job_id"];
        break_time=jasonDataOffer["data"]["break_time"];
        client_review=jasonDataOffer["data"]["client_review"];
        client_rate=jasonDataOffer["data"]["client_rate"];
        client_signature=jasonDataOffer["data"]["client_signature"];


        if(job_status=="0")
        {
          job_status="pending";
        }
        if(job_status == "1")
        {
          job_status="process";
        }
        if(job_status == "2"){ job_status="complate";}
        if(check_in==null)
        {
          start="0";
        }
        else
        {
          start="1";
        }
        if(check_out==null){end="0";
        Navigator.push(context, MaterialPageRoute(builder: (context) => bottomBar( bottom: 9,jobid:jobid,)));

        }
        else{
          if(break_time==null||break_time.isEmpty) {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => bottomBar(bottom: 10, jobid: jobid,)));
          }
          else {
            if (client_signature == null) {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => bottomBar(bottom: 11, jobid: jobid,)));
            } else {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => bottomBar(bottom: 11, jobid: jobid,)));

            }
          }
        }







        jasonDataOffer = jsonDecode(respone.body);
       // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${jasonDataOffer["message"]}')));
        //return availModel.fromJson(jasonDataOffer);


        //  print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');
        // Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen()));
        //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password Changed  Successfully.!!')));

      }else{
        print('Response status: ${respone.statusCode}');
        //  print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');

        // res= jsonDecode(respone.body);
        var jasonDataOffer = jsonDecode(respone.body);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${jasonDataOffer["message"]}')));
        //return jasonDataOffer;
        print('Response status: ${res["message"]}');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));
      }

    }

    else{
      print('Response status1: ${respone.statusCode}');
      // res= jsonDecode(respone.body);
      var jasonDataOffer = jsonDecode(respone.body);
      //return jasonDataOffer;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));
    }


  }



}
