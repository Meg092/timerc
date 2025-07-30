import 'package:get/get.dart';

import 'time_setting_logic.dart';

class TimeSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TimeSettingLogic());
  }
}
