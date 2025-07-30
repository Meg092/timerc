import 'package:get/get.dart';

import 'time_main_logic.dart';

class TimeMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TimeMainLogic());
  }
}
