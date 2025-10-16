import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kalinq/components/custom_button.dart';
import 'package:kalinq/components/custom_field_with_name.dart';
import 'package:kalinq/routes.dart';
import 'package:kalinq/utils/theme.dart';

class KalinqHome extends StatefulWidget {
  const KalinqHome({super.key});

  @override
  State<KalinqHome> createState() => _KalinqHomeState();
}

class _KalinqHomeState extends State<KalinqHome> {
  bool isOurExperts = true;
  bool isCameraman = true;
  bool isInstant = true;
  bool isLoading = false;
  int? selectedIndex;
  void changeisOurExperts() {
    isOurExperts = !isOurExperts; // ✅ Toggle the value
    if (mounted) setState(() {});
  }

  void changeisCameraman() {
    isCameraman = !isCameraman; // ✅ Toggle the value
    if (mounted) setState(() {});
  }

  void changeisInstant() {
    isInstant = !isInstant; // ✅ Toggle the value
    if (mounted) setState(() {});
  }

  void setSelectedIndex(int ind) {
    print("test ontap $ind");
    selectedIndex = ind;
    if (mounted) setState(() {});
  }

  List noOfInstantUsersList = [1, 2, 3, 4, 5, 6, 7];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,

        title: SvgPicture.asset(
          'assets/images/logo.svg',
          height: 90,
          color: themeColor,
        ),
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: SafeArea(
        child:
            selectedIndex != null &&
                isInstant == true &&
                (isCameraman == false || isInstant == true)
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: CustomButton(
                  text: "Processed To Next",
                  width: double.infinity,
                  fontSize: 16,
                  height: 50,
                  textColor: jwhiteColor,
                  backgroundColor: themeColor,
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    if (isCameraman == true) {
                      // Cameraman
                      Get.toNamed(AppRoutes.payAmountToKalinq);
                    } else {
                      // Editor Form Redirect
                      Get.toNamed(AppRoutes.editorFormPage);
                    }
                    print("Add Wallet Money Screen Going");
                  },
                ),
              )
            : SizedBox(),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  //
                  commonTabButtons(
                    title1: "Our Experts",
                    title2: "Partners",
                    onTap: changeisOurExperts,
                    isActive: isOurExperts,
                  ),
                  isOurExperts
                      ? callToExpertWidget(
                          mainTitle: "Speak to our experts",
                          mobile: "+91 9533 950 736",
                        )
                      : Column(
                          children: [
                            SizedBox(height: 40),
                            commonTabButtons(
                              title1: "Cameraman",
                              title2: "Editor",
                              onTap: changeisCameraman,
                              isActive: isCameraman,
                            ),
                            SizedBox(height: 20),
                            if (isCameraman == true)
                              commonTabButtons(
                                title1: "Instant",
                                title2: "Schedule",
                                onTap: changeisInstant,
                                isActive: isInstant,
                              ),
                            if (isInstant == true &&
                                noOfInstantUsersList.isEmpty)
                              callToExpertWidget(
                                mainTitle: "Unavailable",
                                mobile: "+91 9666 544 180",
                              ),
                          ],
                        ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: (isCameraman == false || isInstant == true)
                  ? Column(
                      children: isOurExperts == true
                          ? []
                          : noOfInstantUsersList.map((index) {
                              return InstantBookingUserItem(
                                currentIndex: index,
                                selectedIndex: selectedIndex,
                                onTap: () {
                                  setSelectedIndex(index);
                                },
                              );
                            }).toList(),
                    )
                  : isInstant == false && isCameraman == true
                  ? Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: jwhiteColor,
                      ),
                      child: Form(
                        child: Column(
                          children: [
                            // Schedule
                            CustomFormFieldWithName(
                              controller: TextEditingController(),
                              hint: "Hours",
                              title: "Hours",
                              keyboardType: TextInputType.numberWithOptions(
                                decimal: false,
                              ),
                            ),
                            CustomFormFieldWithName(
                              controller: TextEditingController(),
                              hint: "Date",
                              title: "Date",
                            ),
                            CustomFormFieldWithName(
                              controller: TextEditingController(),
                              hint: "Time",
                              title: "Time",
                            ),
                            SizedBox(height: 12),

                            CustomButton(
                              text: "Book Now",
                              textColor: jwhiteColor,
                              backgroundColor: themeColor,
                              width: MediaQuery.of(context).size.width * 0.9,
                            ),
                            SizedBox(height: 12),
                          ],
                        ),
                      ),
                    )
                  : SizedBox(),
            ),
          ),
        ],
      ),
    );
  }

  Column callToExpertWidget({String? mobile, required String mainTitle}) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.width * 0.1),
        Text(
          mainTitle,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          "Call us now or whatsapp us",
          style: TextStyle(
            color: jGreyColor,
            fontSize: 12,
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(height: 15),

        Text(
          "$mobile",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        SizedBox(height: 25),
        CustomButton(
          width: MediaQuery.of(context).size.width * 0.8,
          text: "Call Now",
          backgroundColor: themeColor,
          textColor: jwhiteColor,
          fontSize: 14,
        ),
      ],
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isActive ? themeColor : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Text(
                  title1,
                  style: TextStyle(
                    color: isActive ? jwhiteColor : jBlackColor,
                    fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                    fontSize: 13,
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
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isActive ? jwhiteColor : themeColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text(
                  title2,
                  style: TextStyle(
                    color: isActive ? jBlackColor : jwhiteColor,
                    fontWeight: isActive ? FontWeight.normal : FontWeight.bold,
                    fontSize: 13,
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

class InstantBookingUserItem extends StatelessWidget {
  const InstantBookingUserItem({
    super.key,
    required this.currentIndex,
    this.selectedIndex,
    this.onTap,
  });
  final int currentIndex;
  final int? selectedIndex;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(3),
        padding: EdgeInsets.all(10),
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          color: jwhiteColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: currentIndex == selectedIndex
                ? themeColor
                : jGreyLightColor.withAlpha(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //
            Image.asset("assets/images/partner.png"),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SvgPicture.asset(
                          currentIndex == selectedIndex
                              ? 'assets/icons/active.svg'
                              : 'assets/icons/inactive.svg',
                        ),
                      ],
                    ),
                  ),
                  //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Preetham Kumar",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: SvgPicture.asset("assets/icons/verified.svg"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [1, 2, 3, 4, 5].map((index) {
                      return Icon(Icons.star, color: themeColor);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
