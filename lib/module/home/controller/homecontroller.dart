import 'package:flutmlkit/application/basecontroller.dart';
import 'package:flutmlkit/application/route/approute.dart';
import 'package:get/get.dart';

class HomeController extends BaseController {
  void gotoFaceDetector() => Get.toNamed(AppRoute.facePage);
  void gotoTextRecognizer() => Get.toNamed(AppRoute.textPage);
}
