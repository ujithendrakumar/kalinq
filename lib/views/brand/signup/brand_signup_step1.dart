import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field2/intl_phone_field.dart';
import 'package:smart_auth/smart_auth.dart';

import '../../../components/custom_field_with_name.dart';
import '../../../utils/theme.dart';

class BrandSignUpStep1 extends StatefulWidget {
  const BrandSignUpStep1({super.key});

  @override
  State<BrandSignUpStep1> createState() => _BrandSignUpStep1State();
}

class _BrandSignUpStep1State extends State<BrandSignUpStep1> {
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
        child: SingleChildScrollView(
          child: Column(children: [TopContent(), FormElementsList()]),
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
        SizedBox(height: 16),
      ],
    );
  }
}

class FormElementsList extends StatefulWidget {
  FormElementsList({super.key});

  @override
  State<FormElementsList> createState() => _FormElementsListState();
}

class _FormElementsListState extends State<FormElementsList> {
  final smartAuth = SmartAuth.instance;
  void requestPhoneNumberHint() async {
    final res = await smartAuth.requestPhoneNumberHint();
    if (res.hasData) {
      // Use the phone number
      print(res.data);
    } else {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      width: MediaQuery.of(context).size.width * 0.85,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: jwhiteColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5.0)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomFormFieldWithName(
            controller: TextEditingController(),
            hint: 'Brand Name',
            title: 'Brand Name',
            validator: null,
            keyboardType: TextInputType.text,
          ),
          CustomFormFieldWithName(
            controller: TextEditingController(),
            hint: 'Email',
            title: 'Email',
            validator: null,
            keyboardType: TextInputType.emailAddress,
          ),
          CustomFormFieldWithName(
            controller: TextEditingController(),
            hint: 'Password',
            title: 'Password',
            validator: null,
            keyboardType: TextInputType.text,
            obscureText: true,
          ),
          CustomFormFieldWithName(
            controller: TextEditingController(),
            hint: 'Confirm Password',
            title: 'Confirm Password',
            validator: null,
            keyboardType: TextInputType.text,
            obscureText: true,
          ),

          // Email Field
          const SizedBox(height: 16),
          Container(
            margin: EdgeInsets.only(left: 5, bottom: 3),
            child: Text("Phone Number", style: TextStyle(fontSize: 12)),
          ),
          SizedBox(
            height: 63,
            child: IntlPhoneField(
              flagWidth: 25,
              textFieldIsDense: true,
              showCursor: true,
              cursorHeight: 16,
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                filled: true,
                fillColor: Colors.grey.shade50,
                contentPadding: const EdgeInsets.only(top: 16),
              ),
              initialCountryCode: 'IN',
              onTap: () {
                print("Clicking on Phone");
                requestPhoneNumberHint();
              },
              onChanged: (phone) {
                print(phone.completeNumber);
              },
            ),
          ),
          const SizedBox(height: 16),

          // Login Button
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed('/otp/verification');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: themeColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Next',
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
