import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart' hide Svg;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalinq/components/custom_button.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import '../utils/theme.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back, color: jwhiteColor),
        ),
      ),
      backgroundColor: themeColor,
      body: Container(
        height: MediaQuery.of(context).size.height,

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              themeColor, // Top half
              Colors.white, // Bottom half
            ],
            stops: [0.5, 0.5], // Divide exactly half
          ),
        ),
        child: Column(
          children: [TopContent(), CategoryItems(rememberMe: false)],
        ),
      ),
    );
  }
}

class TopContent extends StatelessWidget {
  const TopContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/images/icon.svg', height: 30),
          ),
        ),
        SizedBox(
          width: 300,
          child: Column(
            children: [
              Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: jwhiteColor,
                  fontFamily: "Inter",
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: "Don't have an account? ",
                    style: GoogleFonts.poppins(
                      color: jwhiteColor,
                      fontSize: 12,
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign up',
                        style: GoogleFonts.poppins(
                          color: jwhiteColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed(
                              '/signup',
                            ); // 👈 redirect to signup route
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
          decoration: BoxDecoration(
            color: jyellowColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Text(
            "Select Your Category!",
            style: TextStyle(color: themeColor, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}

class CategoryItems extends StatelessWidget {
  CategoryItems({super.key, required this.rememberMe});
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 510,
      width: MediaQuery.of(context).size.width * 0.80,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: jwhiteColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5.0)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryItem(
            isEven: false,
            assetImage: "assets/images/influencer.png",
            type: 'Creator',
            onPressed: () {
              print("Creator Clicked");
            },
          ),
          CategoryItem(
            isEven: true,
            assetImage: "assets/images/brand.png",
            type: 'Brand',
            onPressed: () {
              print("Brand Clicked");
              Get.toNamed("brand/step1");
            },
          ),
          CategoryItem(
            isEven: false,
            assetImage: "assets/images/partner.png",
            type: 'Partner / Agency',
            onPressed: () {
              print("Partner / Agency Clicked");
            },
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.isEven,
    required this.type,
    required this.assetImage,
    required this.onPressed,
  });
  final bool isEven;
  final String type;
  final String assetImage;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: isEven
              ? [
                  Expanded(
                    flex: 6,
                    child: Container(
                      height: 142,
                      decoration: BoxDecoration(
                        // color: themeColor,
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: AssetImage(assetImage),
                          alignment: Alignment.center,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),

                  Expanded(
                    flex: 4,
                    child: Container(
                      height: 142,
                      decoration: BoxDecoration(
                        color: themeColor,
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: AssetImage("assets/images/splash.png"),
                          alignment: Alignment.topRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "Join",
                              style: TextStyle(
                                fontSize: 30,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w900,
                                color: jwhiteColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "As a",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w500,
                                    color: jyellowColor,
                                  ),
                                ),
                                Text(
                                  type,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.bold,
                                    color: jyellowColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]
              : [
                  Expanded(
                    flex: 4,
                    child: Container(
                      height: 142,
                      decoration: BoxDecoration(
                        color: themeColor,
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: AssetImage("assets/images/splash.png"),
                          alignment: Alignment.topRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "Join",
                              style: TextStyle(
                                fontSize: 30,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w900,
                                color: jwhiteColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "As a",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w500,
                                    color: jyellowColor,
                                  ),
                                ),
                                Text(
                                  type,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.bold,
                                    color: jyellowColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 6,
                    child: Container(
                      height: 142,
                      decoration: BoxDecoration(
                        // color: themeColor,
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: AssetImage(assetImage),
                          alignment: Alignment.center,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
        ),
      ),
    );
  }
}
