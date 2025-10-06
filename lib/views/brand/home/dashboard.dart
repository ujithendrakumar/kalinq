import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kalinq/components/custom_formfield.dart';
import 'package:kalinq/utils/theme.dart';

import '../components/brand_person_box.dart';

class BrandDashboard extends StatefulWidget {
  const BrandDashboard({super.key});

  @override
  State<BrandDashboard> createState() => _BrandDashboardState();
}

class _BrandDashboardState extends State<BrandDashboard> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (mounted) {
      setState(() {
        _selectedIndex = index;
        categoriesList[_selectedIndex]['isSelected'] = true;
        for (int i = 0; i < categoriesList.length; i++) {
          if (i != _selectedIndex) {
            categoriesList[i]['isSelected'] = false;
          }
        }
      });
    }
  }

  List<Map<String, dynamic>> categoriesList = [
    {"name": "All", "isSelected": true},
    {"name": "UGC", "isSelected": false},
    {"name": "Influencers", "isSelected": false},
    {"name": "Partners", "isSelected": false},
  ];
  Widget categoryItem({
    required String name,
    required bool isSelected,
    required int index,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _onItemTapped(index),
      child: Container(
        margin: EdgeInsets.only(right: 8.0),
        padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 6.0),
        decoration: BoxDecoration(
          color: isSelected ? jyellowLightColor : jwhiteColor,
          borderRadius: BorderRadius.circular(108.0),
          border: Border.all(
            color: isSelected ? themeColor : Colors.grey.shade300,
            width: 1.0,
          ),
        ),
        child: Text(
          name,
          style: TextStyle(
            fontSize: 14,
            color: isSelected ? themeColor : jBlackColor,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
          ),
        ),
        // child: ElevatedButton(
        //   style: ElevatedButton.styleFrom(
        //     elevation: isSelected ? 1 : 0,
        //     backgroundColor: isSelected ? jyellowLightColor : jwhiteColor,
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(108.0),
        //     ),
        //   ),
        //   onPressed: () {},
        //   child:
        // ),
      ),
    );
  }

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
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 9,
                    child: CustomFormField(
                      controller: TextEditingController(),
                      hint: "Search...",
                      enablePrefixIcon: true,
                      prefixIcon: const Icon(FeatherIcons.search, size: 20),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: () {
                        Get.toNamed('/notifications');
                      },
                      icon: const Icon(
                        FeatherIcons.bell,
                        size: 24,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Top Opportunities For You ✨",
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
          ),
          // Add more slivers here as needed
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: 10),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: categoriesList.asMap().entries.map((entry) {
                    int idx = entry.key;
                    Map<String, dynamic> cat = entry.value;
                    return categoryItem(
                      name: cat['name'],
                      isSelected: cat['isSelected'],
                      index: idx,
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return BrandPersonBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
