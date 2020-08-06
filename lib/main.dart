import 'package:flutmlkit/application/route/applicationroute.dart';
import 'package:flutmlkit/module/home/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'flutml',
      theme: ThemeData(
        primaryColor: Color(0xff0B2C66),
        accentColor: Color(0xffCDDC39),
        canvasColor: Colors.grey[50],
        textTheme: GoogleFonts.ibmPlexSansTextTheme(),
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          elevation: 0,
          color: Colors.grey[50],
          iconTheme: IconThemeData(
            color: Color(0xffCDDC39),
          ),
          textTheme: TextTheme(
            headline6: GoogleFonts.ibmPlexSerif().copyWith(color: Color(0xff0B2C66), fontSize: 18),
          ),
        ),
      ),
      getPages: RouteApplication.getroute,
      home: Home(),
    );
  }
}
