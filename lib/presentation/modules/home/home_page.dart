import 'package:assessment_app/presentation/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../core/app_routes.dart';
import '../../utils/constants.dart';

import '../../utils/theme.dart';
import '../../widgets/app_card.dart';
import '../../widgets/app_text_form_field.dart';
import 'home_controller.dart';

class MatchesPage extends GetView<HomeScreenController> {
  const MatchesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          centerTitle: true,
          title: Image.asset(
            'assets/images/3scorers_icon.png',
            width: 60,
          ),
          leading: IconButton(
            onPressed: () {
              debugPrint('Menu Tapped');
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
          actions: const [
            SearchTextField(),
            gap20,
          ],
          flexibleSpace: Image.asset(
            'assets/images/home_page_bg.png',
            fit: BoxFit.cover,
            height: 259.h,
          ),
          bottom: PreferredSize(
            preferredSize:
                Size(0, (20 + 61 + 44 + 20).h), // Calculated from the design
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                gap20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextItem(
                      title: "All",
                      isActive: true,
                      onTap: () {},
                      icon: 'assets/icons/all_icon.png',
                    ),
                    TextItem(
                      title: "EPL",
                      onTap: () {},
                      icon: 'assets/icons/epl_icon.png',
                    ),
                    TextItem(
                      title: "La Liga",
                      onTap: () {},
                      icon: 'assets/icons/la_liga_icon.png',
                    ),
                    TextItem(
                      title: "Serie A",
                      onTap: () {},
                      icon: 'assets/icons/serie_a_icon.png',
                    ),
                    TextItem(
                      title: "Bundesliga",
                      onTap: () {},
                      icon: 'assets/icons/bundesliga_icon.png',
                    ),
                    TextItem(
                      title: "Ligue 1",
                      onTap: () {},
                      icon: 'assets/icons/ligue_1_icon.png',
                    ),
                  ],
                ),
                gap20,
                Container(
                  height: 44,
                  color: AppColors.tab_bg,
                  child: const TabBar(
                    indicatorColor: AppColors.primary,
                    indicatorWeight: 4,
                    labelColor: Colors.white,
                    labelStyle: TextStyle(fontWeight: FontWeight.w500),
                    unselectedLabelColor: AppColors.outline,
                    unselectedLabelStyle:
                        TextStyle(fontWeight: FontWeight.w400),
                    tabs: [
                      Tab(icon: Text('Live Matches')),
                      Tab(icon: Text('New Matches')),
                      Tab(icon: Text('Past Matches')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: _homeBody(),
      ),
    );
  }

  Widget _homeBody() {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          AppMaterial(
            onTap: () {
              Get.toNamed(Routes.matchDetails);
            },
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                Container(
                  color: AppColors.primary,
                  height: 44,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Image.asset('assets/icons/laliga_red_Icon.png'),
                              gap8,
                              const Text(
                                'LaLiga',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ),
                        const Expanded(
                          child: Text(
                            'Game Week 15',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Gap(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/icons/barcelona_icon.png',
                          width: 20,
                        ),
                        gap4,
                        const Text('Barcelona'),
                      ],
                    ),
                    const Column(
                      children: [
                        Text(
                          'May 21, 2024',
                          style: TextStyle(
                            color: AppColors.outline,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '3 - 3',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Full-time',
                          style: TextStyle(
                            color: AppColors.outline,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'assets/icons/girona_icon.png',
                          width: 20,
                        ),
                        gap4,
                        const Text('Girona'),
                      ],
                    ),
                  ],
                ),
                gap8,
                const Divider(
                  color: AppColors.divider,
                  thickness: 0.5,
                ),
                gap8,
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TextItem extends StatelessWidget {
  const TextItem({
    super.key,
    required this.onTap,
    required this.title,
    this.isActive = false,
    required this.icon,
  });

  final VoidCallback onTap;
  final String title;
  final String icon;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AppMaterial(
      color: Colors.transparent,
      elevation: 0,
      radius: 0,
      showOutline: false,
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? AppColors.primary : AppColors.black2,
            ),
            child: Image.asset(
              icon,
            ),
          ),
          const Gap(5),
          Text(
            title,
            style: TextStyle(
              color: isActive ? Colors.white : AppColors.inactive,
              fontWeight: isActive ? FontWeight.w500 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    this.textEditingController,
  });

  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34.h,
      width: 132.w,
      child: AppTextFormField(
        textEditingController: textEditingController,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: kLineHeight(18, fontSize: 16),
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
            top: 5.0,
            left: 0,
            right: 0.0,
          ),
          hintText: 'Search...',
          hintStyle: TextStyle(
            color: AppColors.outline,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: kLineHeight(18, fontSize: 16),
          ),
          isDense: true,
          prefixIcon: Padding(
            padding:
                const EdgeInsets.only(left: 0, top: 9, bottom: 9, right: 0),
            child: SvgPicture.asset(
              'assets/icons/search.svg',
              width: 20,
            ),
          ),
          prefixIconConstraints: BoxConstraints.tight(const Size(34, 34)),
          focusedBorder: kGetInputBorder(Colors.white),
          enabledBorder: kGetInputBorder(AppColors.outline),
        ),
      ),
    );
  }
}
