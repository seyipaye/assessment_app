import 'package:assessment_app/presentation/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/strings.dart';
import '../../utils/values.dart';
import 'home_controller.dart';
import 'home_page.dart';

const margin = EdgeInsets.symmetric(horizontal: AppPadding.p20);

class HomeScreen extends GetView<HomeScreenController> {
  HomeScreen({
    super.key,
  });

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);

  final List<Widget> _pages = <Widget>[
    const MatchesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold(
      body: Obx(() {
        controller.selectedPage;
        // return _pages.elementAt(controller.selectedPage);
        return _pages.first;
      }),
      bottomNavigationBar: Obx(() => AppBottomNavBar(
            selectedIndex: controller.selectedPage,
            onTabChange: (index) {
              controller.selectedPage = index;
            },
          )),
    );
    return scaffold;
  }
}

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    super.key,
    required this.onTabChange,
    required this.selectedIndex,
  });

  final void Function(int) onTabChange;
  final int selectedIndex;

  _buildItem({
    required String label,
    required Widget icon,
  }) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: icon,
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.navBorderColor),
        ),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.black3,
        currentIndex: selectedIndex,
        onTap: onTabChange,
        // indicatorColor: Colors.transparent,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),

        items: <BottomNavigationBarItem>[
          _buildItem(
            label: 'Home',
            icon: const ImageIcon(
              AssetImage('assets/icons/home_icon.png'),
              size: 18,
            ),
          ),
          _buildItem(
            icon: const ImageIcon(
              AssetImage('assets/icons/matches_icon.png'),
              size: 22,
            ),
            label: 'Matches',
          ),
          _buildItem(
            icon: const ImageIcon(
              AssetImage('assets/icons/fantacy_icon.png'),
              size: 18,
            ),
            label: 'Fantasy',
          ),
          _buildItem(
            icon: const ImageIcon(
              AssetImage('assets/icons/shop_icon.png'),
              size: 18,
            ),
            label: 'Shop',
          ),
          _buildItem(
            icon: ClipOval(
              child: Image.network(
                kUrl,
                fit: BoxFit.cover,
                width: 24,
                height: 24,
              ),
            ),
            label: 'My Profile',
          ),
        ],
      ),
    );
  }
}
