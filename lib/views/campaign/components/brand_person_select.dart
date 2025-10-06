import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../components/custom_chip.dart';
import '../../../utils/theme.dart';

class BrandPersonBoxSelect extends StatelessWidget {
  const BrandPersonBoxSelect({super.key, required this.currentIndex});
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 7),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Sanjana Melgudi",
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
                          Radio(
                            value: true,
                            groupValue: (currentIndex == 0 || currentIndex == 1)
                                ? true
                                : false,
                            toggleable: true,
                            activeColor: themeColor,

                            fillColor: WidgetStateProperty.resolveWith<Color>((
                              Set<WidgetState> states,
                            ) {
                              if (states.contains(WidgetState.disabled)) {
                                return Colors.red;
                              }
                              return Colors.red;
                            }),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CustomChip(
                            title: "Fashion",
                            tileColor: jyellowLightColor,
                            textColor: themeColor,
                          ),
                          CustomChip(
                            title: "Influencer",
                            tileColor: jyellowLightColor,
                            textColor: themeColor,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          CustomChip(
                            title: "₹2k Per Reel",
                            tileColor: jyellowLightColor,
                            textColor: themeColor,
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: (currentIndex == 0 || currentIndex == 1)
                                    ? themeColor
                                    : jGreyLightColor,
                                width: 1,
                              ),
                            ),
                            width: 80,
                            child: Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      // cartController.decreaseQuantity(cartItem);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        // color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        size: 20,
                                        color:
                                            (currentIndex == 0 ||
                                                currentIndex == 1)
                                            ? themeColor
                                            : jGreyLightColor,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  (currentIndex == 0)
                                      ? "6"
                                      : currentIndex == 1
                                      ? "4"
                                      : "0",
                                  // "${cartItem.qty}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color:
                                        (currentIndex == 0 || currentIndex == 1)
                                        ? themeColor
                                        : jGreyLightColor,
                                    fontFamily: "Metropolis",
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      // cartController.increaseQuantity(cartItem);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        // color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Icon(
                                        Icons.arrow_drop_up,
                                        size: 20,
                                        color:
                                            (currentIndex == 0 ||
                                                currentIndex == 1)
                                            ? themeColor
                                            : jGreyLightColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
                // Top Row with Avatar, Name, Title, and More Icon
                // Spacer(),
                // Transform.translate(
                //   offset: Offset(0.0, -10),
                //   child: Checkbox(
                //     value: true,
                //     activeColor: themeColor,
                //     onChanged: (value) {},
                //     shape: CircleBorder(),
                //   ),
                // ),
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
