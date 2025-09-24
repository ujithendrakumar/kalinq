import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kalinq/utils/theme.dart';

import '../components/custom_button.dart';

class DesideScreen extends StatefulWidget {
  const DesideScreen({super.key});

  @override
  State<DesideScreen> createState() => _DesideScreenState();
}

class _DesideScreenState extends State<DesideScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/icon.svg'),
              Container(
                margin: EdgeInsets.symmetric(vertical: 25),
                // width: MediaQuery.of(context).size.width * 0.8,
                width: 300,
                child: Center(
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              CustomButton(
                text: 'Sign Up',
                onPressed: () {
                  Get.toNamed('/signup');
                },
                fontSize: 18,
                backgroundColor: jyellowColor,
                textColor: themeColor,
              ),
              SizedBox(height: 15),
              CustomButton(
                text: 'Sign In',
                onPressed: () {
                  Get.toNamed('/login');
                },
                fontSize: 18,
                textColor: themeColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
