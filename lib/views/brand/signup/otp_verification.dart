import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field2/intl_phone_field.dart';
import 'package:pinput/pinput.dart';

import '../../../utils/theme.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              TopContent(),
              FormElementsList(phoneNumber: "9666544180"),
            ],
          ),
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
      mainAxisAlignment: MainAxisAlignment.center,
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
            "Brand",
            style: TextStyle(color: themeColor, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

class FormElementsList extends StatefulWidget {
  FormElementsList({super.key, this.phoneNumber});
  String? phoneNumber = "9666544180";

  @override
  State<FormElementsList> createState() => _FormElementsListState();
}

class _FormElementsListState extends State<FormElementsList> {
  final pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: MediaQuery.of(context).size.width * 0.85,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: jwhiteColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5.0)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Email Field
          Text(
            "OTP Verification",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: jBlackColor,
            ),
          ),
          SizedBox(height: 23),
          SizedBox(
            child: Text(
              "We have sent a verification code to",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: jGreyColor,
              ),
            ),
          ),
          SizedBox(
            child: Text(
              "+91 ${widget.phoneNumber}",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: jGreyColor,
              ),
            ),
          ),
          SizedBox(height: 23),
          Pinput(
            length: 4,
            defaultPinTheme: PinTheme(
              width: 56,
              height: 56,
              textStyle: TextStyle(
                fontSize: 18,
                color: Color.fromRGBO(30, 60, 87, 1),
                fontWeight: FontWeight.w600,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            controller: pinController,
            autofocus: false,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Resend OTP in "), Text("30 Sec")],
          ),
          const SizedBox(height: 16),
          // Login Button
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed('brand/step3');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: themeColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Submit ',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: jyellowColor,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
