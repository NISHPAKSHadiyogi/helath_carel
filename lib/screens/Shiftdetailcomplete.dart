
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:helath_care/Constant/Colors.dart';

class Shiftdetailcompletescreen extends StatefulWidget {
  const Shiftdetailcompletescreen({Key? key}) : super(key: key);

  @override
  _ShiftdetailcompletescreenState createState() => _ShiftdetailcompletescreenState();
}

class _ShiftdetailcompletescreenState extends State<Shiftdetailcompletescreen> {
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
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
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
            child: Row(
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
                          child:Text('00',),
                          /* Text(timeHour == null
                              ? "0"
                              : timeHour.toString())*/
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
                        padding: EdgeInsets.all(5),
                        child: Center(
                          child:Text('00',),
                          /* Text(timeMinuts == null
                              ? "0"
                              : timeMinuts.toString()),*/
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
                        padding: EdgeInsets.all(5),
                        child: Center(
                          child: Text('00',),
                          /* child: Text(timeSecond == null
                              ? "0"
                              : timeSecond.toString()),*/
                        )),
                  ],
                ),
              ],
            ),
          ),
          Card(
            elevation: 5,
            margin: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: size.width*0.7,
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
                              child: Row(
                                children: [
                                  Image.asset('assets/images/location.png',
                                    height: 20,
                                    width: 20,),
                                  SizedBox(width: 5,),
                                  Text('Port Washington North, New York',
                                    style: TextStyle(fontSize: 12),),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(2.8),
                              child: Row(

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
                              child: Row(
                                children: [
                                  Image.asset('assets/images/shift_time.png',
                                    height: 18,
                                    width: 20,),
                                  SizedBox(width: 5,),
                                  Text('Shift Time :', style: TextStyle(fontSize: 12),),
                                  Text('11:00 AM To 01:30 PM', style: TextStyle(fontSize: 12),),
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
                                color: kPrimaryColor,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1.0,
                                    style: BorderStyle.solid,
                                    color:kPrimaryColor,),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Row(
                      children: [
                        Container(
                          padding:EdgeInsets.all(2.8),
                          child: Text('Client Name :',
                            style: TextStyle(color: Colors.black,
                                fontSize: 16,fontWeight: FontWeight.w600),),
                        ),

                        Container(
                          padding:EdgeInsets.all(2.8),
                          child: Text('Benjium William',
                            style: TextStyle(color: Colors.black, fontSize: 16),),
                        ),
                      ],
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
          Text('map'),
          /* GoogleMap(
            myLocationEnabled: true,
            compassEnabled: false,
            tiltGesturesEnabled: false,
            markers: _markers,
            mapType: MapType.terrain,
            initialCameraPosition: CameraPosition(
                zoom: CAMERA_ZOOM,
                tilt: CAMERA_TILT,
                bearing: CAMERA_BEARING,
                target:currentLocation),
            onTap: (LatLng loc) {
              setState(() {
                this.pinPillPosition = PIN_INVISIBLE_POSITION;
                this.userBadgeSelected = false;
              });
            },
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);

              showPinsOnMap();
              // setPolylines();
            },
          ),*/
        ],
      ),
    );
  }
}
