import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:present_time/pages/time_controll/time_controll_binding.dart';
import 'package:present_time/pages/time_controll/time_controll_view.dart';
import 'package:present_time/pages/time_main/time_main_binding.dart';
import 'package:present_time/pages/time_main/time_main_init.dart';
import 'package:present_time/pages/time_main/time_main_view.dart';
import 'package:present_time/pages/time_reload/time_reload_binding.dart';
import 'package:present_time/pages/time_reload/time_reload_view.dart';
import 'package:present_time/pages/time_setting/time_setting_binding.dart';
import 'package:present_time/pages/time_setting/time_setting_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

Color primaryColor = Colors.black;
Color bgColor = const Color(0xff1d1d1d);

const String kTickingFamily = 'Ticking';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
  ]);
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final appStartUp = prefs.getBool('appStartUp');
  if (appStartUp == null) {
    await prefs.setBool('appStartUp', true);
    await prefs.setBool('skipSplashScreen', true);
    await prefs.setString('destinationTime', DateTime.now().add(const Duration(days: 2*365)).toIso8601String());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Machine,
      initialRoute: '/',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}

List<GetPage<dynamic>> Machine = [
  GetPage(name: '/', page: () => TimeControllView(), binding: TimeControllBinding()),
  GetPage(name: '/time_main', page: () => const TimeMainPage(), binding: TimeMainBinding()),
  GetPage(name: '/time_setting', page: () => TimeSettingPage(), binding: TimeSettingBinding()),
  GetPage(name: '/time_init', page: () => TimeMainInit()),
  GetPage(name: '/time_reload', page: () => TimeReloadView(), binding: TimeReloadBinding()),
];