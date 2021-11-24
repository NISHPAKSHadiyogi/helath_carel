

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
class WorkShiftscreen extends StatefulWidget {
  const WorkShiftscreen({Key? key}) : super(key: key);

  @override
  _WorkShiftscreenState createState() => _WorkShiftscreenState();
}

class _WorkShiftscreenState extends State<WorkShiftscreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  String job_name="";
  String client_name="";
  String shift_date="";
  String shift_start_time="";
  String shift_end_time="";
  String address="";
  String limit = '10';
  String offset = '0';
  late String id;
  Future<void> _selectDate(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userid = preferences.getString("userid");
    id= userid.toString();


  }

  @override
  void initState() {
    super.initState();
    _selectDate(context);
  }


  int current_index = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return

         Scaffold(

          appBar: AppBar(

            title: Text(
              "Work Sheet",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            backgroundColor: kPrimaryColor,

            centerTitle: true,
          ),
          body:processScreen(),
          /*
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                color: Colors.white,
                child:
                TabBar(


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
                    Tab(text: "(10) Pending",),
                    Tab(text: "(10) Process",
                    ),
                    Tab(text: "(10) Complete",),

                  ],
                  //isScrollable = true,


                  //indicatorColor: Colors.deepOrange,
                  // indicatorWeight: 5,

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
                                          // controller: fromdateController,



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

           */
          );

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
                                          //  print("ghdg");
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => bottomBar( bottom: 9,jobid:snapshot.data!.data[index].id,)));
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
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      mainAxisSize: MainAxisSize.max,
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
                            return

                              Expanded(
                                child: ListView.builder(itemCount:  snapshot.data!.data.length, itemBuilder: (context, index) {
                                  return
                                    GestureDetector(

                                      onTap: (){
                                    //  print("ghdg");
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => bottomBar( bottom: 12,jobid:snapshot.data!.data[index].id,)));
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
                                                    child: Text('Complete ',
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
                            return

                              Expanded(
                                child: ListView.builder(itemCount: 10, itemBuilder: (context, index) {
                                  return Card(
                                    elevation: 5,
                                    margin: EdgeInsets.all(7),
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
                                                width: size.width * 0.6,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.all(2.8),
                                                      child: Text(
                                                        '${snapshot.data!
                                                            .data[index].job_name} ',
                                                        style: TextStyle(
                                                            color: kPrimaryColor, fontSize: 16),),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.all(2.8),
                                                      child: Row(
                                                        children: [
                                                          Image.asset('assets/images/location.png',
                                                            height: 20,
                                                            width: 20,),
                                                          SizedBox(width: 5,),
                                                          Text(
                                                            '${snapshot.data!
                                                                .data[index].address} ',
                                                            style: TextStyle(fontSize: 12),),
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
                                                            style: TextStyle(fontSize: 12),),
                                                          Text(
                                                            '${snapshot.data!
                                                                .data[index].shift_date} ',
                                                            style: TextStyle(fontSize: 12),),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.all(2.8),
                                                      child: Wrap(
                                                        children: [
                                                          Image.asset('assets/images/shift_time.png', height: 18, width: 20,),
                                                          SizedBox(width: 5,),

                                                          Text('Shift Time :', style: TextStyle(fontSize: 12),),
                                                          Text('${snapshot.data!.data[index].shift_start_time} AM To ${snapshot.data!.data[index].shift_end_time} PM', style: TextStyle(fontSize: 12),),
                                                        ],
                                                      ),
                                                    ),

                                                  ],
                                                ),
                                              ),
                                              Container(
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Container(

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
                                                    Container(

                                                      padding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 7, vertical: 5),
                                                      margin:
                                                      EdgeInsets.only(left: 3, bottom: 5),


                                                      child: Text("110/H",
                                                        style: TextStyle(color: kPrimaryColor,
                                                            fontWeight: FontWeight.bold),),
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
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(2.8),
                                                  child: Text('Client Name :',
                                                    style: TextStyle(color: Colors.black,
                                                        fontSize: 16, fontWeight: FontWeight.w600),),
                                                ),

                                                Container(
                                                  padding: EdgeInsets.all(2.8),
                                                  child: Text(
                                                    '${snapshot.data!
                                                        .data[index].client_name} ',
                                                    style: TextStyle(
                                                        color: Colors.black, fontSize: 16),),
                                                ),
                                              ],
                                            ),

                                            Container(
                                              padding: EdgeInsets.all(2.8),
                                              child: Text('Complete',
                                                style: TextStyle(color: Colors.green,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600),),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
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
          'job_status':"3",
          //'job_type': "1" ,
          'employee_id':id1,



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
    var requestUrl = url + '/'+offset+'/'+limit;
    int i=0;
    if(i==0){
      respone  =  await http.post(Uri.parse(requestUrl),
        headers: <String, String>{'authorization': basicAuth,
          'Content-Type':"application/x-www-form-urlencoded",},
        body: ({
          'job_status':"2",
          'job_type': "1" ,
          'employee_id':id,



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



}
