import 'package:flutmlkit/application/route/approute.dart';
import 'package:flutmlkit/module/facedetector/screen/facedetectorscreen.dart';
import 'package:flutmlkit/module/home/screen/home.dart';
import 'package:get/get.dart';

class RouteApplication {
  static final getroute = <GetPage>[
    GetPage(name: AppRoute.homePage, page: () => Home()),
    GetPage(name: AppRoute.facePage, page: () => FaceDetectorScreen()),
  ];
}
