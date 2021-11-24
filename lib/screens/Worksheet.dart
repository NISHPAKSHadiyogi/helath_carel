
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'dart:ui' as ui;
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:helath_care/Constant/Colors.dart';
import 'package:helath_care/screens/bottomBar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:http/http.dart' as http;
import 'Worksheetsubmit.dart';

class WorksheetScreen extends StatefulWidget {
  //const WorksheetScreen({Key? key}) : super(key: key);
  String jobid="";


  WorksheetScreen({required this.jobid});

  @override
  _WorksheetScreenState createState() => _WorksheetScreenState();
}

class _WorksheetScreenState extends State<WorksheetScreen> {
  GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();
  // ignore: prefer_typing_uninitialized_variables

  static TextEditingController reviewController = TextEditingController();
  static TextEditingController passController = TextEditingController();
  String rate="";
  String jobid1="";
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
  String break_time="";
  String total_work_time="";
  String start="";
  String end="";
  String check_in="";
  String check_out="";
  var  file1;
  late File f1;
  File? fds=File("");
  late   File?  file=null ;
  final ImagePicker _picker = ImagePicker();
  @override
  void initState() {
    // TODO: implement initState
    jobid1=widget.jobid==null?"":widget.jobid;
    jobDetail();
    setState(() {

    });
    super.initState();






  }

  var  bytes;
  var filePath;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,

        title: Text('Worksheet',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: Container(

          child: GestureDetector(
            onTap: (){
              Navigator.of(context).pop();

            },
            child: Icon(Icons.arrow_back_ios_rounded,color: Colors.white,),

          ),
        ),
      ),
        body: SingleChildScrollView(
        child: FutureBuilder<String>(
        future: jobDetail(),
    builder: (BuildContext context,
    AsyncSnapshot<String> snapshot) {
    print("objectPrint" +
    snapshot.error
        .toString());
    if (snapshot.data=="success") {

      return


        Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
      Text('${shift_start_time}AM To ${shift_end_time}PM', style: TextStyle(fontSize: 11),),
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
      children: [

      Container(

      padding:
      EdgeInsets.symmetric(horizontal: 7, vertical: 5),
      margin:
      EdgeInsets.only(left: 0,bottom: 5,right: 5),
      height: 30,
      decoration: ShapeDecoration(
      color: Colors.grey,
      shape: RoundedRectangleBorder(
      side: BorderSide(
      width: 1.0,
      style: BorderStyle.solid,
      color: kPrimaryColor,),
      borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      ),
      child: Text("Start Shift",
      style: TextStyle( color: Colors.white),),
      ),
      Container(
      padding:
      EdgeInsets.symmetric(horizontal: 7, vertical: 5),
      margin:
      EdgeInsets.only(left: 0,bottom: 5),
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
      child: Text("End  Shift", style: TextStyle( color: Colors.black),),
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
      /*
            Card(
              elevation: 5,
              margin: EdgeInsets.all(10),
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
                          width: size.width*0.6,
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
                                child: Wrap(
                                  children: [
                                    Image.asset('assets/images/location.png',
                                      height: 20,
                                      width: 20,),
                                    SizedBox(width: 5,),

                                    Text('Port Washington North,New York ', style: TextStyle(fontSize: 12),),


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
                                    Text('Shift Date :', style: TextStyle(fontSize: 12),),
                                    Text('14-09-2021', style: TextStyle(fontSize: 12),),
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
                                    Text('Shift Time :', style: TextStyle(fontSize: 12),),
                                   // Text('11:00 AM To 01:30 PM', style: TextStyle(fontSize: 12),),
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
                                  color: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1.0,
                                      style: BorderStyle.solid,
                                      color: Color(0xffc4c4c4),),
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
                  Wrap(
                 crossAxisAlignment: WrapCrossAlignment.start,

                    children: [
                      Container(
                        width: width*0.67,
                        child:
                        Wrap(



                        children: [
                          Container(
                            padding:EdgeInsets.all(2.8),
                            child: Text('Client Name :',
                              style: TextStyle(color: Colors.black,
                                  fontSize: 13,fontWeight: FontWeight.w600),),
                          ),

                          Container(
                            padding:EdgeInsets.all(2.8),
                            child: Text('Benjium William',
                              style: TextStyle(color: Colors.black, fontSize: 13),),
                          ),
                        ],
                      ),
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

             */
      Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),

      child: Wrap(
      children: [
      Text('Total Working Time :',
      style: TextStyle(color: kPrimaryColor,
      fontSize: 18,fontWeight: FontWeight.w600),),
      Text("",
      style: TextStyle(color: kPrimaryColor,
      fontSize: 18,fontWeight: FontWeight.w600),),
      ],
      ),
      ),
      Container(
      padding: EdgeInsets.symmetric(horizontal: 5),

      child: Wrap(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Container(

      padding: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
      color: Colors.grey.shade400,
      borderRadius: BorderRadius.all(
      Radius.circular(8)
      )
      ),
      child:Container(
      decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
      Radius.circular(5)
      )
      ),

      child: Column(
      children: [
      Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset('assets/images/checkin.png',
      width: width/4,
      height: width/10,
      ),
      ),
      Container(
      padding:EdgeInsets.all(2.8),
      child: Text('${check_in} AM',
      style: TextStyle(color: Colors.black,
      fontSize: 12,fontWeight: FontWeight.w600),),
      ),
      Container(
      padding:EdgeInsets.all(2.8),
      child: Text('Check In Time',
      style: TextStyle(color: Colors.black,
      fontSize: 12,fontWeight: FontWeight.w600),),
      ),
      ],
      ),
      ) ,
      ),
      Container(

      padding: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
      color: Colors.grey.shade400,
      borderRadius: BorderRadius.all(
      Radius.circular(8)
      )
      ),
      child:Container(
      decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
      Radius.circular(5)
      )
      ),

      child: Column(
      children: [
      Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset('assets/images/check_out.png',
      width: width/4,
      height: width/10,
      ),
      ),
      Container(
      padding:EdgeInsets.all(2.8),
      child: Text('${check_out} PM',
      style: TextStyle(color: Colors.black,
      fontSize: 12,fontWeight: FontWeight.w600),),
      ),
      Container(
      padding:EdgeInsets.all(2),
      child: Text('Check Out Time',
      style: TextStyle(color: Colors.black,
      fontSize: 12,fontWeight: FontWeight.w600),),
      ),
      ],
      ),
      ) ,
      ),
      Container(

      padding: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
      color: Colors.grey.shade400,
      borderRadius: BorderRadius.all(
      Radius.circular(8)
      )
      ),
      child:Container(
      decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
      Radius.circular(5)
      )
      ),

      child: Column(
      children: [
      Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset('assets/images/break_hr.png',
      width: width/4,
      height: width/10,
      ),
      ),
      Container(
      padding:EdgeInsets.all(2.8),
      child: Text('${break_time} AM',
      style: TextStyle(color: Colors.black,
      fontSize: 12,fontWeight: FontWeight.w600),),
      ),
      Container(
      padding:EdgeInsets.all(2.8),
      child: Text('  Break Hour ',
      style: TextStyle(color: Colors.black,
      fontSize: 12,fontWeight: FontWeight.w600),),
      ),
      ],
      ),
      ) ,
      ),
      ],
      ),
      ),
      Container(
      padding:EdgeInsets.all(10),
      child: Text('Client Review ',
      style: TextStyle(color: Colors.black,
      fontSize: 16,fontWeight: FontWeight.normal),),
      ),
      Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      height: 150,
      child: TextFormField(
      keyboardType: TextInputType.text,
      controller: reviewController,
      maxLines: 20,


      //maxLength: 10,
      cursorColor: Colors.blue,
      //validator: validateUsername,
      decoration: InputDecoration(
      labelStyle:
      TextStyle(color: Colors.black),

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
      padding:EdgeInsets.all(10),
      child: Text('Digital Signature',
      style: TextStyle(color: Colors.black,
      fontSize: 16,fontWeight: FontWeight.normal),),
      ),


    Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      height: 150,
      decoration: BoxDecoration(
      color: Colors.white,
      /*image: DecorationImage(
                  image: NetworkImage('http://i.imgur.com/QSev0hg.jpg'),
                  fit: BoxFit.cover,
                ),*/
      borderRadius: BorderRadius.all( Radius.circular(10.0)),
      border: Border.all(
      color: Colors.grey,
      width: 1.0,
      ),
      ),
      child: SfSignaturePad(
      key: _signaturePadKey,
      backgroundColor: Colors.grey[200],
      ),
      ),
        /*Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            /*image: DecorationImage(
                  image: NetworkImage('http://i.imgur.com/QSev0hg.jpg'),
                  fit: BoxFit.cover,
                ),*/
            borderRadius: BorderRadius.all( Radius.circular(10.0)),
            border: Border.all(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
          child: Image.file(fds!),
        ),


      FlatButton (
      child: Text("Upload"),
      onPressed:()  async {
        // ignore: unused_local_variable
        file1 = await _picker.pickImage(
            source: ImageSource.gallery,
            imageQuality: 100,
            maxWidth: 800,
            maxHeight: 600);
        f1 = File(file1.path);
        {
      /*  final data =
        await _signaturePadKey.currentState!.toImage(pixelRatio: 3.0);

        bytes = await data.toByteData(format: ui.ImageByteFormat.png);


        if (bytes
            .toString()
            .isNotEmpty) {
           fds = await writeToFileF(bytes);

       */

          /*

                                          ByteData? byteData = await (file1.toByteData(format: ui.ImageByteFormat.png) as FutureOr<ByteData?>);
                                          if (byteData != null) {
                                            final result =
                                            await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
                                            print("###############${result}");

                                           */
          setState(() {
            file = f1;
          });
          //  final directory = await getApplicationDocumentsDirectory();

          //  final String path =  directory.path;


          //

          //final String path = await getApplicationDocumentsDirectory());

// copy the file to a new path
          //   final File newImage = await f1.copy('${path}/file1.jpeg');


          //print("hi.......................................................${newImage.path}");


        }


        // selectImage();

      }),

         */

      Container(
      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 25),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      GestureDetector(
      onTap: (){
      rate="3";
      // Navigator.of(context).pop();

      },
      child:
      Column(
      children: [
      Image.asset('assets/images/happy.png',
      height: 50,
      width: 50,),
      Container(
      padding:EdgeInsets.all(10),
      child: Text('Happy ',
      style: TextStyle(color: Colors.black,
      fontSize: 16,fontWeight: FontWeight.normal),),
      ),
      ],
      )
      ),
      GestureDetector(
      onTap: (){
      rate="2";
      },
      child:
      Column(
      children: [
      Image.asset('assets/images/normal.png',
      height: 50,
      width: 50,),
      Container(
      padding:EdgeInsets.all(10),
      child: Text('Normal',
      style: TextStyle(color: Colors.black,
      fontSize: 16,fontWeight: FontWeight.normal),),
      ),
      ],
      )),

      Column(
      children: [
      GestureDetector(
      onTap: (){
      // Navigator.of(context).pop();
      rate="1";
      },
      child:
      Image.asset('assets/images/sad.png',
      height: 50,
      width: 50,)),
      Container(
      padding:EdgeInsets.all(10),
      child: Text('Sad ',
      style: TextStyle(color: Colors.black,
      fontSize: 16,fontWeight: FontWeight.normal),),
      ),
      ],
      ),
      ],
      ),
      ),
      Container(
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      width: size.width * 0.95,
      child: ClipRRect(
      borderRadius: BorderRadius.circular(5),
      // ignore: deprecated_member_use
      child: FlatButton(
      padding: EdgeInsets.symmetric(
      vertical: 20, horizontal: 20),
      color: kPrimaryColor,
      onPressed: ()  async {

      final data =
      await _signaturePadKey.currentState!.toImage(pixelRatio: 3.0);

      bytes = await data.toByteData(format: ui.ImageByteFormat.png);


      if (bytes
          .toString()
          .isNotEmpty) {
      fds = await writeToFileF(bytes);}

/*
      final data =
      await _signaturePadKey.currentState!.toImage(pixelRatio: 3.0);

     bytes = await data.toByteData(format: ui.ImageByteFormat.png);


      if(bytes.toString().isNotEmpty){
      File? f1= await writeToFileF(bytes);

 */


      client_review_rating_sign(fds);




      },
      child: Center(
      child: Text(
      "SAVE",
      style:
      TextStyle(color: Colors.white, fontSize: 15),
      ),
      ),
      ),
      ),
      ),


      ],
      );

    }
    else{return SizedBox();}
        })
      ),
    );
  }
  Future<File?> writeToFileF(ByteData data) async {
    var rng = new Random();
    final buffer = data.buffer;
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
     filePath = tempPath + '/file_01.jpeg'; // file_01.tmp is dump file, can be anything
    File F1= await new File('$filePath').writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
    final targetPath = tempPath+ "/temp.jpg";
    return  await testCompressAndGetFile(F1, targetPath);


  }

  Future<void> client_review_rating_sign(File? file) async {
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
    String url = 'https://technolite.in/staging/777healthcare/api/client_review_rating_sign';
    //Map<String, String> queryParameter = {
    //   routeKey: routeGetCount,
    //  };

    // String queryString = Uri(queryParameters: queryParameter).query;
    var requestUrl = url ;
    int i=0;
    if(i==0){
   // var serverReceiverPath="https://technolite.in/staging/777healthcare/api/update_profile";
    var request = http.MultipartRequest('POST', Uri.parse(requestUrl));
    request.files.add(await http.MultipartFile.fromPath('file', fds!.path));
    request.fields.addAll({
      'job_id':jobid1,
      'employee_id':id,
      'client_review':reviewController.text,

      'client_rate':rate,
      'client_name':client_name,
      'client_designation':"hr",
      //  'fcm_id':'dfgdfgdfg',
      //  'device_id':'fhfghfghh',
    });
    request.headers.addAll({'authorization': basicAuth,
      'Content-Type':"application/x-www-form-urlencoded",});
    print('Response status3a:${requestUrl}----${jobid1}----${reviewController.text}---${rate}--${client_name} ---${id} ');

    var respone = await request.send();
    final respStr = await respone.stream.bytesToString();




    print('Response status3a:${filePath}');
      var res = jsonDecode(respStr);
      if(respone.statusCode == 200){
        //  print('Response status3: ${jasonDataOffer["data"]["job_name"]}');
        print('Response status3a:${requestUrl}');
        print('Response status: ${respStr}');
        /* job_name=jasonDataOffer["data"]["job_name"];
        client_name=jasonDataOffer["data"]["client_name"];
        shift_date=jasonDataOffer["data"]["shift_date"];
        shift_start_time=jasonDataOffer["data"]["shift_start_time"];
        shift_end_time=jasonDataOffer["data"]["shift_end_time"];
        address=jasonDataOffer["data"]["address"];

        */


        //  return siftDetailModel.fromJson(jasonDataOffer);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return bottomBar(bottom: 12, jobid: jobid1);
            },
          ),
        );


        //  print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');
        // Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen()));


      }else{
        print('Response statusp: ${respone.statusCode}');
        //  print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');

        // res= jsonDecode(respone.body);
        var jasonDataOffer = jsonDecode(respStr);
        // return jasonDataOffer;
        print('Response status: ${res["message"]}');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));
      }

    }

    else{
      print('Response statusp1: ${respone.statusCode}');
      // res= jsonDecode(respone.body);
   //   var jasonDataOffer = jsonDecode(respone.body);
      //  return jasonDataOffer;
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
   // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('loading...')));


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
      respone  =  await http.post(Uri.parse(url),
        headers: <String, String>{'authorization': basicAuth,
          'Content-Type':"application/x-www-form-urlencoded",},
        body: ({
          'job_id':jobid1,

          'employee_id':id,




        }),);

      var jasonDataOffer = jsonDecode(respone.body);

      if(respone.statusCode == 200){
        var jasonDataOffer = jsonDecode(respone.body);
   //     print('Response status:  ${jasonDataOffer["data"]["username"]}');
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
        total_work_time=jasonDataOffer["data"]["total_work_time"];
        break_time=jasonDataOffer["data"]["break_time"];



        if(job_status=="0")
        {
          job_status="pending";
        }
        if(job_status == "1")
        {
          job_status="process";
        }
        if(job_status == "2"){ job_status="complate";}
        if(check_in=="0")
        {
          start="0";
        }
        if(check_out=="0"){end="0";}






        jasonDataOffer = jsonDecode(respone.body);
      //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${jasonDataOffer["message"]}')));
        return ("success");


        //  print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');
        // Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen()));
        //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password Changed  Successfully.!!')));

      }else{
        print('Response status: ${respone.statusCode}');
        //  print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');

        // res= jsonDecode(respone.body);
        var jasonDataOffer = jsonDecode(respone.body);
        //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${jasonDataOffer["message"]}')));
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
  Future<File?> testCompressAndGetFile(File file, String targetPath) async {
    print("testCompressAndGetFile");
    final result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: 50,
      minWidth: 100,
      minHeight: 100,
      rotate: 90,
    );

    print(file.lengthSync());
    print(result?.lengthSync());

    return result;
  }
}
