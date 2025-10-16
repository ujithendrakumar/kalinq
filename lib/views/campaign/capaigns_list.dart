import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as badges;
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kalinq/components/custom_formfield.dart';
import 'package:kalinq/routes.dart';
import 'package:kalinq/utils/theme.dart';

import 'components/gig_item.dart';

class CampaignList extends StatefulWidget {
  const CampaignList({super.key});

  @override
  State<CampaignList> createState() => _CampaignListState();
}

class _CampaignListState extends State<CampaignList> {
  bool _isPrivate = true;

  Widget _buildVisibilityToggle() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _isPrivate = true),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: _isPrivate ? themeColor : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Private',
                  style: TextStyle(
                    color: _isPrivate ? Colors.white : Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _isPrivate = false),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: !_isPrivate ? themeColor : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Public',
                  style: TextStyle(
                    color: !_isPrivate ? Colors.white : Colors.black54,
                    fontWeight: FontWeight.bold,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(scrolledUnderElevation: 0),
      backgroundColor: jBgColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: themeColor,
        onPressed: () {
          Get.toNamed(AppRoutes.createCampaign);
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomFormField(
                        controller: TextEditingController(),
                        hint: "Search..",
                        prefixIcon: SvgPicture.asset('assets/icons/search.svg'),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: badges.Badge(
                        label: Text(''),
                        offset: Offset(7, -6),
                        backgroundColor: themeColor,
                        child: SvgPicture.asset(
                          'assets/icons/direct-inbox.svg',
                          height: 25,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: badges.Badge(
                        offset: Offset(4, -4),
                        label: Text(''),
                        backgroundColor: themeColor,
                        child: SvgPicture.asset(
                          'assets/icons/bell.svg',
                          height: 25,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                _buildVisibilityToggle(),
                //
                Expanded(
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    // color: Colors.green,
                    child: ListView(
                      children: [0, 1, 2, 3, 4, 5].map((i) {
                        return GigItem(
                          currentIndex: i,
                          onTap: () {
                            //redirect to the page
                            print("Campaing List : $i");
                            Get.toNamed(
                              '/campaign/details',
                              parameters: {'id': '$i', 'title': 'My Campaign'},
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),

            /*
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      //
                      Row(
                        children: [
                          //
                          Expanded(
                            child: CustomFormField(
                              controller: TextEditingController(),
                              hint: "Search..",
                              prefixIcon: SvgPicture.asset(
                                'assets/icons/search.svg',
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: badges.Badge(
                              label: Text(''),
                              offset: Offset(7, -6),
                              backgroundColor: themeColor,
                              child: SvgPicture.asset(
                                'assets/icons/direct-inbox.svg',
                                height: 25,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: badges.Badge(
                              offset: Offset(4, -4),
                              label: Text(''),
                              backgroundColor: themeColor,
                              child: SvgPicture.asset(
                                'assets/icons/bell.svg',
                                height: 25,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      _buildVisibilityToggle(),
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    print(index);
                    return ListTile(
                      leading: const SizedBox.shrink(),
                      title: Text(index.toString()),
                    );
                  }, childCount: 50),
                ),
              ],
            ),
            */
          ),
        ),
      ),
    );
  }
}
