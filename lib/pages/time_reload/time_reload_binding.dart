import 'package:get/get.dart';

import 'time_reload_logic.dart';

class TimeReloadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TimeReloadLogic());
  }
}
