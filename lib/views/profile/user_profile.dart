import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import '../../routes.dart';
import '../../utils/theme.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool isAboutTab = true;

  void setAboutTabOrPortfoilo() {
    print("Set Fun");
    isAboutTab = !isAboutTab; // ✅ Toggle the value
    if (mounted) setState(() {});
  }

  List imagesList = [
    "assets/images/partner.png",
    "assets/images/profile.png",
    "assets/images/brand.png",
    "assets/images/influencer.png",
    "assets/images/partner.png",
    "assets/images/profile.png",
    "assets/images/brand.png",
    "assets/images/influencer.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: jwhiteColor,
      // appBar: AppBar(automaticallyImplyLeading: false),
      floatingActionButton: FloatingActionButton(
        backgroundColor: themeColor,
        onPressed: () {
          // Get.toNamed(AppRoutes.createCampaign);
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: jwhiteColor,
            width: double.infinity,
            margin: EdgeInsets.only(top: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //
                    Expanded(
                      flex: 3,
                      child: Align(
                        alignment: AlignmentGeometry.centerRight,
                        child: SizedBox(
                          height: 90,
                          child: Image.asset("assets/images/influencer.png"),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    print("Clicked Rocket");
                                  },
                                  child: SvgPicture.asset(
                                    'assets/icons/send-2.svg',
                                  ),
                                ),
                                SizedBox(width: 10),
                                GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    // print("Clicked Settings");
                                    Get.toNamed(AppRoutes.editProfile);
                                  },
                                  child: SvgPicture.asset(
                                    'assets/icons/setting-4.svg',
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "Ramya Vishnu",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: commonTabButtons(
                    title1: "About",
                    title2: "Portfolio",
                    isActive: isAboutTab,

                    onTap: setAboutTabOrPortfoilo,
                  ),
                ),
                SizedBox(height: 18),
                isAboutTab
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 48),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bio",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(height: 8),

                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipi scing elit. Tortor turpis sodales nulla velit. Nunc cum vitae, rhoncus leo id. Volutpat  Duis tinunt pretium luctus pulvinar pretium.",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: jGreyColor,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                            SizedBox(height: 30),

                            // extra elements
                            Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    "Website",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: jGreyColor,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Text(
                                    "https://www.example.com",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: jGreyColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),

                            Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    "Phone",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: jGreyColor,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Text(
                                    "+91 9666544180",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: jGreyColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 28),

                            Text(
                              "On The Web",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: jGreyColor,
                              ),
                            ),
                            SizedBox(height: 10),

                            Row(
                              children: [
                                //
                                GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    print("Clicked Linkded In");
                                  },
                                  child: SvgPicture.asset(
                                    'assets/icons/linkedin.svg',
                                  ),
                                ),
                                SizedBox(width: 10),
                                GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    print("Clicked Twitter");
                                  },
                                  child: SvgPicture.asset(
                                    'assets/icons/twitter.svg',
                                  ),
                                ),
                                SizedBox(width: 10),
                                GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    print("Clicked Facebook");
                                  },
                                  child: SvgPicture.asset(
                                    'assets/icons/fb.svg',
                                  ),
                                ),
                                SizedBox(width: 10),
                                GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    print("Clicked Instagram");
                                  },
                                  child: SvgPicture.asset(
                                    'assets/icons/instagram.svg',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        padding: const EdgeInsets.symmetric(horizontal: 28),
                        child: MasonryGridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          itemCount: imagesList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 210,
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: AssetImage(imagesList[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              // child: Center(child: Text("$index")),
                            );
                          },
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget commonTabButtons({
    required String title1,
    required String title2,
    void Function()? onTap,
    bool isActive = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: jwhiteLightColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: isActive ? themeColor : jwhiteLightColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Text(
                  title1,
                  style: TextStyle(
                    color: isActive ? jwhiteLightColor : jBlackColor,
                    fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: isActive ? jwhiteLightColor : themeColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text(
                  title2,
                  style: TextStyle(
                    color: isActive ? jBlackColor : jwhiteColor,
                    fontWeight: isActive ? FontWeight.normal : FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
