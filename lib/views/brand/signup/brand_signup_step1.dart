import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field2/intl_phone_field.dart';
import 'package:smart_auth/smart_auth.dart';

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
          // Email Field
          Container(
            margin: EdgeInsets.only(left: 5, bottom: 3),
            child: Text("Brand Name", style: TextStyle(fontSize: 12)),
          ),
          SizedBox(
            height: 43,
            child: TextFormField(
              style: TextStyle(fontSize: 12),
              readOnly: false,
              decoration: InputDecoration(
                // labelText: 'Email',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.brown, width: 1),
                ),
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
                hintText: "Enter Brand Name",
                hintStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  // borderSide: BorderSide(color: Colors.grey.shade100, width: 1),
                ),
              ),
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a problem';
                }
                // Fixed: Removed invalid email validation for problem field
                return null;
              },
              onChanged: (val) {},
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 5, bottom: 3, top: 10),
            child: Text("Email", style: TextStyle(fontSize: 12)),
          ),
          SizedBox(
            height: 43,
            child: TextFormField(
              style: TextStyle(fontSize: 12),
              readOnly: false,
              decoration: InputDecoration(
                // labelText: 'Email',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.brown, width: 1),
                ),
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
                hintText: "Enter Email",
                hintStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  // borderSide: BorderSide(color: Colors.grey.shade100, width: 1),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a problem';
                }
                // Fixed: Removed invalid email validation for problem field
                return null;
              },
              onChanged: (val) {},
            ),
          ),

          const SizedBox(height: 16),

          // Password Field
          Container(
            margin: EdgeInsets.only(left: 5, bottom: 3),
            child: Text("Password", style: TextStyle(fontSize: 12)),
          ),
          SizedBox(
            height: 43,
            child: TextFormField(
              style: TextStyle(fontSize: 12),
              readOnly: false,
              decoration: InputDecoration(
                // labelText: 'Password',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.brown, width: 1),
                ),
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
                hintText: "Enter Password",
                hintStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade100, width: 1),
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.visibility_off_outlined,
                    color: Colors.grey,
                  ),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a Password';
                }
                // Fixed: Removed invalid email validation for problem field
                return null;
              },
              onChanged: (val) {},
            ),
          ),
          const SizedBox(height: 16),
          Container(
            margin: EdgeInsets.only(left: 5, bottom: 3),
            child: Text("Confirm Password", style: TextStyle(fontSize: 12)),
          ),
          SizedBox(
            height: 43,
            child: TextFormField(
              style: TextStyle(fontSize: 12),
              readOnly: false,
              decoration: InputDecoration(
                // labelText: 'Password',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.brown, width: 1),
                ),
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
                hintText: "Enter Confirm Password",
                hintStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade100, width: 1),
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.visibility_off_outlined,
                    color: Colors.grey,
                  ),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a Password';
                }
                // Fixed: Removed invalid email validation for problem field
                return null;
              },
              onChanged: (val) {},
            ),
          ),
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
                // labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(),
                ),
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
