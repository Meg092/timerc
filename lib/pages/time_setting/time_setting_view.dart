import 'package:flutter/material.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:styled_widget/styled_widget.dart';

import 'time_setting_logic.dart';

class TimeSettingPage extends GetView<TimeSettingLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text(
          'Setting',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: <Widget>[
                Container(
                  width: double.infinity,
                  height: 53,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: <Widget>[
                    const Text(
                      'BTTF clock on app startup',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Obx(() {
                      return Switch(
                          activeTrackColor: Colors.green,
                          value: controller.appStartUp.value,
                          onChanged: (v) async {
                            controller.appStartUp.value = v;
                            final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                            await prefs.setBool('appStartUp', v);
                          });
                    })
                  ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
                )
                    .decorated(
                    color: const Color(0xff333333),
                    borderRadius: BorderRadius.circular(10))
                    .marginOnly(bottom: 10),
                Container(
                  width: double.infinity,
                  height: 53,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: <Widget>[
                    const Text(
                      'Skip splash screen',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Obx(() {
                      return Switch(
                          activeTrackColor: Colors.green,
                          value: controller.skipSplashScreen.value,
                          onChanged: (v) async {
                            controller.skipSplashScreen.value = v;
                            final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                            await prefs.setBool('skipSplashScreen', v);
                          });
                    })
                  ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
                )
                    .decorated(
                    color: const Color(0xff333333),
                    borderRadius: BorderRadius.circular(10))
                    .marginOnly(bottom: 10),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  child: <Widget>[
                    const Text(
                      'SET DESTINATION TIME',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    <Widget>[
                      Expanded(
                        child: SizedBox(
                          child: DateTimePickerWidget(
                            dateFormat: 'MM/dd/yyyy HH:mm',
                            initDateTime: controller.destinationTime,
                            pickerTheme: const DateTimePickerTheme(
                                backgroundColor: Colors.transparent,
                                cancel: null,
                                confirm: null,
                                titleHeight: 0,
                                itemTextStyle: TextStyle(color: Colors.white),
                                title: null),
                            onChange: (dateTime, List<int> index) async {
                              controller.destinationTime = dateTime;
                            },
                          ),
                        ),
                      ),
                      Container(
                        width: 120,
                        height: 53,
                        alignment: Alignment.center,
                        child: const Text(
                          'Application',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                          .decorated(
                          color: const Color(0xffffba00),
                          borderRadius: BorderRadius.circular(10))
                          .gestures(onTap: () async {
                        if (controller.destinationTime.isBefore(DateTime.now())) {
                          Fluttertoast.showToast(msg: 'Please select a valid time');
                          return;
                        }
                        if (controller.destinationTime
                            .difference(DateTime.now())
                            .inMinutes <
                            30) {
                          Fluttertoast.showToast(msg: 'At least 30 minutes');
                          return;
                        }
                        final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                        await prefs.setString('destinationTime',
                            controller.destinationTime.toIso8601String());
                        Fluttertoast.showToast(msg: 'Had saved successfully');
                      })
                    ].toRow(),

                  ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
                )
                    .decorated(
                    color: const Color(0xff333333),
                    borderRadius: BorderRadius.circular(10))
                    .marginOnly(bottom: 10),
                Container(
                  width: double.infinity,
                  height: 53,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: <Widget>[
                    const Text(
                      'App version',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Obx(() {
                      return Text(
                        controller.appVersion.value,
                        style: const TextStyle(color: Colors.grey),
                      );
                    })
                  ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
                ).decorated(
                    color: const Color(0xff333333),
                    borderRadius: BorderRadius.circular(10))
              ].toColumn(),
            ).marginAll(15)),
      ),
    );
  }
}
