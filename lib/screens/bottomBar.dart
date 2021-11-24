import 'package:flutter/material.dart';
import 'package:helath_care/Constant/Colors.dart';
import 'package:helath_care/screens/Myavailability.dart';
import 'package:helath_care/screens/Notification.dart';
import 'package:helath_care/screens/Updateprofile.dart';

import 'Faq.dart';
import 'Findshift.dart';
import 'Home.dart';
import 'Login.dart';
import 'Myshift.dart';
import 'Mytimesheet.dart';
import 'Shiftdetailcomplete.dart';
import 'Shiftdetails.dart';
import 'Timesheet.dart';
import 'Worksheet.dart';
import 'Worksheetsubmit.dart';
import 'Workspross.dart';


// Stateful widget created
class bottomBar extends StatefulWidget {
  int bottom;
  String jobid="";
  String empid="";
  bottomBar({required this.bottom,required this.jobid});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<bottomBar> {
// index given for tabs

  //_HomePageState({empid,jobid});
  int _selectedItemIndex = 2;
  //String empid1="0";
  String jobid1="0";
  final List pages = [
    Shiftscreen(),
    Avialabilityscreen(),
    Homescreen(),
    Notificationscreen(),
    ProfileScreen(),
    FindshiftScreen(),
    mytimesheetScreen(),
    faqscreen(),
    LoginScreen(),
    faqscreen(),
    faqscreen(),
    faqscreen(),
    faqscreen(),
    WorkShiftscreen(),
  ];

  setBottomBarIndex(index) {
    setState(() {
      _selectedItemIndex = index;
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _selectedItemIndex = widget.bottom == null ? 0 : widget.bottom;
    //  empid1=widget.empid==null?"":widget.empid;
      jobid1=widget.jobid==null?"":widget.jobid;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;
    pages[9]=Shiftdetailscreen(jobid: jobid1,);
    pages[10]=timesheetScreen(jobid: jobid1,);
    pages[11]=WorksheetScreen(jobid: jobid1,);
    pages[12]=Woksheetsubmitscreen(jobid: jobid1,);


    return Scaffold (
      body: pages[_selectedItemIndex],

      // floating action button in center
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setBottomBarIndex(2);
        },
        child:  Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            // color: BackColorCard,
            color: Colors.white.withOpacity(1),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade200
                      .withOpacity(.1),
                  blurRadius: 4,
                  spreadRadius: 3)
            ],
            border: Border.all(
              width: 5,
              color: kPrimaryColor.withOpacity(1),
            ),
            borderRadius: BorderRadius.circular(50.0),
          ),
          padding: EdgeInsets.all(5),
          child: Image.asset("assets/images/logo_c.png",
            height: 25,
            width: 25,),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // bottom app bar
      bottomNavigationBar: BottomAppBar(
        color: kbottomColor,
        shape: CircularNotchedRectangle(),

        child: Container(
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // button 1
              IconButton(

                icon: Image.asset("assets/images/myshift.png",
                  height: 25,
                  width: 25,),


                onPressed: () {
                  setBottomBarIndex(0);
                },
                splashColor: Colors.white,
              ),

              // button 2
              IconButton(
                icon: Image.asset("assets/images/avialbility.png",
                  height: 25,
                  width: 25,),
                onPressed: () {
                  setBottomBarIndex(1);
                },
                splashColor: Colors.white,
              ),
              SizedBox.shrink(),

              // button 3
              IconButton(
                icon: Image.asset("assets/images/notification.png",
                  height: 25,
                  width: 25,),
                onPressed: () {
                  setBottomBarIndex(3);
                },
                splashColor: Colors.white,
              ),

              // button 4
              IconButton(
                icon: Image.asset("assets/images/profile.png",
                  height: 25,
                  width: 25,),
                onPressed: () {
                  setBottomBarIndex(4);
                },
                splashColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }


  GestureDetector buildNavBarItem(IconData icon, Text text, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItemIndex = index;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 5,
        height: 60,

        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Icon(
              icon,
              color: index == _selectedItemIndex
                  ? kPrimaryColor
                  : Colors.grey[500],
            ),

          ],
        ),
      ),
    );
  }
}
