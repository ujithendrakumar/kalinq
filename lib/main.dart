import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalinq/utils/theme.dart';
import 'package:toastification/toastification.dart';

import 'views/brand/brand_home_screen.dart';
import 'views/brand/home/dashboard.dart';
import 'views/brand/signup/brand_signup_step1.dart';
import 'views/brand/signup/brand_signup_step3.dart';
import 'views/brand/signup/otp_verification.dart';
import 'views/creator/signup/creator_signup_step3.dart';
import 'views/creator/signup/otp_verification.dart';
import 'views/deside_screen.dart';
import 'views/forgot_password.dart';
import 'views/home_screen.dart';
import 'views/creator/signup/creator_signup_step1.dart';
import 'views/login_screen.dart';
import 'views/partner/signup/partner_otp_verification.dart';
import 'views/partner/signup/partner_signup_step1.dart';
import 'views/partner/signup/partner_signup_step3.dart';
import 'views/signup_screen.dart';
import 'views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kalinq',
        // Theme setup
        // theme: ThemeData(
        //   fontFamily: "DmSans",
        //   brightness: Brightness.light,
        //   colorScheme: ColorScheme.fromSeed(
        //     seedColor: Colors.deepPurple,
        //     brightness: Brightness.light,
        //   ),
        //   useMaterial3: true,
        // ),
        // darkTheme: ThemeData(
        //   brightness: Brightness.dark,
        //   colorScheme: ColorScheme.fromSeed(
        //     seedColor: Colors.deepPurple,
        //     brightness: Brightness.dark,
        //   ),
        //   appBarTheme: AppBarTheme(
        //     backgroundColor: themeColor,
        //     elevation: 0,
        //     iconTheme: const IconThemeData(color: Colors.white),
        //     titleTextStyle: const TextStyle(
        //       color: Colors.white,
        //       fontSize: 20,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        //   useMaterial3: true,
        // ),
        themeMode: ThemeMode.system, // Switches based on system setting

        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => const SplashScreen()),
          GetPage(name: '/home', page: () => const HomeScreen()),
          GetPage(name: '/login', page: () => const LoginScreen()),
          GetPage(name: '/signup', page: () => const SignUpScreen()),
          GetPage(name: '/deside', page: () => const DesideScreen()),

          GetPage(name: '/brand/home', page: () => const BrandHomeScreen()),
          GetPage(name: '/brand/dashboard', page: () => const BrandDashboard()),
          GetPage(name: '/brand/step1', page: () => const BrandSignUpStep1()),
          GetPage(
            name: '/otp/verification',
            page: () => const OtpVerification(),
          ),
          GetPage(name: '/brand/step3', page: () => const BrandSignUpStep3()),
          // CreatorSignUpStep1
          GetPage(
            name: '/creator/step1',
            page: () => const CreatorSignUpStep1(),
          ),
          //CreatorOtpVerification
          GetPage(
            name: '/creator/otp/verification',
            page: () => const CreatorOtpVerification(),
          ),
          GetPage(
            name: '/creator/step3',
            page: () => const CreatorSignUpStep3(),
          ),

          GetPage(
            name: '/partner/step1',
            page: () => const PartnerSignUpStep1(),
          ),
          //PartnerOtpVerification
          GetPage(
            name: '/partner/otp/verification',
            page: () => const PartnerOtpVerification(),
          ),
          GetPage(
            name: '/partner/step3',
            page: () => const PartnerSignUpStep3(),
          ),
          //forgot-password
          GetPage(
            name: '/forgot-password',
            page: () => const ForgotPasswordScreen(),
          ),
        ],
      ),
    );
  }
}
