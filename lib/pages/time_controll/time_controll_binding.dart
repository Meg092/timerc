import 'package:get/get.dart';

import 'time_controll_logic.dart';

class TimeControllBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      TimeControllLogic(),
      permanent: true,
    );
  }
}
