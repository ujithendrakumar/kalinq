import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field2/intl_phone_field.dart';
import 'package:smart_auth/smart_auth.dart';

import '../../../components/custom_formfield.dart';
import '../../../utils/theme.dart';

class CreatorSignUpStep3 extends StatefulWidget {
  const CreatorSignUpStep3({super.key});

  @override
  State<CreatorSignUpStep3> createState() => _CreatorSignUpStep3State();
}

class _CreatorSignUpStep3State extends State<CreatorSignUpStep3> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   automaticallyImplyLeading: false,
      //   leading: IconButton(
      //     onPressed: () {
      //       Get.back();
      //     },
      //     icon: Icon(Icons.arrow_back, color: jwhiteColor),
      //   ),
      // ),
      backgroundColor: themeColor,
      body: Container(
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
        child: Center(
          child: SingleChildScrollView(
            child: Column(children: [TopContent(), FormElementsList()]),
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
                'Social Media Links',
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
            "Creator",
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
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final _instagramController = TextEditingController();
  final _twitterController = TextEditingController();
  final _behanceController = TextEditingController();

  // Helper Widgets
  Widget _buildLabel(String text) {
    return Container(
      margin: const EdgeInsets.only(left: 5, bottom: 3, top: 10),
      child: Text(text, style: const TextStyle(fontSize: 12)),
    );
  }

  String? _validateCommonField(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter this field";
    }
    if (value.length < 3) {
      return "Enter a valid input value";
    }
    return null;
  }

  // Submit Function
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final data = {
        "instagram": _instagramController.text.trim(),
        "twitter": _twitterController.text.trim(),
        "behance": _behanceController.text.trim(),
      };

      if (kDebugMode) {
        print("Form Data JSON: $data");
      }
      // Example: Send to API or next screen
      Get.toNamed('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: MediaQuery.of(context).size.width * 0.85,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: jwhiteColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5.0)],
      ),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUnfocus,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Email Field
            const SizedBox(height: 16),
            _buildLabel("Instagram"),
            CustomFormField(
              controller: _instagramController,
              hint: "Instragram ",
              keyboardType: TextInputType.emailAddress,
              validator: _validateCommonField,
            ),
            _buildLabel("X (Twitter)"),
            CustomFormField(
              controller: _twitterController,
              hint: "X  ",
              keyboardType: TextInputType.emailAddress,
              validator: _validateCommonField,
            ),

            _buildLabel("Behance"),
            CustomFormField(
              controller: _behanceController,
              hint: "Behance ",
              keyboardType: TextInputType.emailAddress,
              validator: _validateCommonField,
            ),
            const SizedBox(height: 20),

            // Login Button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed('/login');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: themeColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Submit',
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
      ),
    );
  }
}
