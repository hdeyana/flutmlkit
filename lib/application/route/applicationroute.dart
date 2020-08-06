import 'package:flutmlkit/application/route/approute.dart';
import 'package:flutmlkit/module/facedetector/screen/facedetectorscreen.dart';
import 'package:flutmlkit/module/home/screen/home.dart';
import 'package:flutmlkit/module/textrecognizer/screen/textrecognizerscreen.dart';
import 'package:get/get.dart';

class RouteApplication {
  static final getroute = <GetPage>[
    GetPage(name: AppRoute.homePage, page: () => Home()),
    GetPage(name: AppRoute.facePage, page: () => FaceDetectorScreen()),
    GetPage(name: AppRoute.textPage, page: () => TextRecognizerScreen()),
  ];
}
