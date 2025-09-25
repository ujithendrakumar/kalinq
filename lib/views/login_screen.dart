import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalinq/components/custom_button.dart';

import '../utils/theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
          child: Column(children: [TopContent(), LoginForm(rememberMe: false)]),
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
                'Sign in to your Account',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: jwhiteColor,
                  fontFamily: "Inter",
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Enter your email and password to log in',
                  style: TextStyle(color: jwhiteColor),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class LoginForm extends StatelessWidget {
  LoginForm({super.key, required this.rememberMe});
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
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
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              icon: SvgPicture.asset('assets/icons/google.svg'),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: jwhiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: Colors.grey.shade200),
                ),
              ),
              onPressed: () {},
              label: Text("Continue with Google"),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                const Expanded(child: Divider(color: Colors.grey)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Or Login with',
                    style: GoogleFonts.poppins(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                    ),
                  ),
                ),
                const Expanded(child: Divider(color: Colors.grey)),
              ],
            ),
          ),

          // Email Field
          Container(
            margin: EdgeInsets.only(left: 5, bottom: 3),
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
          const SizedBox(height: 10),

          // Remember Me & Forgot Password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Transform.scale(
                    scale: 0.8, // smaller than 1.0 shrinks
                    child: Checkbox(
                      value: rememberMe,
                      onChanged: (value) {
                        // setState(() {
                        //   rememberMe = value ?? false;
                        // });
                      },
                      activeColor: themeColor,
                    ),
                  ),
                  Text(
                    'Remember me',
                    style: GoogleFonts.poppins(
                      color: Colors.grey.shade700,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password?',
                  style: GoogleFonts.poppins(
                    color: themeColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Login Button
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: themeColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Login',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: jyellowColor,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Sign Up Link
          Center(
            child: Text.rich(
              TextSpan(
                text: "Don't have an account? ",
                style: GoogleFonts.poppins(
                  color: Colors.grey.shade700,
                  fontSize: 12,
                ),
                children: [
                  TextSpan(
                    text: 'Sign up',
                    style: GoogleFonts.poppins(
                      color: themeColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.toNamed('/signup'); // 👈 redirect to signup route
                      },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
