import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:helath_care/screens/Splash.dart';
import 'package:provider/provider.dart';

import 'LocationServices/locationmodel.dart';
import 'LocationServices/services.dart';

void main(){
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return StreamProvider<UserLocation>(
      initialData: UserLocation(latitude: 334.5677,longitude: 23.7899),
        create: (context) => LocationService().locationStream,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Driver App",
          theme: ThemeData(
            fontFamily: 'Helvetica',
            scaffoldBackgroundColor: Color(0xffd5c8d5),
            //scaffoldBackgroundColor: Utils.scaffold_bg_color,
          ),
          home: Splashscreen(),
        )
    );
  }
}