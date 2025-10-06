import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as psvg;
import '../../../components/custom_chip.dart';
import '../../../utils/theme.dart';

class BrandPersonBox extends StatelessWidget {
  const BrandPersonBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
      // padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.grey.shade200, width: 1.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row with Avatar, Name, Title, and More Icon
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(FeatherIcons.send, size: 18),
                ),
                SizedBox(width: 16),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(FeatherIcons.bookmark, size: 18),
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(left: 16),
            child: Row(
              children: [
                Container(
                  width: 98,
                  height: 98,
                  decoration: BoxDecoration(
                    // color: Colors.red,
                    borderRadius: BorderRadius.circular(19),
                    image: DecorationImage(
                      image: AssetImage('assets/images/profile.png'),
                      fit: BoxFit.fill,
                      colorFilter: ColorFilter.mode(
                        Colors.transparent,
                        BlendMode.color,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Jithendra Kumar",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(width: 8),
                        SvgPicture.asset('assets/icons/verified.svg'),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        CustomChip(title: "Fashion"),
                        CustomChip(title: "Influencer"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 64,
            decoration: BoxDecoration(
              color: jyellowLightColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "44.2k",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: themeColor,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Followers",
                        style: TextStyle(fontSize: 12, color: jGreyLightColor),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "21.2k",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: themeColor,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Avg Viewership",
                        style: TextStyle(fontSize: 12, color: jGreyLightColor),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "33.2k",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: themeColor,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Avg Engagement",
                        style: TextStyle(fontSize: 12, color: jGreyLightColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
