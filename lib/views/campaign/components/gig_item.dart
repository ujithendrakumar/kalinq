import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalinq/components/custom_button.dart';
import 'package:kalinq/utils/theme.dart';

class GigItem extends StatelessWidget {
  const GigItem({super.key, required this.currentIndex, this.onTap});
  final int currentIndex;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        padding: EdgeInsets.all(15),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 3.0)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: jwhiteLightColor,
                  child: SvgPicture.asset("assets/icons/kalinq.svg"),
                ),
                Text(
                  "25 minute ago ",
                  style: TextStyle(fontSize: 12, color: jGreyColor),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Glow with Radience",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: jBlackColor,
                      ),
                    ),
                    Text(
                      "- Skincare Brand Campaign",
                      style: TextStyle(fontSize: 12, color: jGreyColor),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Budget",
                      style: TextStyle(fontSize: 16, color: jGreyColor),
                    ),
                    Text(
                      "₹25000",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: themeColor,
                        fontFamily: "Inter",
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 15, bottom: 15),
              width: MediaQuery.of(context).size.width * 0.6,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: jyellowLightColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "04 September - 10 September 2025",
                style: TextStyle(fontSize: 12, color: themeColor),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15, bottom: 15),
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text.rich(
                TextSpan(
                  text:
                      "We’re looking for lifestyle and beauty influencers to showcase our new Radiance Glow Serum.",
                  style: GoogleFonts.poppins(
                    color: Colors.grey.shade700,
                    fontSize: 12,
                  ),
                  children: [
                    TextSpan(
                      text: ' Read more',
                      style: GoogleFonts.poppins(
                        color: themeColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Get.toNamed('/signup');
                        },
                    ),
                  ],
                ),
              ),
            ),
            (currentIndex == 0)
                ? Wrap(
                    children: [
                      //
                      CustomButton(
                        height: 30,
                        text: "Accepted",
                        backgroundColor: Colors.green,
                        textColor: jwhiteColor,
                        width: 110,
                        fontSize: 11,
                      ),
                      CustomButton(
                        height: 30,
                        text: "Rejected",
                        backgroundColor: Colors.red,
                        textColor: jwhiteColor,
                        width: 100,
                        fontSize: 11,
                      ),
                      CustomButton(
                        height: 30,
                        text: "Pending",
                        backgroundColor: jyellowLightDarkColor,
                        textColor: jBlackColor,
                        width: 100,
                        fontSize: 11,
                      ),
                    ],
                  )
                : Wrap(
                    children: [
                      //
                      CustomButton(
                        height: 30,
                        text: "Accept",
                        backgroundColor: Colors.green,
                        textColor: jwhiteColor,
                        width: 110,
                        fontSize: 11,
                      ),
                      CustomButton(
                        height: 30,
                        text: "Reject",
                        backgroundColor: Colors.white70,
                        textColor: jBlackColor,
                        width: 100,
                        fontSize: 11,
                      ),
                      CustomButton(
                        height: 30,
                        text: "Negotiate",
                        backgroundColor: Colors.white70,
                        textColor: jBlackColor,
                        width: 105,
                        fontSize: 11,
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
