import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kalinq/utils/theme.dart';

import '../../components/custom_back.dart';
import '../../components/custom_button.dart';

class CampaignDetails extends StatelessWidget {
  const CampaignDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final id = Get.parameters['id'];
    final title = Get.parameters['title'];
    return Scaffold(
      backgroundColor: jwhiteLightColor,
      appBar: AppBar(leading: CustomBackButton(), backgroundColor: jwhiteColor),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(19),
          decoration: BoxDecoration(
            color: jwhiteColor,
            borderRadius: BorderRadius.circular(12),
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
              SizedBox(height: 10),

              Text(
                "Campaign Brief",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: themeColor,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "We’re looking for lifestyle and beauty influencers to showcase our new Radiance Glow Serum. The campaign will highlight how the serum fits seamlessly into everyday skincare routines, promoting natural beauty and confidence. Influencers should create authentic, engaging content that resonates with their followers and communicates the product’s key benefits: hydration, glow, and skin nourishment.",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 10),
              Text(
                "Campaign Goal",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: themeColor,
                ),
              ),
              Html(
                data: """<ul> 
                          <li>Increase brand awareness among target audiences (18–30, skincare enthusiasts).</li>
                          <li>Drive social engagement (likes, comments, shares, saves).</li>
                          <li>Encourage website traffic & conversions using influencer discount codes.</li>
                    </ul>""",
                style: {
                  "ul": Style(
                    textAlign: TextAlign.left,
                    padding: HtmlPaddings.zero,
                    // backgroundColor: Colors.grey,
                    margin: Margins(
                      left: Margin(10, Unit.px),
                      right: Margin.auto(),
                    ),
                    fontWeight: FontWeight.normal,
                  ),
                },
              ),
              Text(
                "Deliverables",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: themeColor,
                ),
              ),
              Html(
                data: """<ul> 
                          <li>1 Instagram Reel (30–60s): Product unboxing, routine demo, or before/after usage.</li>
                          <li>2 Instagram Stories (with swipe-up link): Highlight product benefits & call-to-action.</li>
                          <li>1 Instagram Post (static or carousel): High-quality photo showcasing product usage in daily routine.</li>
                          <li>Tag @brandhandle and use campaign hashtags: #GlowWithRadiance #RadiancePartner</li>
                        </ul>""",
                style: {
                  "ul": Style(
                    textAlign: TextAlign.left,
                    fontSize: FontSize.medium,
                    padding: HtmlPaddings.zero,
                    margin: Margins(
                      left: Margin(10, Unit.px),
                      right: Margin.auto(),
                    ),
                    fontWeight: FontWeight.normal,
                  ),
                },
              ),
              Wrap(
                children: [
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
      ),
    );
  }
}
