import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:present_time/main.dart';
import 'package:styled_widget/styled_widget.dart';

import 'time_main_logic.dart';

class TimeMainPage extends StatefulWidget {
  const TimeMainPage({Key? key}) : super(key: key);

  @override
  State<TimeMainPage> createState() => _TimeMainPageState();
}

class _TimeMainPageState extends State<TimeMainPage> {
  final controller = Get.find<TimeMainLogic>();

  void biahuihius() async {
    final hadNetwork = await InternetConnectionChecker.instance.hasConnection;
    if (!hadNetwork) {
      Get.toNamed('/time_reload');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    biahuihius();
    super.initState();
  }

  Widget _item() {
    return <Widget>[
      Image.asset(
        'assets/bg1.webp',
        width: 651,
        height: 156,
        fit: BoxFit.fill,
      ),
      Positioned(
          left: 15,
          top: 68,
          child: SizedBox(
            width: 135,
            height: 71,
            child: Obx(() {
              return Text(
                controller.type == 0
                    ? controller.destinationMonthStr.value
                    : controller.destinationYearStr.value,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Color(0xffffba00),
                    fontSize: 70,
                    height: 0.8,
                    fontFamily: kTickingFamily),
              );
            }),
          )),
      Positioned(
          left: controller.type == 0 ? 278 : 172,
          top: 69,
          child: SizedBox(
            width: controller.type == 0 ? 135 : 70,
            height: 71,
            child: Obx(() {
              return Text(
                controller.type == 0
                    ? controller.destinationYearStr.value
                    : controller.destinationMonthStr.value,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Color(0xffffba00),
                    fontSize: 70,
                    height: 0.8,
                    fontFamily: kTickingFamily),
              );
            }),
          )),
      Positioned(
          left: controller.type == 0 ? 158 : 310,
          top: 68,
          child: SizedBox(
            width: controller.type == 0 ? 100 : 65,
            height: 71,
            child: Obx(() {
              return Text(
                controller.destinationDayStr.value,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Color(0xffffba00),
                    fontSize: 70,
                    height: 0.8,
                    fontFamily: kTickingFamily),
              );
            }),
          )),
      Positioned(
          left: 442,
          top: 69,
          child: SizedBox(
            width: 80,
            height: 71,
            child: Obx(() {
              return Text(
                controller.destinationHourStr.value,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Color(0xffffba00),
                    fontSize: 70,
                    height: 0.8,
                    fontFamily: kTickingFamily),
              );
            }),
          )),
      Positioned(
          left: 552,
          top: 69,
          child: SizedBox(
            width: 80,
            height: 71,
            child: Obx(() {
              return Text(
                controller.destinationMinuteStr.value,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Color(0xffffba00),
                    fontSize: 70,
                    height: 0.8,
                    fontFamily: kTickingFamily),
              );
            }),
          )),
      Visibility(
          visible: controller.type == 1,
          child: Container(
            width: 190,
            height: 32,
            alignment: Alignment.center,
            child: const Text(
              'Countdown',
              style: TextStyle(
                  fontFamily: kTickingFamily,
                  color: Color(0xff9b9b9b),
                  fontSize: 30,
                  height: 0.8),
            ),
          ).decorated(color: Colors.black).marginOnly(top: 10)),
      Visibility(
        visible: controller.type == 1,
        child: Positioned(
            left: 37,
            top: 130,
            child: Container(
              width: 92,
              height: 21,
              alignment: Alignment.center,
              child: const Text(
                'YEAR',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ).decorated(
                color: const Color(0xffffba00),
                borderRadius: BorderRadius.circular(18))),
      ),
      Visibility(
        visible: controller.type == 1,
        child: Positioned(
            left: 174,
            top: 130,
            child: Container(
              width: 70,
              height: 21,
              alignment: Alignment.center,
              child: const Text(
                'MONTH',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ).decorated(
                color: const Color(0xffffba00),
                borderRadius: BorderRadius.circular(18))),
      ),
      Visibility(
        visible: controller.type == 1,
        child: Positioned(
            left: 300,
            top: 130,
            child: Container(
              width: 92,
              height: 21,
              alignment: Alignment.center,
              child: const Text(
                'DAY',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ).decorated(
                color: const Color(0xffffba00),
                borderRadius: BorderRadius.circular(18))),
      )
    ].toStack(alignment: Alignment.topCenter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<TimeMainLogic>(builder: (_) {
        return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: <Widget>[
              const SizedBox(
                width: double.infinity,
                height: double.infinity,
              ),
              SafeArea(
                  right: false,
                  child: <Widget>[
                    Expanded(
                        child: <Widget>[
                          <Widget>[
                            Image.asset(
                              'assets/bg0.webp',
                              width: 651,
                              height: 156,
                              fit: BoxFit.fill,
                            ),
                            Positioned(
                                left: 15,
                                top: 69,
                                child: SizedBox(
                                  width: 135,
                                  child: Obx(() {
                                    return Text(
                                      controller.presentMonthStr.value,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Color(0xff00ff45),
                                          fontSize: 70,
                                          height: 0.8,
                                          fontFamily: kTickingFamily),
                                    );
                                  }),
                                )),
                            Positioned(
                                left: 158,
                                top: 69,
                                child: SizedBox(
                                  width: 100,
                                  child: Obx(() {
                                    return Text(
                                      controller.presentDayStr.value,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Color(0xff00ff45),
                                          fontSize: 70,
                                          height: 0.8,
                                          fontFamily: kTickingFamily),
                                    );
                                  }),
                                )),
                            Positioned(
                                left: 278,
                                top: 69,
                                child: SizedBox(
                                  width: 135,
                                  child: Obx(() {
                                    return Text(
                                      controller.presentYearStr.value,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Color(0xff00ff45),
                                          fontSize: 70,
                                          height: 0.8,
                                          fontFamily: kTickingFamily),
                                    );
                                  }),
                                )),
                            Positioned(
                                left: 442,
                                top: 69,
                                child: SizedBox(
                                  width: 80,
                                  child: Obx(() {
                                    return Text(
                                      controller.presentHourStr.value,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Color(0xff00ff45),
                                          fontSize: 70,
                                          height: 0.8,
                                          fontFamily: kTickingFamily),
                                    );
                                  }),
                                )),
                            Positioned(
                                left: 552,
                                top: 69,
                                child: SizedBox(
                                  width: 80,
                                  child: Obx(() {
                                    return Text(
                                      controller.presentMinuteStr.value,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Color(0xff00ff45),
                                          fontSize: 70,
                                          height: 0.8,
                                          fontFamily: kTickingFamily),
                                    );
                                  }),
                                ))
                          ].toStack(alignment: Alignment.center),
                          const SizedBox(
                            height: 10,
                          ),
                          _item()
                        ].toColumn(mainAxisAlignment: MainAxisAlignment.center)),
                    Image.asset(
                      'assets/icon.webp',
                      fit: BoxFit.cover,
                    ).gestures(onTap: () {
                      controller.type = (controller.type == 0 ? 1 : 0);
                      controller.getDate();
                      controller.update();
                    })
                  ].toRow()),
              Positioned(
                  top: 30,
                  right: 30,
                  child: const Icon(
                    Icons.settings,
                    size: 36,
                    color: Color(0xffd3d3d3),
                  ).gestures(onTap: () {
                    Get.toNamed('/time_setting',
                        arguments: controller.destinationTime)
                        ?.then((_) {
                      controller.getDate();
                    });
                  }))
            ].toStack());
      }),
    );
  }
}
