import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalinq/routes.dart';
import 'package:kalinq/utils/theme.dart';

class CampaignList extends StatefulWidget {
  const CampaignList({super.key});

  @override
  State<CampaignList> createState() => _CampaignListState();
}

class _CampaignListState extends State<CampaignList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: themeColor,
        onPressed: () {
          Get.toNamed(AppRoutes.createCampaign);
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: Text(
          'Create\n New Campaigns',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}
