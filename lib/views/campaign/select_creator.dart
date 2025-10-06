import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalinq/components/custom_button.dart';

import '../../utils/theme.dart';
import '../brand/components/brand_person_box.dart';
import 'components/brand_person_select.dart';

class SelectCreatorScreen extends StatelessWidget {
  const SelectCreatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // backgroundColor: Color(0XFFFCFCFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              decoration: BoxDecoration(
                color: jyellowLightColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.arrow_back_ios, color: themeColor),
            ),
          ),
        ),
        title: const Text(
          'Select Creator',
          style: TextStyle(color: Colors.black87, fontSize: 16),
        ),
        elevation: 0,
        centerTitle: true,
        scrolledUnderElevation: 0,
      ),

      body: Container(
        margin: EdgeInsets.only(top: 8, bottom: 100),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return BrandPersonBoxSelect(currentIndex: index);
          },
          itemCount: 20,
        ),
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(color: jwhiteColor),
        padding: EdgeInsets.all(16),
        height: 120,
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "No of reels :  ",
                      style: GoogleFonts.poppins(
                        color: Colors.grey.shade700,
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text: '10',
                          style: GoogleFonts.poppins(
                            color: themeColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                          // recognizer: TapGestureRecognizer()
                          //   ..onTap = () {
                          //     // Get.toNamed('/signup');
                          //   },
                        ),
                      ],
                    ),
                  ),
                  if (false == true)
                    Text.rich(
                      TextSpan(
                        text: "Remain reels :  ",
                        style: GoogleFonts.poppins(
                          color: Colors.grey.shade700,
                          fontSize: 12,
                        ),
                        children: [
                          TextSpan(
                            text: '7',
                            style: GoogleFonts.poppins(
                              color: themeColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                            // recognizer: TapGestureRecognizer()
                            //   ..onTap = () {
                            //     // Get.toNamed('/signup');
                            //   },
                          ),
                        ],
                      ),
                    ),
                  Text.rich(
                    TextSpan(
                      text: "Amount :  ",
                      style: GoogleFonts.poppins(
                        color: Colors.grey.shade700,
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text: '₹35000',
                          style: GoogleFonts.poppins(
                            color: themeColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                          // recognizer: TapGestureRecognizer()
                          //   ..onTap = () {
                          //     // Get.toNamed('/signup');
                          //   },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              CustomButton(
                text: "Next",
                width: double.infinity,
                fontSize: 16,
                height: 50,
                textColor: jwhiteColor,
                backgroundColor: themeColor,
                onPressed: () {
                  print("SUmmary Screen Going");
                  Get.toNamed('/create-campaign/select-creator/order-summary');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
