import 'dart:convert';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_html/flutter_html.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:helath_care/Api/Models/typeModel.dart';
import 'package:helath_care/Constant/Colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_html/flutter_html.dart';

import 'Home.dart';
import 'package:http/http.dart' as http;

class faqscreen extends StatefulWidget {

  int _counter = 0;
  bool showRaisedButtonBadge = true;

  @override
  _faqscreenState createState() =>  _faqscreenState();
}

class  _faqscreenState extends State<faqscreen> {
  @override
  Widget build(BuildContext context) {
     double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(

          title: Text("FAQ", style: TextStyle(fontSize: 20, color:Colors.white),),
          backgroundColor: kPrimaryColor,
          centerTitle: true,

        ),
        body: RefreshIndicator(
          onRefresh: refresh,
          child: Container(
            padding: EdgeInsets.only(top: 20),
            child: SingleChildScrollView(
              child: Container(
                height: height*0.80,
                child: Column(
                  children:[
    Container(

    child: Container(
    child: FutureBuilder<TypeModel>(
    future: Faq(),
    builder: (BuildContext context, AsyncSnapshot<TypeModel> snapshot) {

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

                      child: Container(
                        //padding: EdgeInsets.only(left: 5),
                        color: Colors.white,
                        child: Column(
                          children: [

                            ExpansionTile(


                              title: Container(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '${snapshot.data!
                                    .data[index].question}',
                                  style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold,
                                    fontSize: 15,

                                  ),

                                  textAlign: TextAlign.start,
                                ),
                              ),
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 20, bottom: 10),
                                  child:  Html(
                                      data:snapshot.data!
                                          .data[index].answer),
                                 ),

                              ],
                            ),
                          ],
                        ),
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

              return Center(child: SizedBox(
                 child: Text("Loading..."),),) ;
            }
      }
    }),
    )
    )


                  ],
                ),
              ),

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
  Future <TypeModel> Faq() async {
    String username = 'adiyogi';
    String password = 'adi12345';
    var respone;
    var res;
   // SharedPreferences preferences = await SharedPreferences.getInstance();
  //  String? userid = preferences.getString("userid");
  //  String id= userid.toString();
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    print(basicAuth);
    int i=1;
    if(i==1){
      respone = await http.get(Uri.parse ('https://technolite.in/staging/777healthcare/api/get_faq')
        ,
        headers: <String, String>{'authorization': basicAuth},
      );

      var jasonDataOffer = jsonDecode(respone.body);
      if(respone.statusCode == 200){
        print('Response status: ${respone.statusCode}');

        return TypeModel.fromJson(jasonDataOffer);
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
