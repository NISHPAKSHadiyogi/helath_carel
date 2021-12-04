

import 'dart:convert';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:helath_care/Api/Models/siftModel.dart';
import 'package:helath_care/Constant/Colors.dart';
import 'package:http/http.dart' as http;
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Shiftdetails.dart';
import 'bottomBar.dart';
 TextEditingController fromdateController = TextEditingController();
 TextEditingController fromtimeController = TextEditingController();
 TextEditingController totimeController = TextEditingController();
ScrollController _scrollController = new ScrollController();
ScrollController _scrollController1 = new ScrollController();
ScrollController _scrollController2 = new ScrollController();
class Shiftscreen extends StatefulWidget {
  const Shiftscreen({Key? key}) : super(key: key);

  @override
  _ShiftscreenState createState() => _ShiftscreenState();
}

class _ShiftscreenState extends State<Shiftscreen> {



int  counter=1;
int  counter1=1;
int  counter2=1;
int countercl=1;
int counterpel=1;
int counterprocl=1;
//var job_status;
  String end="";
  String check_in="";
  String check_out="";
  Color sscolor =kPrimaryColor;
  String break_time="";
  String client_review="";
  bool loading=false;
  String client_rate="";
  String client_signature="";
  String sdate ="";
      String ftime="";
  String ttime="";
  String start="";
  //String end="";
 // String check_in="";
 // String check_out="";
  var scaffoldKey = GlobalKey<ScaffoldState>();
  String job_name="";
  String client_name="";
  String shift_date="";
  String shift_start_time="";
  String shift_end_time="";
  String address="";
  String limit = '10';
  String offset = '0';
String limit1 = '10';
String offset1 = '0';
String limit2 = '10';
String offset2 = '0';
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
  Color completecolor= Colors.red;
  DateTime selectedDate = DateTime.now();
  final DateTime initialDate  =DateTime.now();
  late String year="";
  late String month="";
  late String hour1="";
  late String min1="";
  late String sec1="";
  late List <String> job_status1= <String>[];

  late String id;
  Future<void> _selectDate(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userid = preferences.getString("userid");
    id= userid.toString();


  }

  Future<void> _selectDate1(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,

        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));

    if (picked != null && picked != selectedDate)

      setState(() {
        print(picked);

        //String Onlydate = new DateFormat("yyyy-MM-dd").format(picked);
        selectedDate = picked;

        var todateselected = selectedDate;
        var toDate;
        var todatesplite=todateselected.toString().split(' ');
        print("fromdateselected "+todatesplite[0].toString());

        if (selectedDate == null){
          toDate=null;
        }else{
          toDate = todatesplite[0];
          fromdateController.text=toDate;
        }
      });
       // print(selectedDate.weekday.toString() +"------");
      //  fromdateController.text=selectedDate.year.toString()+"-"+selectedDate.month.toString()+"-"+selectedDate.day.toString();



  }

  @override
  void initState() {
   // jobid1=widget.jobid==null?"":widget.jobid;
    jobDetail(jobid1);
    jobsiftcomplatelength();

    //jobsiftproccesslength();
    //jobsiftpendinglength();


    super.initState();
    _selectDate(context);
  //  super.initState();
    selectedDate = initialDate;

  }
  Future<bool> onWillPop() async {

    return false;
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
          body: WillPopScope(
            onWillPop: onWillPop,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: size.width,
              color: Colors.white,
              child:

      TabBar(


                 // backgroundColor: kPrimaryColor,
                 // unselectedBackgroundColor: Colors.grey[300],
                //  unselectedLabelStyle: TextStyle(color: Colors.black),
                  isScrollable: false,
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
               /* GestureDetector(
                  onTap: () {
                    setState(() {
                     // getNewOrderList();
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Refersh"),
                      IconButton(
                          icon: Icon(Icons.refresh),
                          onPressed: () {
                            setState(() {
                              //getNewOrderList();
                            });
                          })
                    ],
                  ),
                ),
                */
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
                                      keyboardType: TextInputType.none,
                                      readOnly: true,
                                      controller: fromdateController,




                                      //maxLength: 10,
                                      cursorColor: Colors.blue,
                                      //validator: validateUsername,
                                      decoration: InputDecoration(
                                        labelStyle:
                                        TextStyle(color: Colors.black),
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                             _selectDate1(context);

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
                                        width: size.width*0.5,

                                        child: TextFormField(
                                          controller: fromtimeController,

                                          keyboardType: TextInputType.none,
                                          cursorColor: Colors.blue,

                                          //validator: validateUsername,
                                          decoration: InputDecoration(
                                            labelStyle:
                                            TextStyle(color: Colors.black),
                                            suffixIcon: GestureDetector(
                                              onTap: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (_) =>
                                                        CustomEventDialog(title: "titls", content: "content"));
                                                },
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
                                          keyboardType: TextInputType.none,
                                          cursorColor: Colors.blue,
                                          //validator: validateUsername,
                                          decoration: InputDecoration(
                                            labelStyle:
                                            TextStyle(color: Colors.black),
                                            suffixIcon: GestureDetector(
                                              onTap: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (_) =>
                                                        CustomEventDialog1(title: "titls", content: "content"));

                                              },
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

                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        Container(
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
                         child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [  Image.asset(
                              "assets/images/filter.png",
                              height: 20,
                              width: 20,
                            ),
                            Text("Filter", style: TextStyle( color: Colors.white),),
  ]
                        ),),

                           SizedBox(width: 50,),

                            /*             Text("Refersh"),
        GestureDetector(
              onTap: () {
                setState(() {

                });
              },
              child:
                            IconButton(
                                icon: Icon(Icons.refresh),
                                onPressed: () {
                                  setState(() {
                                   // getNewOrderList();
                                  });
                                })
            )
    */

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
                        child: RefreshIndicator(
                          onRefresh: refresh,
                          child: Container(
                           // padding: EdgeInsets.all(10),
                            color:  Color(0xffd5c8d5),
                            child: pendingScreen(),
                          ),
                        ),
                      ),
                      // second tab bar viiew widget
                      GestureDetector(
                        onTap: () {},
                        child: RefreshIndicator(
                          onRefresh: refresh,
                          child: Container(

                            color: Color(0xffd5c8d5),
                            child: processScreen(),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: RefreshIndicator(
                          onRefresh: refresh,
                          child: Container(
                            color:  Color(0xffd5c8d5),
                            child: completeScreen(),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                // _addRemoveCartButtons(),
              ],
            ),
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
        height: height*0.70,
        child: Container(
        child:  FutureBuilder<siftModel>(
        future: jobsiftpending(),
    builder: (BuildContext context,
    AsyncSnapshot<siftModel> snapshot) {
      if (snapshot.hasData) {
        print("objectPrint" +
            snapshot.data!.data[0].id
                .toString());
        //pending = snapshot.data!.data.length.toString();
        return


          Expanded(
            child:
            NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollNotification) {
          print("&&&&&&&");
          if (
          (scrollNotification.metrics.maxScrollExtent -
              scrollNotification.metrics.pixels)
              .round() <=
              200) {
            if(int.parse(pending)>=10){
              var offsetpr =int.parse(offset1)+10;
              // offset1=offsetpr.toString();

              var limit1pr =int.parse(limit)+10;
              limit=limit1pr.toString();



            }
            //_pageSize++;
            //categoryProduct();
            setState(() {
            //  counter=1;
              //loading = false;
            });
          }
          return true;
        },
            child: RefreshIndicator(
              onRefresh: refresh,
              child: ListView.builder(itemCount: snapshot.data!.data.length,
                itemBuilder: (context, index) {
                  return
                    GestureDetector(

                        onTap: () {
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


                                              child: Text('\$${snapshot.data!
                                                  .data[index].job_price}',
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
                                                          .data[index].shift_end_time} ',
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
                                          child: Text("Pending",
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
            ),

          ));
      }
      else{
        if(snapshot.hasError)
        {
          return Center(child: SizedBox(width: width*0.5,
            height: height*0.5, child: Text("NO Data Found" ,style: TextStyle(color: Colors.red),),),) ;}
        else{

          return Center(child: SizedBox(width: width*0.5,
            height: height*0.5, child: Text("Loading..."),),) ;
        }
      }
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
          padding: EdgeInsets.only(top: 25),
        height: height*0.70,
        child: Container(

        child: FutureBuilder<siftModel>(
        future: jobsiftprocess(),
    builder: (BuildContext context,
    AsyncSnapshot<siftModel> snapshot) {
    if (snapshot.hasData) {
     // print("objectPrint" + snapshot.data!.data[0].id.toString());
     // process =snapshot.data!.data.length.toString();
      return

        Expanded(child:
          NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollNotification) {
              print("&&&&&&&");
              if (
                  (scrollNotification.metrics.maxScrollExtent -
                      scrollNotification.metrics.pixels)
                      .round() <=
                      200) {
                if(int.parse(process)>=10){
                  var offsetpr =int.parse(offset1)+10;
                  // offset1=offsetpr.toString();

                  var limit1pr =int.parse(limit1)+10;
                  limit1=limit1pr.toString();



                }
                //_pageSize++;
                //categoryProduct();
                setState(() {
                  //counter1=1;
                  //loading = false;
                });
              }
              return true;
            },
                    child: RefreshIndicator(
                      onRefresh: refresh,
                      child: ListView.builder(
            controller:_scrollController,
            itemCount:  snapshot.data!.data.length, itemBuilder: (context, index) {
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


                                      child: Text('\$${snapshot.data!
                                          .data[index].job_price}',
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
                                                  .data[index].shift_end_time} ',
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
                                  child: Text("Process",
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
                    ),

        ));

    }
    else{
      if(snapshot.hasError)
      {
        return Center(
          child: SizedBox(width: width*0.5,
          height: height*0.5, child: Text("NO Data Found" ,style: TextStyle(color: Colors.red),),),) ;}
      else{

        return Center(child: SizedBox(width: width*0.5,
          height: height*0.5, child: Text("Loading..."),),) ;
      }
    }
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
         // padding: EdgeInsets.only(top: 25),
        height: height*0.70,
        child: Container(
        child: FutureBuilder<siftModel>(
        future: jobsiftcomplate(),
    builder: (BuildContext context,
    AsyncSnapshot<siftModel> snapshot) {
    if (snapshot.hasData) {
    print("objectPrint" +
    snapshot.data!.data
        .toString());


    //complete=snapshot.data!.data.length.toString();



    return

    Expanded(
        child:
        NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollNotification) {
            print("&&&&&&&");
            if (
            (scrollNotification.metrics.maxScrollExtent -
                scrollNotification.metrics.pixels)
                .round() <=
                200) {
              if(int.parse(complete)>=10){
                var offsetpr =int.parse(offset1)+10;
                // offset1=offsetpr.toString();

                var limit1pr =int.parse(limit2)+10;
                limit2=limit1pr.toString();



              }
              //_pageSize++;
              //categoryProduct();
              setState(() {
               // counter2=1;
                //loading = false;
              });
            }
            return true;
          },
          child: RefreshIndicator(
      onRefresh: refresh,
      child: ListView.builder(
      controller:_scrollController2,
      itemCount: snapshot.data!.data.length, itemBuilder: (context, index) {
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


                              child: Text('\$${snapshot.data!
                                  .data[index].job_price}',
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
                                          .data[index].shift_end_time} ',
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
                          child: Text(job_status1[index],
                            style: TextStyle(color: completecolor,
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
    ),
    ));
    }
    else{
      if(snapshot.hasError)
      {
        return Center(child: SizedBox(width: width*0.5,
          height: height*0.5, child: Text("NO Data Found" ,style: TextStyle(color: Colors.red),),),) ;}
      else{

        return Center(child: SizedBox(width: width*0.5,
          height: height*0.5, child: Text("Loading..."),),) ;
      }
    }

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
          'shift_start_time':ftime,
          'shift_date':sdate,
          'shift_end_time':ttime,




        }),);

      print('Response status3a:${requestUrl}');
      var jasonDataOffer = jsonDecode(respone.body);
      //ScaffoldMessenger.of(context).showSnackBar(SnackBar(behavior: SnackBarBehavior.floating,content: Text('loading')));

      if(respone.statusCode == 200){
      //  print('Response status3: ${jasonDataOffer["data"]["job_name"]}');
        print('Response status3a:${requestUrl}');
        print('Response status: ${respone.body}');
        /*
        job_name=jasonDataOffer["data"]["job_name"];
        client_name=jasonDataOffer["data"]["client_name"];
        shift_date=jasonDataOffer["data"]["shift_date"];
        shift_start_time=jasonDataOffer["data"]["shift_start_time"];
        shift_end_time=jasonDataOffer["data"]["shift_end_time"];

         */
     //   var jasonDataOffer = jsonDecode(respone.body);
      //  job_status=jasonDataOffer["data"][0]["job_status"];



        /*if(counter==1)
          setState(() {
            var pending1= int.parse(pending);

            pending=jasonDataOffer["data"].length.toString();

            pending1=pending1+int.parse(pending);
            pending=pending1.toString();
            // jobsiftprocess();


            counter++;


          });

         */

        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(behavior: SnackBarBehavior.floating,content: Text('${jasonDataOffer["message"]}')));

        return siftModel.fromJson(jasonDataOffer);




        //  print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');
        // Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen()));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password Changed  Successfully.!!')));

      }else{
        print('Response statusp: ${respone.statusCode}');
        //  print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');

        // res= jsonDecode(respone.body);
        var jasonDataOffer = jsonDecode(respone.body);
       // ScaffoldMessenger.of(context).showSnackBar(SnackBar(behavior: SnackBarBehavior.floating,content: Text('${jasonDataOffer["message"]}')));

        return jasonDataOffer;
        print('Response status: ${res["message"]}');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));
      }

    }

    else{
      print('Response statusp1: ${respone.statusCode}');
      // res= jsonDecode(respone.body);
      var jasonDataOffer = jsonDecode(respone.body);
    //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(behavior: SnackBarBehavior.floating,content: Text('${jasonDataOffer["message"]}')));

      return jasonDataOffer;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));
    }


  }
  Future <void> refresh()
  async {
    setState(() {

    });
  }

  Future <siftModel> jobsiftprocess() async {
  //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(behavior: SnackBarBehavior.floating,content: Text('loading')));

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
    var requestUrl = url + '/'+limit1+'/'+offset1;
    int i=0;
    if(i==0){
      respone  =  await http.post(Uri.parse(requestUrl),
        headers: <String, String>{'authorization': basicAuth,
          'Content-Type':"application/x-www-form-urlencoded",},
        body: ({
          'job_status':"1",
          'job_type': "1" ,
          'employee_id':id1,
          'shift_start_time':ftime,
          'shift_date':sdate,
          'shift_end_time':ttime,



        }),);
    //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(behavior: SnackBarBehavior.floating,content: Text('loading')));

      print('Response status3a:${requestUrl} -----${sdate}===${id1}==${ttime}');
      var jasonDataOffer = jsonDecode(respone.body);
      if(respone.statusCode == 200){
        print('Response statusprocc: ${respone.statusCode}');

      /*  job_name=jasonDataOffer["data"]["job_name"];
        client_name=jasonDataOffer["data"]["client_name"];
        shift_date=jasonDataOffer["data"]["shift_date"];
        shift_start_time=jasonDataOffer["data"]["shift_start_time"];
        shift_end_time=jasonDataOffer["data"]["shift_end_time"];
        address=jasonDataOffer["data"]["address"];

       */



       //   process=jasonDataOffer["data"].length.toString();
       // ScaffoldMessenger.of(context).showSnackBar(SnackBar(behavior: SnackBarBehavior.floating,content: Text('${jasonDataOffer["message"]}')));

      /* if(counter1==1)
          setState(() {
            var process1= int.parse(process);

            process=jasonDataOffer["data"].length.toString();

              process1=process1+int.parse(process);
              process=process1.toString();
             // jobsiftprocess();


            counter1++;


          });

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
    var requestUrl = url + '/'+limit2+'/'+offset2;
    int i=0;
    if(i==0){
      respone  =  await http.post(Uri.parse(requestUrl),
        headers: <String, String>{'authorization': basicAuth,
          'Content-Type':"application/x-www-form-urlencoded",},
        body: ({
          'job_status':"2",
          'job_type': "1" ,
          'employee_id':id,
          'shift_start_time':ftime,
          'shift_date':sdate,
          'shift_end_time':ttime,




        }),);
    //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(behavior: SnackBarBehavior.floating,content: Text('loading')));

    //  print('Response status3a:${requestUrl}');
      var jasonDataOffer = jsonDecode(respone.body);
      if(respone.statusCode == 200){
        print('Response status: ${respone.body}');


       /* job_name=jasonDataOffer["data"]["job_name"];
        client_name=jasonDataOffer["data"]["client_name"];
        shift_date=jasonDataOffer["data"]["shift_date"];
        shift_start_time=jasonDataOffer["data"]["shift_start_time"];
        shift_end_time=jasonDataOffer["data"]["shift_end_time"];

        */
        for(int i=0;i<jasonDataOffer["data"].length;i++) {
          job_status1.insert(i, jasonDataOffer["data"][i]["job_status"]);
          //job_status[i] = jasonDataOffer["data"][i]["job_status"];

          if (job_status1[i] == "0") {
            job_status1.insert(i, "pending");
           // job_status[i] = "pending";
          }
          if (job_status1[i] == "1") {
            job_status1.insert(i, "process");
          //  job_status[i] = "process";
          }
          if (job_status1[i] == "2") {
            job_status1.insert(i, "complete");
           // completecolor=Colors.green;

           // job_status[i] = "complete";
          }
          if (job_status1[i] == "3") {
            job_status1.insert(i, "Review Updated");
          //  completecolor=Colors.green;
           // job_status[i] = "Review Updated";
          }

          if (job_status1[i] == "4") {
            job_status1.insert(i, "Closed");
            //job_status[i] = "Closed";
          }
        }




      //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(behavior: SnackBarBehavior.floating,content: Text('${jasonDataOffer["message"]}')));
      /*  if(counter2==1){
          setState(() {
            var complete1= int.parse(complete);

            complete=jasonDataOffer["data"].length.toString();

            complete1=complete1+int.parse(complete);
            complete=complete1.toString();
            // jobsiftprocess();



            counter2++;



          });}

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
        print('Response status:  ${jasonDataOffer["data"]["jobstatus"]}');
        job_name=jasonDataOffer["data"]["job_name"];
        address=jasonDataOffer["data"]["address"];
        shift_date=jasonDataOffer["data"]["shift_date"];
        shift_start_time=jasonDataOffer["data"]["shift_start_time"];
        shift_end_time=jasonDataOffer["data"]["shift_end_time"];
        job_description=jasonDataOffer["data"]["job_description"];
        job_price=jasonDataOffer["data"]["job_price"];
        job_long=jasonDataOffer["data"]["job_long"];
        job_lat=jasonDataOffer["data"]["job_lat"];
        job_status=jasonDataOffer["data"]["jobstatus"];
        client_name=jasonDataOffer["data"]["client_name"];
        check_in=jasonDataOffer["data"]["check_in"];
        check_out=jasonDataOffer["data"]["check_out"];
        job_id=jasonDataOffer["data"]["job_id"];
        break_time=jasonDataOffer["data"]["break_time"];
        client_review=jasonDataOffer["data"]["client_review"];
        client_rate=jasonDataOffer["data"]["client_rate"];
        client_signature=jasonDataOffer["data"]["client_signature"];


       /* if(job_status=="0")
        {
          job_status="pending";
        }
        if(job_status == "1")
        {
          job_status="process";
        }
        if(job_status == "2"){ job_status="complete";}
        if(job_status == "4"){ job_status="Closed";}

        */
        if(check_in==null)
        {
          start="0";
        }
        else
        {
          start="1";
        }
        print("&&&&&"+job_status);
        var jobs=int.parse(job_status);

        if(jobs==4)
        {
          print("&&&&&"+job_status+jobs.toString());
          Navigator.push(context, MaterialPageRoute(builder: (context) => bottomBar( bottom: 15,jobid:jobid,)));

        }
        else {
          if (check_out == null) {
            end = "0";
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => bottomBar(bottom: 9, jobid: jobid,)));
          }
          else {
            if (break_time == null || break_time.isEmpty) {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => bottomBar(bottom: 10, jobid: jobid,)));
            }
            else {
              if (client_signature == null) {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>
                        bottomBar(bottom: 11, jobid: jobid,)));
              } else {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>
                        bottomBar(bottom: 11, jobid: jobid,)));
              }
            }
          }
        }





        jasonDataOffer = jsonDecode(respone.body);
       // ScaffoldMessenger.of(context).showSnackBar(SnackBar(behavior: SnackBarBehavior.floating,content: Text('${jasonDataOffer["message"]}')));

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
       // ScaffoldMessenger.of(context).showSnackBar(SnackBar(behavior: SnackBarBehavior.floating,content: Text('${jasonDataOffer["message"]}')));
        //return jasonDataOffer;
        print('Response status: ${res["message"]}');
        //ScaffoldMessenger.of(context).showSnackBar(SnackBar(behavior: SnackBarBehavior.floating,content: Text('${jasonDataOffer["message"]}')));
      }

    }

    else{
      print('Response status1: ${respone.statusCode}');
      // res= jsonDecode(respone.body);
      var jasonDataOffer = jsonDecode(respone.body);
      //return jasonDataOffer;
     // ScaffoldMessenger.of(context).showSnackBar(SnackBar(behavior: SnackBarBehavior.floating,content: Text('${jasonDataOffer["message"]}')));
    }


  }

  Future <void> jobsiftcomplatelength() async {
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
    var limitcl="100";
    var offsetcl="0";
  //  String url = 'https://technolite.in/staging/777healthcare/api/job_list';
    //Map<String, String> queryParameter = {
    //   routeKey: routeGetCount,
    //  };

    // String queryString = Uri(queryParameters: queryParameter).query;
    //var requestUrl = url + '/'+limitcl+'/'+offsetcl;
    int i=0;
    if(i==0){
      respone  =  await http.post(Uri.parse("https://technolite.in/staging/777healthcare/api/job_count"),
        headers: <String, String>{'authorization': basicAuth,
          'Content-Type':"application/x-www-form-urlencoded",},
        body: ({

          'job_type': "1" ,
          'employee_id':id,





        }),);
      //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(behavior: SnackBarBehavior.floating,content: Text('loading')));

      //  print('Response status3a:${requestUrl}');
      var jasonDataOffer = jsonDecode(respone.body);
      if(respone.statusCode == 200){
        print('Response status: ${respone.body}');

        var jasonDataOffer = jsonDecode(respone.body);
        print("&&&&&&");
        print(jasonDataOffer["data"]["jobcount"]["pending"].toString()+jasonDataOffer["data"]["jobcount"]["process"].toString()+jasonDataOffer["data"]["jobcount"]["complete"].toString());
        pending=jasonDataOffer["data"]["jobcount"]["pending"];
        process=jasonDataOffer["data"]["jobcount"]["process"];
        complete=jasonDataOffer["data"]["jobcount"]["complete"];







        //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(behavior: SnackBarBehavior.floating,content: Text('${jasonDataOffer["message"]}')));
        if(countercl==1){
          setState(() {
            //var complete1= int.parse(complete);

            complete=jasonDataOffer["data"].length.toString();

           // complete1=complete1+int.parse(complete);
           // complete=complete1.toString();
            // jobsiftprocess();



            countercl++;



          });}


        //return siftModel.fromJson(jasonDataOffer);




        //  print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');
        // Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen()));
       // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password Changed  Successfully.!!')));

      }else{
        print('Response status: ${respone.statusCode}');
        //  print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');

        // res= jsonDecode(respone.body);
        var jasonDataOffer = jsonDecode(respone.body);
      //  return jasonDataOffer;
      //  print('Response status: ${res["message"]}');
      //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));
      }

    }

    else{
      print('Response status: ${respone.statusCode}');
      // res= jsonDecode(respone.body);
      var jasonDataOffer = jsonDecode(respone.body);
      //return jasonDataOffer;
     // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));
    }


  }
  Future <void> jobsiftpendinglength() async {
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
    var limitpel="100";
    var offsetpel="0";
    String url = 'https://technolite.in/staging/777healthcare/api/job_list';
    //Map<String, String> queryParameter = {
    //   routeKey: routeGetCount,
    //  };

    // String queryString = Uri(queryParameters: queryParameter).query;
    var requestUrl = url + '/'+limitpel+'/'+offsetpel;
    int i=0;
    if(i==0){
      respone  =  await http.post(Uri.parse(requestUrl),
        headers: <String, String>{'authorization': basicAuth,
          'Content-Type':"application/x-www-form-urlencoded",},
        body: ({
          'job_status':"0",
          'job_type': "1" ,
          'employee_id':id,
          'shift_start_time':ftime,
          'shift_date':sdate,
          'shift_end_time':ttime,




        }),);
      //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(behavior: SnackBarBehavior.floating,content: Text('loading')));

      //  print('Response status3a:${requestUrl}');
      var jasonDataOffer = jsonDecode(respone.body);
      if(respone.statusCode == 200){
        print('Response status: ${respone.body}');

        var jasonDataOffer = jsonDecode(respone.body);
        /* job_name=jasonDataOffer["data"]["job_name"];
        client_name=jasonDataOffer["data"]["client_name"];
        shift_date=jasonDataOffer["data"]["shift_date"];
        shift_start_time=jasonDataOffer["data"]["shift_start_time"];
        shift_end_time=jasonDataOffer["data"]["shift_end_time"];

        */




        //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(behavior: SnackBarBehavior.floating,content: Text('${jasonDataOffer["message"]}')));
        if(counterpel==1){
          setState(() {
            //var complete1= int.parse(complete);

            pending=jasonDataOffer["data"].length.toString();

            // complete1=complete1+int.parse(complete);
            // complete=complete1.toString();
            // jobsiftprocess();



            counterpel++;



          });}


        //return siftModel.fromJson(jasonDataOffer);




        //  print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');
        // Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen()));
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password Changed  Successfully.!!')));

      }else{
        print('Response status: ${respone.statusCode}');
        //  print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');

        // res= jsonDecode(respone.body);
        var jasonDataOffer = jsonDecode(respone.body);
        //  return jasonDataOffer;
        //  print('Response status: ${res["message"]}');
        //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));
      }

    }

    else{
      print('Response status: ${respone.statusCode}');
      // res= jsonDecode(respone.body);
      var jasonDataOffer = jsonDecode(respone.body);
      //return jasonDataOffer;
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));
    }


  }
  Future <void> jobsiftproccesslength() async {
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
    var limitprocl="100";
    var offsetprocl="0";
    String url = 'https://technolite.in/staging/777healthcare/api/job_list';
    //Map<String, String> queryParameter = {
    //   routeKey: routeGetCount,
    //  };

    // String queryString = Uri(queryParameters: queryParameter).query;
    var requestUrl = url + '/'+limitprocl+'/'+offsetprocl;
    int i=0;
    if(i==0){
      respone  =  await http.post(Uri.parse(requestUrl),
        headers: <String, String>{'authorization': basicAuth,
          'Content-Type':"application/x-www-form-urlencoded",},
        body: ({
          'job_status':"1",
          'job_type': "1" ,
          'employee_id':id,
          'shift_start_time':ftime,
          'shift_date':sdate,
          'shift_end_time':ttime,




        }),);
      //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(behavior: SnackBarBehavior.floating,content: Text('loading')));

      //  print('Response status3a:${requestUrl}');
      var jasonDataOffer = jsonDecode(respone.body);
      if(respone.statusCode == 200){
        print('Response status: ${respone.body}');

        var jasonDataOffer = jsonDecode(respone.body);
        /* job_name=jasonDataOffer["data"]["job_name"];
        client_name=jasonDataOffer["data"]["client_name"];
        shift_date=jasonDataOffer["data"]["shift_date"];
        shift_start_time=jasonDataOffer["data"]["shift_start_time"];
        shift_end_time=jasonDataOffer["data"]["shift_end_time"];

        */




        //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(behavior: SnackBarBehavior.floating,content: Text('${jasonDataOffer["message"]}')));
        if(counterprocl==1){
          setState(() {
            //var complete1= int.parse(complete);

            process=jasonDataOffer["data"].length.toString();

            // complete1=complete1+int.parse(complete);
            // complete=complete1.toString();
            // jobsiftprocess();



            counterprocl++;



          });}


        //return siftModel.fromJson(jasonDataOffer);




        //  print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');
        // Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen()));
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password Changed  Successfully.!!')));

      }else{
        print('Response status: ${respone.statusCode}');
        //  print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');

        // res= jsonDecode(respone.body);
        var jasonDataOffer = jsonDecode(respone.body);
        //  return jasonDataOffer;
        //  print('Response status: ${res["message"]}');
        //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));
      }

    }

    else{
      print('Response status: ${respone.statusCode}');
      // res= jsonDecode(respone.body);
      var jasonDataOffer = jsonDecode(respone.body);
      //return jasonDataOffer;
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));
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
  DateTime _dateTime = DateTime.now();
  TextEditingController textController = TextEditingController();
  int time1=0;
  String valuebr="";
  ValueNotifier<String> Breakhr = ValueNotifier<String>("");
  String start="";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: size.width * 0.55,
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
                  height: size.height * .45,
                  width: size.width * .6,

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
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 5),

                              height: 40,
                              width: size.width * .25,
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
                                  style: TextStyle(
                                      color: kPrimaryColor, fontSize: 15),),
                              ),

                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              String dateh="";
                              String datemin="";
                             // _incrementCounter();
                              dateh=_dateTime.hour.toString();
                              datemin=_dateTime.minute.toString();
                              if(_dateTime.hour<10){

                                dateh  = "0"+_dateTime.hour.toString();

                              }
                              if(_dateTime.minute<10){
                                datemin="0"+_dateTime.minute.toString();
                              }


                              fromtimeController.text = dateh + ":" + datemin;


                              Navigator.of(context).pop();
                            },
                            child:
                            Container(
                              margin: EdgeInsets.only(top: 5),

                              height: 40,
                              width: size.width * .25,
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
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),),
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
class CustomEventDialog1 extends StatefulWidget {
  final title;
  final  content;
  CustomEventDialog1({this.title, this.content});

  @override
  CustomEventDialogState1 createState() => new CustomEventDialogState1();
}

class CustomEventDialogState1 extends State<CustomEventDialog1> {
  // DateTime _dateTime = DateTime.now();
  var _selectedlanguage = 'hindi';
  DateTime _dateTime = DateTime.now();
  DateTime _dateTime1 = DateTime.now();
  TextEditingController textController = TextEditingController();
  int time1=0;
  String valuebr="";
  ValueNotifier<String> Breakhr = ValueNotifier<String>("");
  String start="";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: size.width * 0.55,
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
                  height: size.height * .45,
                  width: size.width * .6,

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
                            _dateTime1 = time;

                          });
                        },
                      ),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 5),

                              height: 40,
                              width: size.width * .25,
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
                                  style: TextStyle(
                                      color: kPrimaryColor, fontSize: 15),),
                              ),

                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              // _incrementCounter();
                              String dateh="";
                              String datemin="";
                              // _incrementCounter();
                              dateh=_dateTime1.hour.toString();
                              datemin=_dateTime1.minute.toString();
                              if(_dateTime1.hour<10){

                                dateh  = "0"+_dateTime1.hour.toString();

                              }
                              if(_dateTime1.minute<10){
                                datemin="0"+_dateTime1.minute.toString();
                              }


                              totimeController.text = dateh + ":" + datemin;

                              //totimeController.text=_dateTime1.hour.toString()+":"+_dateTime1.minute.toString();;

                              Navigator.of(context).pop();
                            },
                            child:
                            Container(
                              margin: EdgeInsets.only(top: 5),

                              height: 40,
                              width: size.width * .25,
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
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),),
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

