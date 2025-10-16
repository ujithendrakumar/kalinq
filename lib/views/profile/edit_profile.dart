import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kalinq/components/custom_back.dart';
import 'package:kalinq/components/custom_button.dart';
import 'package:kalinq/components/custom_field_with_name.dart';
import 'package:kalinq/utils/theme.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: jwhiteColor,
      appBar: AppBar(
        backgroundColor: jwhiteColor,
        leading: CustomBackButton(),
        title: Text(
          "Settings",
          style: TextStyle(
            color: themeColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 90,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/influencer.png"),
                      ),
                    ),
                    child: Align(
                      alignment: AlignmentGeometry.bottomRight,
                      child: Transform.translate(
                        offset: Offset(-10, 10),
                        child: CircleAvatar(
                          backgroundColor: jwhiteColor,
                          child: Icon(
                            Icons.mode_edit_outlined,
                            color: themeColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomButton(
                          text: "Change",
                          height: 30,
                          fontSize: 12,
                          width: 100,
                          textColor: jwhiteColor,
                          backgroundColor: themeColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // form
            formData(),
          ],
        ),
      ),
    );
  }

  Container formData() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        child: Column(
          children: [
            //
            CustomFormFieldWithName(
              controller: TextEditingController(),
              hint: "Full Name",
              title: "Full Name",
            ),
            CustomFormFieldWithName(
              controller: TextEditingController(),
              hint: "Bio",
              title: "Bio",
            ),
            CustomFormFieldWithName(
              controller: TextEditingController(),
              hint: "Website",
              title: "Website",
            ),
            CustomFormFieldWithName(
              controller: TextEditingController(),
              hint: "Phone",
              title: "Phone",
            ),
            CustomFormFieldWithName(
              controller: TextEditingController(),
              hint: "https://",
              title: "Facebook",
            ),
            CustomFormFieldWithName(
              controller: TextEditingController(),
              hint: "https://",
              title: "Instagram",
            ),
            CustomFormFieldWithName(
              controller: TextEditingController(),
              hint: "https://",
              title: "Linked In",
            ),
            CustomFormFieldWithName(
              controller: TextEditingController(),
              hint: "https:// ",
              title: "X (twitter)",
            ),
            SizedBox(height: 10),
            CustomButton(
              text: "Save",
              backgroundColor: themeColor,
              textColor: jwhiteColor,
              width: MediaQuery.of(context).size.width,
              fontSize: 14,
            ),
          ],
        ),
      ),
    );
  }
}
