import 'dart:async';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimeMainLogic extends GetxController {
  Timer? _timer;

  DateTime destinationTime = DateTime.now().add(const Duration(days: 365 * 2));

  int type = 0;

  var presentMonthStr = ''.obs;
  var presentDayStr = ''.obs;
  var presentYearStr = ''.obs;
  var presentHourStr = ''.obs;
  var presentMinuteStr = ''.obs;

  var destinationMonthStr = ''.obs;
  var destinationDayStr = ''.obs;
  var destinationYearStr = ''.obs;
  var destinationHourStr = ''.obs;
  var destinationMinuteStr = ''.obs;

  void startTimer() {
    getDate();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      getDate();
    });
  }

  Map<String, int> calculateDateDifference(DateTime start, DateTime end) {
    if (end.isBefore(start)) {
      DateTime temp = start;
      start = end;
      end = temp;
    }

    int years = end.year - start.year;
    int months = end.month - start.month;
    int days = end.day - start.day;
    int hours = end.hour - start.hour;
    int minutes = end.minute - start.minute;

    if (minutes < 0) {
      minutes += 60;
      hours--;
    }

    if (hours < 0) {
      hours += 24;
      days--;
    }

    if (days < 0) {
      months--;
      days += DateTime(end.year, end.month, 0).day;
    }

    if (months < 0) {
      years--;
      months += 12;
    }

    return {
      'years': years,
      'months': months,
      'days': days,
      'hours': hours,
      'minutes': minutes,
    };
  }

  void getDate() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    destinationTime = DateTime.parse(prefs.getString('destinationTime')!);
    var now = DateTime.now();
    presentMonthStr.value = DateFormat('MMM').format(now).toUpperCase();
    presentDayStr.value = DateFormat('dd').format(now);
    presentYearStr.value = DateFormat('yyyy').format(now);
    presentHourStr.value = DateFormat('HH').format(now);
    presentMinuteStr.value = DateFormat('mm').format(now);
    if (type == 0) {
      destinationMonthStr.value =
          DateFormat('MMM').format(destinationTime).toUpperCase();
      destinationDayStr.value = DateFormat('dd').format(destinationTime);
      destinationYearStr.value = DateFormat('yyyy').format(destinationTime);
      destinationHourStr.value = DateFormat('HH').format(destinationTime);
      destinationMinuteStr.value = DateFormat('mm').format(destinationTime);
    } else {
      final diffTime = calculateDateDifference(now, destinationTime);
      destinationMonthStr.value = diffTime['months'].toString();
      destinationDayStr.value = diffTime['days'].toString();
      destinationYearStr.value = diffTime['years'].toString();
      destinationHourStr.value = diffTime['hours'].toString();
      destinationMinuteStr.value = diffTime['minutes'].toString();
    }

  }

  @override
  void onInit() {
    // TODO: implement onInit
    startTimer();
    super.onInit();
  }
}
