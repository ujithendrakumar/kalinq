import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kalinq/utils/theme.dart';

import '../campaign/capaigns_list.dart';
import '../kalinq/kalinq_home.dart';
import '../wallet/wallet.dart';
import 'home/dashboard.dart';

class BrandHomeScreen extends StatefulWidget {
  const BrandHomeScreen({super.key});

  @override
  State<BrandHomeScreen> createState() => _BrandHomeScreenState();
}

class _BrandHomeScreenState extends State<BrandHomeScreen> {
  int _selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  void _onItemTapped(int index) {
    if (mounted) {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildPage(String label) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text(
          label,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          if (mounted) {
            setState(() {
              _selectedIndex = index;
            });
          }
        },
        children: [
          BrandDashboard(),
          Wallet(),
          CampaignList(),
          KalinqHome(),
          _buildPage('Profile'),
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(top: 1),
        color: Colors.white,
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => _onItemTapped(0),
                child: Container(
                  margin: EdgeInsets.only(top: 10),

                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: _selectedIndex == 0
                        ? themeColor.withValues(alpha: 0.1)
                        : Colors.transparent,
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/home.svg',
                    colorFilter: ColorFilter.mode(
                      _selectedIndex == 0 ? themeColor : Colors.grey,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => _onItemTapped(1),
                child: Container(
                  margin: EdgeInsets.only(top: 10),

                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: _selectedIndex == 1
                        ? themeColor.withOpacity(0.1)
                        : Colors.transparent,
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/wallet.svg',
                    colorFilter: ColorFilter.mode(
                      _selectedIndex == 1 ? themeColor : Colors.grey,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => _onItemTapped(2),
                child: Container(
                  margin: EdgeInsets.only(top: 10),

                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: _selectedIndex == 2
                        ? themeColor.withOpacity(0.1)
                        : Colors.transparent,
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/cat.svg',
                    colorFilter: ColorFilter.mode(
                      _selectedIndex == 2 ? themeColor : Colors.grey,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => _onItemTapped(3),
                child: Container(
                  margin: EdgeInsets.only(top: 10),

                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: _selectedIndex == 3
                        ? themeColor.withOpacity(0.1)
                        : Colors.transparent,
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/kalinq.svg',
                    colorFilter: ColorFilter.mode(
                      _selectedIndex == 3 ? themeColor : Colors.grey,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => _onItemTapped(4),
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  width: 24,
                  height: 24,

                  child: Icon(
                    FeatherIcons.user,
                    color: _selectedIndex == 4 ? themeColor : Colors.grey,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
