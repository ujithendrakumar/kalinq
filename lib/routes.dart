// lib/routes/routes.dart
import 'package:get/get.dart';

// Import all screens
import 'views/campaign/capaigns_list.dart';
import 'views/campaign/components/order_summary.dart';
import 'views/campaign/create_campaign.dart';
import 'views/campaign/order_success_page.dart';
import 'views/campaign/select_creator.dart';
import 'views/home_screen.dart';
import 'views/login_screen.dart';
import 'views/signup_screen.dart';
import 'views/deside_screen.dart';
import 'views/forgot_password.dart';

// Brand
import 'views/brand/brand_home_screen.dart';
import 'views/brand/home/dashboard.dart';
import 'views/brand/signup/brand_signup_step1.dart';
import 'views/brand/signup/brand_signup_step3.dart';
import 'views/brand/signup/otp_verification.dart';

// Creator
import 'views/creator/signup/creator_signup_step1.dart';
import 'views/creator/signup/creator_signup_step3.dart';
import 'views/creator/signup/otp_verification.dart';

// Partner
import 'views/partner/signup/partner_signup_step1.dart';
import 'views/partner/signup/partner_signup_step3.dart';
import 'views/partner/signup/partner_otp_verification.dart';
import 'views/splash_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String deside = '/deside';
  static const String forgotPassword = '/forgot-password';
  static const String notificationScreen = '/notifications';
  static const String createCampaign = '/create-campaign';
  static const String campaignsList = '/campaigns-list';
  static const String selectCreator = '/create-campaign/select-creator';
  static const String orderSummary =
      '/create-campaign/select-creator/order-summary';
  static const String bookingSuccess = '/booking-success';

  // Brand
  static const String brandHome = '/brand/home';
  static const String brandDashboard = '/brand/dashboard';
  static const String brandStep1 = '/brand/step1';
  static const String brandOtpVerification = '/otp/verification';
  static const String brandStep3 = '/brand/step3';

  // Creator
  static const String creatorStep1 = '/creator/step1';
  static const String creatorOtpVerification = '/creator/otp/verification';
  static const String creatorStep3 = '/creator/step3';

  // Partner
  static const String partnerStep1 = '/partner/step1';
  static const String partnerOtpVerification = '/partner/otp/verification';
  static const String partnerStep3 = '/partner/step3';

  static final routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: login, page: () => const LoginScreen()),
    GetPage(name: signup, page: () => const SignUpScreen()),
    GetPage(name: deside, page: () => const DesideScreen()),

    // Brand
    GetPage(name: brandHome, page: () => const BrandHomeScreen()),
    GetPage(name: brandDashboard, page: () => const BrandDashboard()),
    GetPage(name: brandStep1, page: () => const BrandSignUpStep1()),
    GetPage(name: brandOtpVerification, page: () => const OtpVerification()),
    GetPage(name: brandStep3, page: () => const BrandSignUpStep3()),

    // Creator
    GetPage(name: creatorStep1, page: () => const CreatorSignUpStep1()),
    GetPage(
      name: creatorOtpVerification,
      page: () => const CreatorOtpVerification(),
    ),
    GetPage(name: creatorStep3, page: () => const CreatorSignUpStep3()),

    // Partner
    GetPage(name: partnerStep1, page: () => const PartnerSignUpStep1()),
    GetPage(
      name: partnerOtpVerification,
      page: () => const PartnerOtpVerification(),
    ),
    GetPage(name: partnerStep3, page: () => const PartnerSignUpStep3()),

    // Forgot Password
    GetPage(name: forgotPassword, page: () => const ForgotPasswordScreen()),
    GetPage(name: campaignsList, page: () => const CampaignList()),
    GetPage(name: createCampaign, page: () => const CreateCampaign()),
    GetPage(name: selectCreator, page: () => const SelectCreatorScreen()),
    GetPage(name: orderSummary, page: () => const OrderSummary()),
    GetPage(
      name: bookingSuccess,
      page: () => const OrderSuccessPage(customerName: ''),
    ),
  ];
}
