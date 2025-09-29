import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field2/intl_phone_field.dart';
import 'package:smart_auth/smart_auth.dart';

import '../../../../utils/theme.dart';
import '../../../components/custom_formfield.dart';

class PartnerSignUpStep1 extends StatefulWidget {
  const PartnerSignUpStep1({super.key});

  @override
  State<PartnerSignUpStep1> createState() => _PartnerSignUpStep1State();
}

class _PartnerSignUpStep1State extends State<PartnerSignUpStep1> {
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
      body: GestureDetector(
        behavior: HitTestBehavior.translucent, // 👈 allows taps on empty space
        onTap: () {
          FocusScope.of(context).unfocus(); // 👈 dismiss keyboard
        },
        child: Container(
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
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();
  bool isObserbale = true;
  final smartAuth = SmartAuth.instance;
  FocusNode focusNode = FocusNode();
  // Validation Functions
  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter your name";
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter your email";
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return "Enter a valid email address";
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter a password";
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please confirm your password";
    }
    if (value != _passwordController.text) {
      return "Passwords do not match";
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter your phone number";
    }
    if (value.length < 10) {
      return "Enter a valid phone number";
    }
    return null;
  }

  // Submit Function
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final data = {
        "name": _nameController.text.trim(),
        "email": _emailController.text.trim(),
        "password": _passwordController.text.trim(),
        "confirmPassword": _confirmPasswordController.text.trim(),
        "phone": _phoneController.text.trim(),
      };

      print("Form Data JSON: ${data}");
      // Example: Send to API or next screen
      Get.toNamed('/partner/otp/verification');
    }
  }

  void requestPhoneNumberHint() async {
    final res = await smartAuth.requestPhoneNumberHint();
    if (res.hasData) {
      _phoneController.text = res.data!;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void isVisiblePassword() {
    isObserbale = !isObserbale;
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _formKey.currentState?.validate() == false ? 600 : 560,
      width: MediaQuery.of(context).size.width * 0.85,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: jwhiteColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5.0)],
      ),
      child: Form(
        autovalidateMode: AutovalidateMode.onUnfocus,
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name
            _buildLabel("Name"),
            CustomFormField(
              controller: _nameController,
              hint: "Enter Name",
              validator: _validateName,
            ),

            _buildLabel("Email"),
            CustomFormField(
              controller: _emailController,
              hint: "Enter Email",
              keyboardType: TextInputType.emailAddress,
              validator: _validateEmail,
            ),

            _buildLabel("Password"),
            CustomFormField(
              controller: _passwordController,
              hint: "Enter Password",
              obscureText: isObserbale,
              validator: _validatePassword,
              suffix: IconButton(
                onPressed: isVisiblePassword,
                icon: Icon(
                  isObserbale
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
                color: Colors.grey,
              ),
            ),

            _buildLabel("Confirm Password"),
            CustomFormField(
              controller: _confirmPasswordController,
              hint: "Enter Confirm Password",
              obscureText: isObserbale,
              validator: _validateConfirmPassword,
            ),

            _buildLabel("Phone Number"),
            SizedBox(
              height: 63,
              child: IntlPhoneField(
                controller: _phoneController,
                flagWidth: 25,
                textFieldIsDense: true,
                showCursor: true,
                cursorHeight: 16,
                style: const TextStyle(fontSize: 13),
                dropdownTextStyle: TextStyle(fontSize: 12),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  filled: true,
                  fillColor: Colors.grey.shade50,
                  contentPadding: const EdgeInsets.only(top: 16),
                ),
                initialCountryCode: 'IN',
                onTap: requestPhoneNumberHint,
                onSubmitted: (phone) {
                  // print(phone.completeNumber);
                  _phoneController.text = phone.removeAllWhitespace;
                },
              ),
            ),

            const SizedBox(height: 16),

            // Submit Button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: _submitForm,
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
          ],
        ),
      ),
    );
  }

  // Helper Widgets
  Widget _buildLabel(String text) {
    return Container(
      margin: const EdgeInsets.only(left: 5, bottom: 3, top: 10),
      child: Text(text, style: const TextStyle(fontSize: 12)),
    );
  }
}
