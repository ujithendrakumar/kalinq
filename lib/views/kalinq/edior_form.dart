import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalinq/components/custom_field_with_name.dart';
import 'package:kalinq/routes.dart';

import '../../components/custom_back.dart';
import '../../components/custom_button.dart';
import '../../components/custom_formfield.dart';
import '../../utils/theme.dart';

class EditorFormPage extends StatelessWidget {
  const EditorFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: CustomBackButton()),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.13),
                Text(
                  'Editors Form',
                  style: TextStyle(
                    fontSize: 18,
                    color: themeColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Please provide the details',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Instructions"),
                        SizedBox(height: 6),
                        TextFormField(
                          style: const TextStyle(fontSize: 13),
                          minLines: 4,
                          maxLines: 10,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: themeColor.withAlpha(50),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            //  fillColor: Colors.white,
                            hintText: "Enter Your Instructions",
                            hintStyle: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                            ),
                            // 👇 Reserve space for error text
                            focusColor: themeColor,

                            errorStyle: const TextStyle(
                              fontSize: 10,
                              color: Colors.red,
                              height: 0.8,
                            ),
                            errorMaxLines: 2,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 12,
                            ),
                            constraints: const BoxConstraints(
                              minHeight: 43,
                              maxHeight: 65, // enough room for error message
                            ),
                          ),
                          validator: (i) {},
                        ),

                        CustomFormFieldWithName(
                          hint: "https://",
                          keyboardType: TextInputType.text,
                          maxLines: 6,

                          validator: (v) {
                            if (v == null || v.trim().isEmpty) {
                              return 'Number of reels required';
                            }
                            return null;
                          },
                          controller: TextEditingController(),
                          title: 'Reference links',
                        ),

                        DottedBorder(
                          options: RoundedRectDottedBorderOptions(
                            color: themeColor,
                            strokeWidth: 1,
                            radius: Radius.circular(8),
                            dashPattern: [8, 7],
                          ),
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: themeColor.withAlpha(15),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/folder.svg',
                                  height: 30,
                                ),
                                SizedBox(width: 15),

                                Text(
                                  "+ Uploads Files",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 15),

                CustomButton(
                  text: "Next",
                  width: double.infinity,
                  fontSize: 16,
                  height: 50,
                  textColor: jwhiteColor,
                  backgroundColor: themeColor,
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    print("Add Wallet Money Screen Going");
                    Get.toNamed(AppRoutes.payAmountToKalinq);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
