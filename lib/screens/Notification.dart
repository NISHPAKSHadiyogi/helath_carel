import 'dart:convert';



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helath_care/Api/Models/typeModel.dart';
import 'package:helath_care/Constant/Colors.dart';
import 'package:http/http.dart' as http;
import 'package:helath_care/Api/Models/notificationModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Home.dart';
import 'bottomBar.dart';


class Notificationscreen extends StatefulWidget {
  const Notificationscreen({Key? key}) : super(key: key);

  @override
  _NotificationscreenState createState() => _NotificationscreenState();
}

class _NotificationscreenState extends State<Notificationscreen> {
  String limit = '10';
  String offset = '0';
  String id="";
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(

          title: Text("Notifiations",
            style: TextStyle(fontSize: 20, color: Colors.white),),
          backgroundColor: kPrimaryColor,
          centerTitle: true,
          leading: Container(

            child: GestureDetector(
              onTap: () {
                /* Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Homescreen()),
              );*/
                Navigator.push(context, MaterialPageRoute(builder: (context) =>bottomBar(bottom: 2, jobid: id)));

              },
              child: Icon(Icons.arrow_back_ios_rounded, color: Colors.white,),

            ),
          ),


        ),
        body: RefreshIndicator(
          onRefresh: refresh,
          child: Container(
            padding: EdgeInsets.only(top: 20),
            child: SingleChildScrollView(
                child: Container(

                  child: Column(
                    children: [
                      Container(
                        height: height*0.80,
                        child: Container(
                            child: FutureBuilder<notificationModel>(
                                future: Notification(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<notificationModel> snapshot) {
                                  if (snapshot.hasData) {
                                    print("objectPrint" +
                                        snapshot.data!.data
                                            .toString());
                                    return
                                      Expanded(
                                        child: RefreshIndicator(
                                          onRefresh: refresh,
                                          child: ListView.builder(
                                            itemCount: snapshot
                                                .data!.data.length,
                                            itemBuilder: (context, index) {
                                              return Card(
                                                elevation: 8.0,
                                                margin: EdgeInsets.all(8.0),
                                                child: Column(

                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          margin: EdgeInsets.all(8.0),

                                                          width: 100,
                                                          height: 100,
                                                          decoration: BoxDecoration(
                                                            color: const Color(
                                                                0xfffcf6e0),

                                                            borderRadius: BorderRadius
                                                                .all(
                                                                Radius.circular(
                                                                    100.0)),
                                                            border: Border.all(
                                                              color: Colors.amber,
                                                              width: 2.0,
                                                            ),

                                                          ),
                                                          child: CircleAvatar(
                                                              backgroundColor: Color(
                                                                  0xfffcf6e0),

                                                              child: Image.asset(
                                                                "assets/images/notification_yellow.png",
                                                                height: 50,)),

                                                        ),
                                                        Container(

                                                          child: Expanded(
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment
                                                                  .start,
                                                              children: [

                                                                Text(
                                                                  '${snapshot.data!
                                                                      .data[index].title}',
                                                                  style: TextStyle(
                                                                      fontSize: 13,
                                                                      fontWeight: FontWeight
                                                                          .w900),),
                                                                SizedBox(height: 8,),
                                                                Row(
                                                                  children: [
                                                                    Image.asset(
                                                                      'assets/images/shift_time.png',
                                                                      height: 18,
                                                                      width: 20,),
                                                                    Text(
                                                                     ' ${snapshot.data!
                                                                        .data[index].created_at}',
                                                                      style: TextStyle(
                                                                          fontSize: 12,
                                                                          color: kPrimaryColor,
                                                                          fontWeight: FontWeight
                                                                              .w600),),
                                                                  ],
                                                                ),
                                                                Text(
                                                                  ' ${snapshot.data!
                                                                      .data[index].description}',
                                                                  style: TextStyle(
                                                                    fontSize: 12,),),
                                                                SizedBox(height: 8,),


                                                              ],
                                                            ),
                                                          ),
                                                        ),


                                                      ],
                                                    ),


                                                  ],
                                                ),
                                              );
                                            },
                                          ),
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
                                }
                                )
                        ),
                      )


                    ],
                  ),

                )
            ),
          ),
        )
    );
  }
  Future <void> refresh()
  async {
    setState(() {

    });
  }
  Future <notificationModel> Notification() async {
    String username = 'adiyogi';
    String password = 'adi12345';
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userid = preferences.getString("userid");
     id= userid.toString();
   // String id= "23";


    var respone;
    var res;
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    //  String? userid = preferences.getString("userid");
    //  String id= userid.toString();
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    print(basicAuth);
    String url = 'https://technolite.in/staging/777healthcare/api/my_notifications';
    //Map<String, String> queryParameter = {
   //   routeKey: routeGetCount,
  //  };

   // String queryString = Uri(queryParameters: queryParameter).query;
    var requestUrl = url + '/' + id +'/'+limit+'/'+offset;
    print(requestUrl);
    int i=1;
    if(i==1){
      respone = await http.get(Uri.parse (requestUrl)
        ,
        headers: <String, String>{'authorization': basicAuth},
      );

      var jasonDataOffer = jsonDecode(respone.body);
      if(respone.statusCode == 200){
        print('Response status: ${respone.statusCode}');

        return notificationModel.fromJson(jasonDataOffer);
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
      print('Response status1: ${respone.statusCode}');
      // res= jsonDecode(respone.body);
      var jasonDataOffer = jsonDecode(respone.body);
      return jasonDataOffer;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));
    }


  }


}
