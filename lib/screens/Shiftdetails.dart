
import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'package:helath_care/Api/Models/siftModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:helath_care/Api/Models/shiftDetailModel.dart';
import 'package:helath_care/Constant/Colors.dart';
import 'package:intl/intl.dart';
import 'package:ntp/ntp.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../LocationServices/locationmodel.dart';
import 'bottomBar.dart';
const double CAMERA_ZOOM = 16;
const double CAMERA_TILT = 80;
const double CAMERA_BEARING = 30;
const double PIN_VISIBLE_POSITION = 20;
const double PIN_INVISIBLE_POSITION = -220;
class Shiftdetailscreen extends StatefulWidget {
 /*
  final String jobname;
  final String address;
  final String shift;
  final String starttime;
  final String endtime;
  final String clientname;
  final String price;

  */

  String jobid="";


  Shiftdetailscreen({required this.jobid});
  //const Shiftdetailscreen({Key? key}) : super(key: key);
//  const Shiftdetailscreen(this.jobname,this.address,this.shift,this.starttime,this.endtime,this.clientname,this.price);



  @override
  _ShiftdetailscreenState createState() => _ShiftdetailscreenState();
}

class _ShiftdetailscreenState extends State<Shiftdetailscreen> {
  late Timer timer;
  int second = 0;
  late int timeHour=0;
  late int timeMinuts=0;
  late int timeSecond=0;
  late DateTime _myTime;
  late DateTime _ntpTime;
  var CheckintimeFor_Counter;
  var workingHour="0";
  var workingMin="0";
  var workingSec="0";

  String start="";
  String end="";
  String check_in="";
  String check_out="";
Color sscolorS =kPrimaryColor;
  Color sscolorE =kPrimaryColor;

  Set<Polyline> _polylines = Set<Polyline>();
  final double _initFabHeight = 120.0;
  double _fabHeight = 0;
  double g_panelHeightOpen = 0;
  double _panelHeightClosed = 95.0;
  var ipAddress;
  var userLocation;
  var distance =  "0.00 km";
  late BitmapDescriptor sourceIcon ;
  double pinPillPosition = PIN_VISIBLE_POSITION;
  bool userBadgeSelected = false;
  late BitmapDescriptor destinationIcon;
  late LatLng currentLocation;
  late LatLng destinationLocation;
  String limit = '10';
  String offset = '0';
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


//  String path = All_API().baseurl_img + All_API().profile_img_path;

  var currentTime;
  Completer<GoogleMapController> _controller = Completer();
  // Future <DemoMapDetailModel> futureData;

  static const LatLng _center = const LatLng(45.521563, -122.677433);
  late double lat;
  late double lng;
  Set<Marker> _markers = Set<Marker>();
String jobid1="";
  LatLng _lastMapPosition =LatLng(45.521563, -122.677433);
  void setInitialLocation() {

    // double userlat = -37.765613;
    // double userlong = 144.924794;
    //
    // double lat = -37.765613;
    // double long = 144.9226053;
    // setState(() {
    //   currentLocation = LatLng(userlat, userlong);
    //
    //   destinationLocation = LatLng(lat, long);
    // });
   // print("userLocation==>"+userLocation.latitude.toString()+userLocation.longitude.toString());

    userLocation = Provider.of<UserLocation>(context,listen: false);

    print("userLocation==>"+userLocation.latitude.toString()+userLocation.longitude.toString());
  //  print("destination==>"+widget.placeidtoo.latitude.toString()+widget.placeidtoo.longitude.toString());

    // double lat=userLocation.latitude==null?0.00:userLocation.latitude;
    // double long=userLocation.longitude==null?0.00:userLocation.longitude;
    setState(() {
     // currentLocation =LatLng(-37.838313, 144.986480);
     currentLocation =LatLng(userLocation.latitude, userLocation.longitude);
   //  double lat=double.parse(job_lat);
    // double Log=double.parse(job_long);
     //print('${lat}-----${Log}');

     destinationLocation =LatLng(26.265445, 72.978937);
    });

  }
  @override
  void initState() {
    jobid1=widget.jobid==null?"":widget.jobid;
   // jobDetail();
    setInitialLocation();
    setPolylines();
    super.initState();

      print('${start}@@@###${end}');


    _fabHeight = _initFabHeight;
  //  super.initState();
    //jobid1=widget.jobid==null?"":widget.jobid;
  }

  @override
  Widget build(BuildContext context) {




    this.setSourceAndDestinationMarkerIcons(context);

    MediaQueryData mediaQuery = MediaQuery.of(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Container(
          child: Text(
            'Shift Details',
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
        children: [
          Container(
            width: width,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
             color: kPrimaryColor,
             /* color: setthemecolor == null
                  ? kSecondaryColor
                  : HexColor(setthemecolor),*/
              // image: DecorationImage(
              //   image: AssetImage("assets/bg1.png"),
              //   fit: BoxFit.fill,
              //   alignment: Alignment.center,
              // ),
            ),

            child:FittedBox(
              child:
            Row(
              children: [
                Card(

                    child: Padding(
                        padding: EdgeInsets.all(1.0),
                        child: Container(
                            height: 40,
                            width: 40,
                            child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Image.asset(
                                  "assets/images/shift_time.png"),
                            )))),
                Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text(
                      " Working Hour's ",
                      style: TextStyle(color: Colors.white),
                    )),
                SizedBox(
                  width: 15,
                ),
                Row(
                  children: [
                    Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.white
                                    .withOpacity(.1),
                                blurRadius: 8,
                                spreadRadius: 3)
                          ],
                          border: Border.all(
                            width: 5.0,
                            color: ksecondaryColor,
                          ),
                          borderRadius:
                          BorderRadius.circular(60.0),
                        ),
                        padding: EdgeInsets.all(5),
                        child: Center(
                          child:
                           Text(timeHour == null
                               ? "0"
                               : timeHour.toString()),
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    Text(":",
                        style:
                        TextStyle(color: Colors.white)),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color:Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.white
                                    .withOpacity(.1),
                                blurRadius: 8,
                                spreadRadius: 3)
                          ],
                          border: Border.all(
                            width: 5.0,
                            color: ksecondaryColor,
                          ),
                          borderRadius:
                          BorderRadius.circular(60.0),
                        ),
                        padding: EdgeInsets.all(2),
                        child: Center(
                          child:
                           Text(timeMinuts == null
                              ? "0"
                              : timeMinuts.toString()),
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    Text(":",
                        style:
                        TextStyle(color: Colors.white)),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.white
                                    .withOpacity(.1),
                                blurRadius: 8,
                                spreadRadius: 3)
                          ],
                          border: Border.all(
                            width: 5.0,
                            color: ksecondaryColor,
                          ),
                          borderRadius:
                          BorderRadius.circular(60.0),
                        ),
                        padding: EdgeInsets.all(2),
                        child: Center(
                          child: Text(timeSecond == null
                              ? "0"
                              : timeSecond.toString()),
                        )),
                  ],
                ),
              ],
            ),
            ),
          ),


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
                                Text('${shift_start_time}To ${shift_end_time}', style: TextStyle(fontSize: 11),),
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
                      children :[

                        GestureDetector(

                          onTap: (){
                            print("ghdg");
                            if(start=="")

                            {
                              start=="1";

                                Startjobsift();



                            }

                            // Shiftscreen();

                          },

                          child:
                          Container(

                            padding:
                            EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                            margin:
                            EdgeInsets.only(left: 0,bottom: 5,right: 5),
                            height: 30,
                            decoration: ShapeDecoration(
                              color: sscolorS,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1.0,
                                  style: BorderStyle.solid,
                                  color:  Color(0xffc4c4c4),),
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                              ),
                            ),
                            child:  Text("Start Shift",
                              style: TextStyle( color: Colors.white),),
                          ),
                        ),


                        GestureDetector(

                          onTap: (){
                            print("ghdg");
                            if(check_out==null) {

                              Endjobsift();
                              setState(() {

                              });

                            }


                            // Shiftscreen();

                          },

                          child:

                          Container(
                            padding:
                            EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                            margin:
                            EdgeInsets.only(left: 0,bottom: 5),
                            height: 30,
                            decoration: ShapeDecoration(
                              color: sscolorE,
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



        
    Container(
      width: width,

     height: height/3.5,

        child:

    GoogleMap(
    myLocationEnabled: true,
    compassEnabled: false,
    tiltGesturesEnabled: false,
    markers: _markers,
    polylines: _polylines,

    mapType: MapType.terrain,
    initialCameraPosition: CameraPosition(
    zoom: CAMERA_ZOOM,
    tilt: CAMERA_TILT,
    bearing: CAMERA_BEARING,
    target:currentLocation),

    onMapCreated: (GoogleMapController controller) {
    _controller.complete(controller);

    showPinsOnMap();
    setPolylines();
    },

    onCameraMove: _onCameraMove,
    )







    )



        ],
      );
    }
    else{return SizedBox();}
    })
      ),

    );
  }
void showPinsOnMap() {
  setState(() {
    _markers.add(Marker(
        markerId: MarkerId('sourcePin'),
        position: currentLocation,
        icon: sourceIcon,
        infoWindow: InfoWindow(
          title: 'You',
          // snippet: _destinationAddress,
        ),

        onTap: () {
          setState(() {
            this.userBadgeSelected = true;
          });
        }));

    _markers.add(Marker(
        markerId: MarkerId('destinationPin'),
        //position: LatLng(25.7781,73.3311),
        position: destinationLocation,
        icon: destinationIcon,
        infoWindow: InfoWindow(
          title: 'Pick up from',
          //snippet:widget.status1==1?'${widget.resdes}':'${widget.userdes}',
        ),
        onTap: () {
          setState(() {
            this.pinPillPosition = PIN_VISIBLE_POSITION;
          });
        }));
  });
}

void setPolylines() async {
  String url =
      "https://maps.googleapis.com/maps/api/directions/json?mode=${'DRIVING'}&origin=${currentLocation.latitude},${currentLocation.longitude}&destination=${destinationLocation.latitude},${destinationLocation.longitude}&key=${'AIzaSyBKxlvXi_SANYC3WOH5FULVBbNFnbVKsCU'}";

  print("urlstri " + url.toString());
  http.Response response = await http.get(Uri.parse(url));
  Map values = jsonDecode(response.body);
  print("values " +
      values["routes"][0]["overview_polyline"]["points"].toString());

  var points = values["routes"][0]["overview_polyline"]["points"];
  distance =values["routes"][0]["legs"][0]['distance']['text'];
  var currentRoutePolylineId= points;
  print("km : "+ distance.toString());



  setState(() {
    _polylines.add(Polyline(
      width: 3,

      polylineId: PolylineId("Polyline"),
      color: Color(0xFF08A5CB),
      geodesic: true,
      points: convertToLatLng(decodePoly(currentRoutePolylineId)),

    ));
  });
}
  static List decodePoly(String poly) {
    var list = poly.codeUnits;
    var lList = <double>[];{ 1;2;5;9; }
    int index = 0;
    int len = poly.length;
    int c = 0;
    // repeating until all attributes are decoded
    do {
      var shift = 0;
      int result = 0;

      // for decoding value of one attribute
      do {
        c = list[index] - 63;
        result |= (c & 0x1F) << (shift * 5);
        index++;
        shift++;
      } while (c >= 32);
      /* if value is negative then bitwise not the value */
      if (result & 1 == 1) {
        result = ~result;
      }
      var result1 = (result >> 1) * 0.00001;
      lList.add(result1);
    } while (index < len);

    /*adding to previous value as done in encoding */
    for (var i = 2; i < lList.length; i++) lList[i] += lList[i - 2];

    print(lList.toString());

    return lList;
  }
  static List<LatLng> convertToLatLng(List points) {
    List<LatLng> result = <LatLng>[];
    for (int i = 0; i < points.length; i++) {
      if (i % 2 != 0) {
        result.add(LatLng(points[i - 1], points[i]));
        print("point : "+result.toString());
      }
    }
    return result;
  }
void _onCameraMove(CameraPosition position) {
  _lastMapPosition = position.target;
}

  Future <siftDetailModel> Startjobsift() async {
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

    String url = 'https://technolite.in/staging/777healthcare/api/job_check_in_out';
    //Map<String, String> queryParameter = {
    //   routeKey: routeGetCount,
    //  };

    // String queryString = Uri(queryParameters: queryParameter).query;
    var requestUrl = url ;
    int i=0;
    if(i==0){
      respone  =  await http.post(Uri.parse(requestUrl),
        headers: <String, String>{'authorization': basicAuth,
          'Content-Type':"application/x-www-form-urlencoded",},
        body: ({
          'job_id':jobid1,
          'check_type': "check_in" ,
          'employee_id':id,

          'location':"${currentLocation.latitude},${currentLocation.longitude}"


        }),);

      print('Response status3a:${requestUrl}');
      var jasonDataOffer = jsonDecode(respone.body);
      if(respone.statusCode == 200){
        var res = jsonDecode(respone.body);
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





      //  var countertime =
       // DateFormat.Hms().format(DateTime.parse(CheckintimeFor_Counter));
      //  print("countertime : " + countertime.toString());

        var counter = CheckintimeFor_Counter.split(":");

        var HOUR_24workingHour = counter[0];
        var MIN_24workingHour = counter[1];
        var SEC_24workingHour = counter[2];

        workingHour = HOUR_24workingHour;
        workingMin = MIN_24workingHour;
        workingSec = SEC_24workingHour;

        print("workingHour &&&&&&&&&&&&&&&&&&&& : " + workingHour);
        print("workingMin : " + workingMin);
        print("workingSec : " + workingSec);
        // print("timer.isActive: "+timer.isActive.toString());



        setState(() {
          sscolorS=Colors.grey;
          start="0";
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}-----')));
          startTimer();


        });

        return siftDetailModel.fromJson(jasonDataOffer);




        //  print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');
        // Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen()));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password Changed  Successfully.!!')));

      }else{
        print('Response statusp: ${respone.statusCode}');
        //  print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');

         res= jsonDecode(respone.body);
        var jasonDataOffer = jsonDecode(respone.body);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}^^^')));
        return jasonDataOffer;
        print('Response status: ${res["message"]}');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));
      }

    }

    else{
      print('Response statusp1: ${respone.statusCode}');
       res= jsonDecode(respone.body);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}&&&&')));
      var jasonDataOffer = jsonDecode(respone.body);
      return jasonDataOffer;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));
    }


  }
  void setSourceAndDestinationMarkerIcons(BuildContext context) async {
    String parentCat = "Naveen Chouhan";

    sourceIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: 2.0),
      'assets/images/location.png',);

    destinationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.0),
        'assets/images/location.png');

  }
  Future <siftDetailModel> Endjobsift() async {
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
    String url = 'https://technolite.in/staging/777healthcare/api/job_check_in_out';
    //Map<String, String> queryParameter = {
    //   routeKey: routeGetCount,
    //  };

    // String queryString = Uri(queryParameters: queryParameter).query;
    var requestUrl = url ;
    int i=0;
    if(i==0){
      respone  =  await http.post(Uri.parse(requestUrl),
        headers: <String, String>{'authorization': basicAuth,
          'Content-Type':"application/x-www-form-urlencoded",},
        body: ({
          'job_id':jobid1,
          'check_type': "check_out" ,
          'employee_id':id,

          'location':"${currentLocation.latitude},${currentLocation.longitude}"


        }),);

      print('Response status3a:${requestUrl}');
      var jasonDataOffer = jsonDecode(respone.body);
      if(respone.statusCode == 200){
        //  print('Response status3: ${jasonDataOffer["data"]["job_name"]}');

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${jasonDataOffer["message"]}')));
        print('Response status3a:${requestUrl}');
        print('Response status: ${respone.body}');
        /* job_name=jasonDataOffer["data"]["job_name"];
        client_name=jasonDataOffer["data"]["client_name"];
        shift_date=jasonDataOffer["data"]["shift_date"];
        shift_start_time=jasonDataOffer["data"]["shift_start_time"];
        shift_end_time=jasonDataOffer["data"]["shift_end_time"];
        address=jasonDataOffer["data"]["address"];

        */

        end="0";
        Navigator.push(context, MaterialPageRoute(builder: (context) => bottomBar( bottom: 10,jobid:jobid1,)));

        return siftDetailModel.fromJson(jasonDataOffer);




        //  print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');
        // Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen()));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password Changed  Successfully.!!')));

      }else{
        print('Response statusp: ${respone.statusCode}');

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));
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

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));
      var jasonDataOffer = jsonDecode(respone.body);
      return jasonDataOffer;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));
    }


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
      respone  =  await http.post(Uri.parse(requestUrl),
        headers: <String, String>{'authorization': basicAuth,
          'Content-Type':"application/x-www-form-urlencoded",},
        body: ({
          'job_id':jobid1,

          'employee_id':id,




        }),);

      var jasonDataOffer = jsonDecode(respone.body);

      if(respone.statusCode == 200){
        var jasonDataOffer = jsonDecode(respone.body);
        print('Response status###:  ${respone.body}');
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

        print('${check_in}&&&&&${check_out}');
        CheckintimeFor_Counter = check_in.toString();


        if(job_status=="0")
        {
          job_status="pending";
        }
        if(job_status == "1")
      {
        job_status="process";
      }
        if(job_status == "2"){ job_status="complete";}
       if(check_in==null)
         {
           sscolorS=kPrimaryColor;

         }
       else
         {

           sscolorS=Colors.grey;
           setState(() {
             startTimer();
           });

         }
        if(check_out==null){
          end="0";
          sscolorE=kPrimaryColor;
        }

        else{
          sscolorE=Colors.grey;
        //  Navigator.push(context, MaterialPageRoute(builder: (context) => bottomBar( bottom: 10,jobid:job_id,)));


        }





        return ("success");
        setState(() {

        });







         jasonDataOffer = jsonDecode(respone.body);
      //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${jasonDataOffer["message"]}')));
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

  void startTimer()  {
    const oneSec = const Duration(seconds: 1);

    timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        second++;
        setState(() async {
          _myTime = DateTime.now();
          print("_myTime-- " +_myTime.toString());
          final int offset =await NTP.getNtpOffset(localTime: _myTime, );
          _myTime = _myTime.add(Duration(milliseconds: offset));
          //String url = All_API().baseurl + All_API().api_attendance;
          print("_myTime--2 " +_myTime.toString());
          var strToDateTime = DateTime.parse(_myTime.toString());
          var  convertLocal = strToDateTime.toLocal();

          currentTime = DateFormat.Hms().format(convertLocal);
          var dateUtc = DateTime.now().toUtc();
          var dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateUtc.toString(), true);
         strToDateTime = DateTime.parse(dateUtc.toString());
           convertLocal = dateTime.toLocal();
          print("currentTime org ######99999 " + currentTime.toString());
          currentTime = DateFormat.Hms().format(convertLocal);
          print("currentTime org " + currentTime);
          var counter = currentTime.split(":");

          var HOUR_24_CURRENT_Hour = counter[0];
          var MIN_24_CURRENT_Hour = counter[1];
          var SEC_24_CURRENT_Hour = counter[2];
          print("HOUR_24_CURRENT : " + HOUR_24_CURRENT_Hour);
          print("MIN_24_CURRENT : " + MIN_24_CURRENT_Hour);
          print("SEC_24_CURRENT : " + SEC_24_CURRENT_Hour);
          print("workingHour : " + workingHour);
          print("workingMin : " + workingMin);
          print("workingSec : " + workingSec);
          int hour = int.parse(HOUR_24_CURRENT_Hour);
          int minute = int.parse(MIN_24_CURRENT_Hour);
          int second = int.parse(SEC_24_CURRENT_Hour);
          if (int.parse(workingSec.toString()) > second) {
            timeSecond = (60 + second) - int.parse(workingSec);
            minute = minute - 1;
          } else {
            timeSecond = second - int.parse(workingSec);
          }


          if (int.parse(workingMin.toString()) > minute) {
            timeMinuts = (60 + minute) - int.parse(workingMin);
            hour = hour - 1;
          } else {
            timeMinuts = minute - int.parse(workingMin);
          }

          if (int.parse(workingHour.toString()) <= 0) {
            timeHour = 0;
          } else {
            timeHour = hour - int.parse(workingHour.toString());
          }

          print("time on counter###### " + timeHour.toString());
          print("time on counter " + timeMinuts.toString());
          print("time on counter " + timeSecond.toString());
        });
      },
    );
  }

}
