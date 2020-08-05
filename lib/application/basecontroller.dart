import 'package:get/state_manager.dart';

class BaseController extends GetxController {
  bool busy = false;

  setBusy(bool value) {
    busy = value;
    update();
  }
}
