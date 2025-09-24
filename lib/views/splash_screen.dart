import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kalinq/utils/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // await _homeController.fetchMasterSettings();
      await _checkLoginStatus();
    });
  }

  Future<void> _checkLoginStatus() async {
    // final prefs = await SharedPreferences.getInstance();
    // final token = prefs.getString('token');
    await Future.delayed(
      Duration(seconds: 3),
    ); // Optional: show splash for 2 seconds
    Get.toNamed('/deside');
    // if (token != null && token.isNotEmpty) {
    //   Get.to('/home');
    // } else {
    //   Get.to('/login');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash.png"),
            fit: BoxFit.fitWidth,
            alignment: Alignment.centerRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: SvgPicture.asset('assets/images/logo.svg')),
            SizedBox(height: 10),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
