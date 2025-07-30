import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimeSettingLogic extends GetxController {


  DateTime destinationTime = Get.arguments;
  var appStartUp = true.obs;
  var skipSplashScreen = true.obs;
  var appVersion = '1.0.0'.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    appStartUp.value = prefs.getBool('appStartUp') ?? true;
    skipSplashScreen.value = prefs.getBool('skipSplashScreen') ?? true;
    var info = await PackageInfo.fromPlatform();
    appVersion.value = info.version;
    super.onInit();
  }

}
