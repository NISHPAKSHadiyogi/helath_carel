import 'dart:async';
import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter

import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:helath_care/Constant/Colors.dart';
import 'package:helath_care/screens/bottomBar.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui' as ui;
import 'Home.dart';

class ProfileScreen extends StatefulWidget {

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}


@override
class _ProfileScreenState extends State<ProfileScreen> {
  static TextEditingController usernameController = TextEditingController();
  static TextEditingController lastnameController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController phoneController = TextEditingController();
  static TextEditingController phoneController1 = TextEditingController();
  static TextEditingController phoneController2 = TextEditingController();
  static TextEditingController phoneControllerpin = TextEditingController();

  bool hidepassword = true;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  SharedPreferences? preferences;
  FocusNode focusNode = new FocusNode();
  var image;
  var  file1;
  String id="";
  //var file2;
  bool progress = false;
  late   File?  file=File("assets/images/user.png") ;
  List<XFile>? _imageFileList;
  final ImagePicker _picker = ImagePicker();
  String selectedSpinnerItem = 'Eliseo@gardner.biz';
  String contry="";
 // late List data ;
  int _value = 1;
     Map yourJson={
     "status": true,
     "message": "success",
     "data":  [
         {"idattribute": "2", "attrName": "United Kingdom"},
         {"idattribute": "1", "attrName": "USA"}
       ]

   };



  late List<DropdownMenuItem<int>> _menuItems;
  @override
  void initState() {
    List dataList = yourJson["data"];
    _menuItems = List.generate(

      dataList.length,
          (i) => DropdownMenuItem(
        value: int.parse(dataList[i]["idattribute"]),
        child: Text("${dataList[i]["attrName"]}"),
      ),
    );
   userdetail();

   Faq();



super.initState();
  }




  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;
   // Size size = MediaQuery.of(context).size;
    return Scaffold(


        body: SingleChildScrollView(

          child:
          Column(


              children: [
                Container(
                    height:height*0.5,
                    width: width,
                    child:



                    Stack(
                      fit: StackFit.expand,
                      overflow: Overflow.visible,

                      alignment: Alignment.center,
                      children: <Widget>[
                        Positioned(
                          width: size.width,
                          top: 0,
                          child: Image.asset(
                            "assets/images/shape.png",
                            width: size.width * .7,

                          ),
                        ),
                        Positioned(
                            top: 70,
                            child: Container(
                              width: size.width * 0.9,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) =>bottomBar(bottom: 2, jobid: id)));
                                    },
                                    child: Container(
                                      child: Icon(Icons.arrow_back_ios_rounded,color: Colors.white,),
                                    ),
                                  ),
                                  Container(
                                    child: Text("Update profile",style: TextStyle(color:Colors.white,fontSize: 18),),
                                  ),
                                  Container(
                                    color: Colors.red,
                                    width: 50,
                                  )
                                ],
                              ),
                            )
                        ),
                        Positioned(
                          width: size.width * 0.5,

                          top: 180,
                          // ignore: unnecessary_new
                          child: new Column(
                            children: <Widget>[
                              new Stack(fit: StackFit.loose, children: <
                                  Widget>[
                                new Row(

                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Container(
                                        width: 150.0,
                                        height: 150.0,
                                        decoration: BoxDecoration(
                                          // color: BackColorCard,
                                          color: ksecondaryColor.withOpacity(.5),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey.shade200
                                                    .withOpacity(.1),
                                                blurRadius: 4,
                                                spreadRadius: 3)
                                          ],
                                          border: Border.all(
                                            width: 1.3,
                                            color: Colors.white.withOpacity(.5),
                                          ),
                                          borderRadius: BorderRadius.circular(80.0),
                                        ),
                                        padding: EdgeInsets.all(5),
                                        child:
                                        Container(
                                            width: 150.0,
                                            height: 150.0,

                                            decoration: new BoxDecoration(
                                              // shape: BoxShape.circle,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey.shade200
                                                        .withOpacity(.1),
                                                    blurRadius: 4,
                                                    spreadRadius: 3)
                                              ],
                                              border: Border.all(
                                                width: 1.3,
                                                color: Colors.grey.withOpacity(.5),
                                              ),
                                              borderRadius: BorderRadius.circular(80.0),

                                            ),
                                            child:
                                                image == null?

                                                CircleAvatar(
                                                  backgroundColor: Colors.grey.shade50,
                                                    radius: 80,

                                                    backgroundImage:FileImage(file!),

                                                   // child: Image.file(File(file!.path),fit: BoxFit.fill, ),
                                                      //Image.asset(file!.path, fit: BoxFit.fill),



                                            ):
                                                    CircleAvatar(
                                                        radius: 80,

                                                      backgroundImage:NetworkImage(image),
                                                         // child: Image.network(image,fit: BoxFit.fill, ),
                                                          //Image.asset(file!.path, fit: BoxFit.fill),



                                                ),
                                        )
                                    ),
                                  ],
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: 60.0, left: 130.0),
                                    child:  Row(


                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[

                                        FittedBox(
                                            fit: BoxFit.fill,

                                            child:

                                            Container(
                                                width: 30,

                                                child:

                                                GestureDetector(
                                                  child: new CircleAvatar(
                                                    backgroundColor:
                                                    ksecondaryColor,
                                                    radius: 18.0,
                                                    child: new Icon(

                                                      Icons.camera_alt,
                                                      color: Colors.white,


                                                    ),
                                                  ),
                                                  onTap: ()
                                                  async {
                                                    image=null;
                                                    // ignore: unused_local_variable
                                                    file1 = await _picker.pickImage(
                                                        source: ImageSource.gallery ,imageQuality: 100,maxWidth:800,maxHeight:600);
                                                    File f1= File(file1.path);
                                                   // file2=null;
                                                    /*

                                          ByteData? byteData = await (file1.toByteData(format: ui.ImageByteFormat.png) as FutureOr<ByteData?>);
                                          if (byteData != null) {
                                            final result =
                                            await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
                                            print("###############${result}");

                                           */
                                                    setState(()  {

                                                      file = f1;

                                                      //  final directory = await getApplicationDocumentsDirectory();

                                                      //  final String path =  directory.path;




                                                      //

                                                      //final String path = await getApplicationDocumentsDirectory());

// copy the file to a new path
                                                      //   final File newImage = await f1.copy('${path}/file1.jpeg');


                                                      //print("hi.......................................................${newImage.path}");

                                                    });

                                                  },
                                                  // selectImage();

                                                )
                                            )
                                        )
                                        ,
                                      ],
                                    )),
                              ])
                            ],
                          ),
                        ),
                      ],


                    )
                ),
                Container(
                  width:width,
                  padding: EdgeInsets.all(0),
                  height:height*0.8,
                  child:
                  Form(
                    key: formkey,

                    child:

                    Column(
                      children: [



                        Container(
                          height: size.height * 0.05,
                          width: size.width * 0.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0.5),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.grey, spreadRadius: 0.5),
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: size.height * 0.06,
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(
                                      color: Colors.grey,
                                      width: size.width * 0.0025,
                                    ),
                                  ),
                                ),
                                child: Image.asset(
                                  'assets/images/uprofile.png',
                                  height: 20,
                                  width: 25,
                                ),
                              ),
                              Container(
                                width: size.width * 0.60,
                                padding: EdgeInsets.only(left: 10),
                                child: TextFormField(
                                  controller: usernameController,

                                  decoration: InputDecoration(
                                    hintText: "User First Name",

                                    //labelText: firstName,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    enabled: true,
                                    hintStyle: TextStyle(
                                        color: Colors.grey.shade400, fontSize: 15),
                                    counterStyle: TextStyle(
                                      height: double.minPositive,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: size.height * 0.05,
                          width: size.width * 0.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0.5),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.grey, spreadRadius: 0.5),
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: size.height * 0.06,
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(
                                      color: Colors.grey,
                                      width: size.width * 0.0025,
                                    ),
                                  ),
                                ),
                                child: Image.asset(
                                  'assets/images/uprofile.png',
                                  height: 20,
                                  width: 25,
                                ),
                              ),
                              Container(
                                width: size.width * 0.60,
                                padding: EdgeInsets.only(left: 10),
                                child: TextFormField(
                                  controller: lastnameController,
                                  decoration: InputDecoration(
                                    hintText: "User Last Name",
                                    //labelText: firstName,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    enabled: true,
                                    hintStyle: TextStyle(
                                        color: Colors.grey.shade400, fontSize: 15),
                                    counterStyle: TextStyle(
                                      height: double.minPositive,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: size.height * 0.05,
                          width: size.width * 0.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0.5),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.grey, spreadRadius: 0.5),
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: size.height * 0.06,
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(
                                      color: Colors.grey,
                                      width: size.width * 0.0025,
                                    ),
                                  ),
                                ),
                                child: Image.asset(
                                  'assets/images/mail_clr.png',
                                  height: 20,
                                  width: 25,
                                ),
                              ),
                              Container(
                                width: size.width * 0.60,
                                padding: EdgeInsets.only(left: 10),
                                child: TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    hintText: "Email id",
                                    //labelText: firstName,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    enabled: true,
                                    hintStyle: TextStyle(
                                        color: Colors.grey.shade400, fontSize: 15),
                                    counterStyle: TextStyle(
                                      height: double.minPositive,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: size.height * 0.05,
                          width: size.width * 0.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0.5),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.grey, spreadRadius: 0.5),
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: size.height * 0.06,
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(
                                      color: Colors.grey,
                                      width: size.width * 0.0025,
                                    ),
                                  ),
                                ),
                                child: Image.asset(
                                  'assets/images/contact_b.png',
                                  height: 20,
                                  width: 25,
                                ),
                              ),
                              Container(
                                width: size.width * 0.60,
                                padding: EdgeInsets.only(left: 10),
                                child: TextFormField(
                                  controller: phoneController,
                                  decoration: InputDecoration(
                                    hintText: "Phone No.",
                                    //labelText: firstName,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    enabled: true,
                                    hintStyle: TextStyle(
                                        color: Colors.grey.shade400, fontSize: 15),
                                    counterStyle: TextStyle(
                                      height: double.minPositive,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Container(
                          height: size.height * 0.05,
                          width: size.width * 0.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0.5),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.grey, spreadRadius: 0.5),
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: size.height * 0.06,
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(
                                      color: Colors.grey,
                                      width: size.width * 0.0025,
                                    ),
                                  ),
                                ),
                                child: Image.asset(
                                  'assets/images/current_location.png',
                                  height: 20,
                                  width: 25,
                                ),
                              ),
                              Container(
                                width: size.width * 0.60,
                                padding: EdgeInsets.only(left: 10),
                                child: TextFormField(
                                  controller: phoneController1,
                                  decoration: InputDecoration(
                                    hintText: "town",
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    enabled: true,
                                    hintStyle: TextStyle(
                                        color: Colors.grey.shade400, fontSize: 15),
                                    counterStyle: TextStyle(
                                      height: double.minPositive,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),

                        Container(
                          height: size.height * 0.05,
                          width: size.width * 0.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0.5),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.grey, spreadRadius: 0.5),
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: size.height * 0.06,
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(
                                      color: Colors.grey,
                                      width: size.width * 0.0025,
                                    ),
                                  ),
                                ),
                                child: Image.asset(
                                  'assets/images/current_location.png',
                                  height: 20,
                                  width: 25,
                                ),
                              ),
                              Container(
                                width: size.width * 0.60,
                                padding: EdgeInsets.only(left: 10),
                                child: TextFormField(
                                  controller: phoneControllerpin,
                                  decoration: InputDecoration(
                                    hintText: "Pin code",
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    enabled: true,
                                    hintStyle: TextStyle(
                                        color: Colors.grey.shade400, fontSize: 15),
                                    counterStyle: TextStyle(
                                      height: double.minPositive,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: size.height * 0.05,
                          width: size.width * 0.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0.5),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.grey, spreadRadius: 0.5),
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: size.height * 0.06,
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(
                                      color: Colors.grey,
                                      width: size.width * 0.0025,
                                    ),
                                  ),
                                ),
                                child: Image.asset(
                                  'assets/images/current_location.png',
                                  height: 20,
                                  width: 25,
                                ),
                              ),
                              Container(
                                width: size.width * 0.70,
                                padding: EdgeInsets.only(left: 10),
                                child:DropdownButton<int>(

                                  items: _menuItems,
                                  value: _value,
                                  onChanged: ( value) {
                                    setState(() {
                                      _value != value;
                                      contry=value.toString();

                                    });
                                  },
                                  /*TextFormField(
                                controller: phoneController2,
                                decoration: InputDecoration(
                                  hintText: "country",
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  enabled: true,
                                  hintStyle: TextStyle(
                                      color: Colors.grey.shade400, fontSize: 15),
                                  counterStyle: TextStyle(
                                    height: double.minPositive,
                                  ),

                               */
                                ),

                              )
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: size.width * 0.95,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            // ignore: deprecated_member_use
                            child: FlatButton(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              color: kPrimaryColor,
                              onPressed: () {
                                UpDate(file!.path);
                                /* var bottom =0;
                              Timer(
                                Duration(seconds: 5),
                                    () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => bottomBar(bottom: bottom,),
                                  ),
                                ),
                              );*/
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "CONFIRM",
                                    style:
                                    TextStyle(color: Colors.white, fontSize: 15),
                                  ),
                                  Image.asset(
                                    'assets/images/next.png',
                                    height: 20,
                                    width: 25,
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),
                )
              ]
          )

        ));
  }

  Future<String?> uploadImage(filename) async {
    var serverReceiverPath="";
    var request = http.MultipartRequest('POST', Uri.parse(serverReceiverPath));
    request.files.add(await http.MultipartFile.fromPath('picture', filename));
    var res = await request.send();
    return res.reasonPhrase;
  }


  Future <void> UpDate(filename) async {
    EasyLoading.show(status: 'loading...');
    EasyLoading.instance.dismissOnTap;
    String username = 'adiyogi';
    String password = 'adi12345';
    var respone;
    var res;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userid = preferences.getString("userid");
    String? username1 = preferences.getString("username");
    username1= username1.toString();
   id= userid.toString();
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    print(basicAuth);


    int i=1;
    if(file!.path!="assets/images/user.png"){
     // var stream = new http.ByteStream(DelegatingStream.typed(file!.openRead()));
      // get file length
     // var length = await file!.length();
      var serverReceiverPath="https://technolite.in/staging/777healthcare/api/update_profile";
      var headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Basic YWRpeW9naTphZGkxMjM0NQ==',
        'Cookie': 'session=ast0si4p300t40g33g2m6k2cv90kdrpu'
      };
      var request = http.MultipartRequest('POST', Uri.parse('https://technolite.in/staging/777healthcare/api/update_profile'));
      request.fields.addAll({
        'id': id,
        'firstname':usernameController.text ,
        'lastname': lastnameController.text,
        'email': emailController.text,
        'mobile_no': phoneController.text,
        'country': contry,
        'town': phoneController1.text,
        'pincode': phoneControllerpin.text,
        'username': username1,
        'image':"",
      });
      request.files.add(await http.MultipartFile.fromPath('image', file!.path));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
/*
      var request = http.MultipartRequest('POST', Uri.parse(serverReceiverPath));
      request.files.add(await http.MultipartFile( 'image',
        file!.readAsBytes().asStream(),
        file!.lengthSync(),
        filename: basename(file!.path),

        ));
      request.fields.addAll({
        'id': "25",
        'firstname': "dhfh",
        'lastname': "sdhjh",
        'email':"abc@gmail.com",
        'mobile_no':"9999999999",
        'country':"99",
        'town':"fhdsj",
        'username':"demo1",
        'image':file!.path,
        //  'fcm_id':'dfgdfgdfg',
        //  'device_id':'fhfghfghh',
      });
      request.headers.addAll({'authorization': basicAuth,
        'Content-Type':"application/x-www-form-urlencoded",});

      var respone = await request.send();

 */
      final respStr = await response.stream.bytesToString();
      res= jsonDecode(respStr);
      /*
      respone = await http.post(Uri.parse ('https://technolite.in/staging/777healthcare/api/update_profile')
        ,
        headers: <String, String>{'authorization': basicAuth},
        body: ({
          'id': id,
          'old_password': usernameController.text,
          'new_password': lastnameController.text,
          'confrim_password':emailController.text,
          'confrim_password':phoneController.text,
          //  'fcm_id':'dfgdfgdfg',
          //  'device_id':'fhfghfghh',


        })
        ,
      );

     */
      print('Response status: ${res["message"]}');

      if(response.statusCode == 200){
        print('Response status: ${userid} ${usernameController.text}  ${lastnameController.text}  ${emailController.text}');
       // Navigator.push(context, MaterialPageRoute(builder: (context) =>  Homescreen()));
        //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));
        Fluttertoast.showToast(
          backgroundColor: Colors.green,
          msg: "${res["message"]}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,

        );
        EasyLoading.dismiss();
      }else{
        print('Response status: ${response.statusCode}');
        print('Response status: ${userid} ${usernameController.text}  ${lastnameController.text}  ${emailController.text}');
        print('Response ########: ${file!.path}');
       res= jsonDecode(respStr);
        print('Response status: ${res["message"]}');
        Fluttertoast.showToast(
          backgroundColor: Colors.red,
            msg: "${res["message"]}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,);
      }
      EasyLoading.dismiss();

    }

    else{
      var serverReceiverPath="https://technolite.in/staging/777healthcare/api/update_profile";
      var headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Basic YWRpeW9naTphZGkxMjM0NQ==',
        'Cookie': 'session=ast0si4p300t40g33g2m6k2cv90kdrpu'
      };
      var request = http.MultipartRequest('POST', Uri.parse('https://technolite.in/staging/777healthcare/api/update_profile'));
      request.fields.addAll({
        'id': id,
        'firstname':usernameController.text ,
        'lastname': lastnameController.text,
        'email': emailController.text,
        'mobile_no': phoneController.text,
        'country': contry,
        'town': phoneController1.text,
        'pincode': phoneControllerpin.text,
        'username': username1,

      });
      //request.files.add(await http.MultipartFile.fromPath('image', file!.path));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
/*
      var request = http.MultipartRequest('POST', Uri.parse(serverReceiverPath));
      request.files.add(await http.MultipartFile( 'image',
        file!.readAsBytes().asStream(),
        file!.lengthSync(),
        filename: basename(file!.path),

        ));
      request.fields.addAll({
        'id': "25",
        'firstname': "dhfh",
        'lastname': "sdhjh",
        'email':"abc@gmail.com",
        'mobile_no':"9999999999",
        'country':"99",
        'town':"fhdsj",
        'username':"demo1",
        'image':file!.path,
        //  'fcm_id':'dfgdfgdfg',
        //  'device_id':'fhfghfghh',
      });
      request.headers.addAll({'authorization': basicAuth,
        'Content-Type':"application/x-www-form-urlencoded",});

      var respone = await request.send();

 */
      final respStr = await response.stream.bytesToString();
      res= jsonDecode(respStr);
      /*
      respone = await http.post(Uri.parse ('https://technolite.in/staging/777healthcare/api/update_profile')
        ,
        headers: <String, String>{'authorization': basicAuth},
        body: ({
          'id': id,
          'old_password': usernameController.text,
          'new_password': lastnameController.text,
          'confrim_password':emailController.text,
          'confrim_password':phoneController.text,
          //  'fcm_id':'dfgdfgdfg',
          //  'device_id':'fhfghfghh',


        })
        ,
      );

     */
      print('Response status: ${res["message"]}');

      if(response.statusCode == 200){
        print('Response status: ${userid} ${usernameController.text}  ${lastnameController.text}  ${emailController.text}');
        // Navigator.push(context, MaterialPageRoute(builder: (context) =>  Homescreen()));
        //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));
        Fluttertoast.showToast(
          backgroundColor: Colors.green,
          msg: "${res["message"]}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,

        );
        EasyLoading.dismiss();
      }else{
        print('Response status: ${response.statusCode}');
        print('Response status: ${userid} ${usernameController.text}  ${lastnameController.text}  ${emailController.text}');
        print('Response ########1: ${file!.path}');
        res= jsonDecode(respStr);
        var data=res["data"].split("\n");
        var data1=data[0].split("<p>");
        var data2=data1[1].split("</p>");

        print('Response status: ${res["message"]}');
        Fluttertoast.showToast(
          backgroundColor: Colors.red,
          msg: data2[0],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,);
      }
      EasyLoading.dismiss();
      // res= jsonDecode(respone.body);
    //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));
    }


  }

  Future<void>  Faq() async {
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
      respone = await http.get(Uri.parse ('https://technolite.in/staging/777healthcare/api/get_countries')
        ,
        headers: <String, String>{'authorization': basicAuth},
      );

      var jasonDataOffer = jsonDecode(respone.body);
      if(respone.statusCode == 200){
        var jasonDataOffer = jsonDecode(respone.body);
        print('Response status1#####1: ${jasonDataOffer}');
        contry=jasonDataOffer["data"][0]["id"];

setState(() {
  var jasonDataOffer = jsonDecode(respone.body);
  yourJson=jasonDataOffer;
});
        List dataList = yourJson["data"];

        _menuItems = List.generate(

          dataList.length,
              (i) => DropdownMenuItem(
            value: int.parse(dataList[i]["is_active"]),
            child: Text("${dataList[i]["name"]}"),
          ),
        );
        print('#######${yourJson}');

       // return "jasonDataOffer";
        //  print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');
        // Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen()));
        //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password Changed  Successfully.!!')));

      }else{
        print('Response status: ${respone.statusCode}');
        //  print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');

        // res= jsonDecode(respone.body);
        var jasonDataOffer = jsonDecode(respone.body);
        //return "jasonDataOffer";
        print('Response status: ${res["message"]}');
        //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));
      }

    }

    else{
      print('Response status: ${respone.statusCode}');
      // res= jsonDecode(respone.body);
      var jasonDataOffer = jsonDecode(respone.body);
     // return "jasonDataOffer";
      //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));
    }


  }
  Future<String>  userdetail() async {
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
    String url ='https://technolite.in/staging/777healthcare/api/user';
    String requrl=url +'/'+id;
    int i=1;
    if(i==1){
      respone = await http.get(Uri.parse (requrl)
        ,
        headers: <String, String>{'authorization': basicAuth},
      );

      var jasonDataOffer = jsonDecode(respone.body);
      if(respone.statusCode == 200){
        var jasonDataOffer = jsonDecode(respone.body);
        print('Response status1: ${jasonDataOffer}');
        setState(() {
          var jasonDataOffer = jsonDecode(respone.body);
          usernameController.text=jasonDataOffer["data"]["firstname"];
          lastnameController.text=jasonDataOffer["data"]["lastname"];
          emailController.text=jasonDataOffer["data"]["email"];
          phoneController.text=jasonDataOffer["data"]["mobile_no"];
          phoneController1.text=jasonDataOffer["data"]["town"];
          image =jasonDataOffer["data"]["image"];
          // if(file==null )
//          print("######");
          // print(file2);


        });

        return "success";
        //  print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');
        // Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen()));
        //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password Changed  Successfully.!!')));

      }else{
        print('Response status: ${respone.statusCode}');
        //  print('Response status: ${userid} ${oldpassController.text}  ${newpassController.text}  ${cnfpassController.text}');

        // res= jsonDecode(respone.body);
        var jasonDataOffer = jsonDecode(respone.body);
        return "jasonDataOffer";
        print('Response status: ${res["message"]}');
        //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));
      }

    }

    else{
      print('Response status: ${respone.statusCode}');
      // res= jsonDecode(respone.body);
      var jasonDataOffer = jsonDecode(respone.body);
       return "jasonDataOffer";
      //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${res["message"]}')));
    }


  }


}




