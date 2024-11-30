import 'package:assessment_app/presentation/modules/match_details/match_details_controller.dart';
import 'package:assessment_app/presentation/widgets/app_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../home/home_page.dart';
import 'bar_chart.dart';

class MatchDetailsScreen extends GetView<MatchDetailsController> {
  MatchDetailsScreen({
    super.key,
  });

  final List<Widget> _pages = <Widget>[
    const OverviewPage(),
  ];

  final appbarHeight = 260.h;

  // 20 for more texts

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          centerTitle: true,
          title: const Text(
            'Match Details',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              CupertinoIcons.back,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                debugPrint('Notification pressed');
              },
              icon: const Icon(
                Icons.notifications_outlined,
                color: Colors.white,
              ),
            ),
          ],
          flexibleSpace: Image.asset(
            'assets/images/match_details_bg.png',
            fit: BoxFit.cover,
            height: appbarHeight + 90,
          ),
          bottom: PreferredSize(
            preferredSize: Size(0, appbarHeight), // Calculated from the design
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ClubInfo(
                              name: 'Barcelona',
                              alignToLeft: true,
                              icon: 'assets/icons/barcelona_icon.png',
                              scorers: [
                                "R. Lewandowski 11’",
                                "A. Garcia 15’",
                                "I. Martin 27’"
                              ],
                            ),
                          ),
                          Expanded(
                            child: ClubInfo(
                              icon: 'assets/icons/girona_icon.png',
                              name: 'Girona',
                              scorers: [
                                "Y. Couto 4’",
                                "A. Garcia 15’",
                                "I. Martin 27’"
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // color: Colors.amber,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '3 - 3',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Text(
                            '(4 - 2)',
                            style: TextStyle(
                              color: AppColors.outline,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Text(
                            'Penalty',
                            style: TextStyle(
                              color: AppColors.outline,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          gap8,
                          SvgPicture.asset('assets/icons/football_icon.svg'),
                          gap20,
                          gap8,
                          // Expanded(
                          //   child:
                          //       Image.asset('assets/icons/laliga_red_Icon.png'),
                          // )
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                          child: Image.asset(
                        'assets/icons/laliga_red_Icon.png',
                        width: 24,
                      )),
                    )
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
                      Tab(icon: Text('Overview')),
                      Tab(icon: Text('Line-up')),
                      Tab(icon: Text('Statistics')),
                      Tab(icon: Text('Matches')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: const SafeArea(child: OverviewPage()),
      ),
    );
  }
}

class ClubInfo extends StatelessWidget {
  const ClubInfo({
    super.key,
    this.alignToLeft = false,
    required this.icon,
    required this.name,
    required this.scorers,
  });

  final bool alignToLeft;
  final String icon;
  final String name;
  final List<String> scorers;

  Widget _buildScorers({required String text}) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.divider,
        fontSize: 14,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          alignToLeft ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        Column(
          children: [
            Image.asset(
              icon,
              width: 50,
            ),
            gap8,
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        gap8,
        ...scorers.map((e) => _buildScorers(text: e)),
      ],
    );
  }
}

class OverviewPage extends GetWidget<MatchDetailsController> {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      children: [
        AppMaterial(
          height: 200,
          radius: 10,
          padding: const EdgeInsets.all(20),
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/highlight_image.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'Watch Highlight',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              gap20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const ClubHighlightIcon(
                    icon: 'assets/icons/barcelona_icon.png',
                    name: 'Barcelona',
                  ),
                  IconButton(
                    icon: Container(
                      height: 50,
                      width: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.7),
                      ),
                      child: Image.asset(
                        'assets/icons/play_icon.png',
                        width: 25,
                      ),
                    ),
                    onPressed: () {},
                  ),
                  const ClubHighlightIcon(
                    icon: 'assets/icons/girona_icon.png',
                    name: 'Girona',
                  ),
                ],
              )
            ],
          ),
        ),
        gap20,
        CardWrapper(
          leading: CardWrapper.buildTitle('Player Of The Match'),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/player.png',
                  width: 65,
                ),
                gap20,
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'F. Dejong',
                      style: TextStyle(fontSize: 16),
                    ),
                    gap4,
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/barcelona_icon.png',
                          width: 20,
                        ),
                        gap4,
                        const Text(
                          'Barcelona',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                )),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 7.5, vertical: 2.5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.primary,
                  ),
                  child: const Text(
                    '8.0',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        gap20,
        CardWrapper(
          leading: CardWrapper.buildTitle('Live Match Momentum'),
          child: Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('60%'),
                          Text('Ball Possession'),
                          Text('40%'),
                        ],
                      ),
                    ),
                    gap4,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: LinearPercentIndicator(
                        percent: 0.6,
                        backgroundColor: AppColors.redPossession,
                        progressColor: AppColors.yellow,
                      ),
                    ),
                  ],
                ),
                gap20,
                // gap20,
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            'assets/icons/barcelona_icon.png',
                            width: 20,
                          ),
                          gap24,
                          Image.asset(
                            'assets/icons/girona_icon.png',
                            width: 20,
                          ),
                        ],
                      ),
                      const Gap(10),
                      if (controller.momentum.isNotEmpty)
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection:
                                Axis.horizontal, // Enable horizontal scrolling
                            child: SizedBox(
                              width: 870, // Dynamic width based on data
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            color: AppColors.lightYellow,
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            color: AppColors.lightRed,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  BarChartSample5(data: controller.momentum),
                                ],
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        gap20,
        CardWrapper(
          leading: Image.asset(
            'assets/icons/barcelona_icon.png',
            width: 24,
          ),
          title: CardWrapper.buildTitle('Match Current Stat'),
          trailng: Image.asset(
            'assets/icons/girona_icon.png',
            width: 24,
          ),
          child: Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 10, bottom: 10),
              child: GetX<MatchDetailsController>(
                builder: (controller) => Stack(
                  children: [
                    Positioned(
                      top: 10,
                      bottom: 36,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: CustomPaint(
                          painter: DashedLineVerticalPainter(),
                          size: const Size(1, double.infinity),
                        ),
                      ),
                    ),
                    ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: SvgPicture.asset(
                            'assets/icons/stopwatch.svg',
                          ),
                        ),
                        ...controller.incidentWidgets,
                        // const StatText('Penalties (4 - 2)'),
                        // StatsRow(
                        //   time: '2',
                        //   homeWidget: RowHalf(
                        //     leading:
                        //         RowHalf.buildPlayer('assets/images/player.png'),
                        //     title: RowHalf.buildTitle('R. Lewandowski'),
                        //     trailing: RowHalf.buildIcon('assets/icons/goal.png'),
                        //   ),
                        //   awayWidget: RowHalf(
                        //     leading:
                        //         RowHalf.buildPlayer('assets/images/player.png'),
                        //     title: RowHalf.buildTitle('R. Lewandowski'),
                        //     trailing: RowHalf.buildIcon('assets/icons/goal.png'),
                        //   ),
                        // )
                      ],
                    ),
                  ],
                ),
              )),
        )
      ],
    );
  }
}

const spacing = EdgeInsets.only(bottom: 36);

class DashedLineVerticalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 3, dashSpace = 5, startY = 0;
    final paint = Paint()
      ..color = AppColors.primary
      ..strokeWidth = 1;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class StatText extends StatelessWidget {
  const StatText(
    this.text, {
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: spacing,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.divider,
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 11),
        ),
      ),
    );
  }
}

class StatsRow extends StatelessWidget {
  const StatsRow({
    super.key,
    required this.homeWidget,
    required this.awayWidget,
    required this.time,
  });

  final Widget? homeWidget;
  final Widget? awayWidget;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        homeWidget ?? const Expanded(child: SizedBox.shrink()),
        Container(
          // width: 20,
          constraints: BoxConstraints(minWidth: (time.length > 2) ? 28 : 22),
          margin: spacing,
          padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            time,
            maxLines: 1,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        awayWidget ?? const Expanded(child: SizedBox.shrink()),
      ],
    );
  }
}

class RowHalf extends StatelessWidget {
  const RowHalf({
    super.key,
    this.leading,
    this.title,
    this.trailing,
    this.isHome = true,
    this.subTitle,
  });

  final Widget? leading;
  final Widget? title;
  final Widget? subTitle;
  final Widget? trailing;
  final bool isHome;

  static buildSubstitution({
    required String inName,
    required String outName,
    bool isHome = true,
  }) =>
      Column(
        children: [
          Row(
            mainAxisAlignment:
                isHome ? MainAxisAlignment.start : MainAxisAlignment.end,
            children: [
              Image.asset(
                'assets/icons/player_in_icon.png',
                width: 15,
              ),
              Text(
                inName,
                style: const TextStyle(color: AppColors.green),
              ),
            ],
          ),
          Row(
            mainAxisAlignment:
                isHome ? MainAxisAlignment.start : MainAxisAlignment.end,
            children: [
              Image.asset(
                'assets/icons/player_out_icon.png',
                width: 15,
              ),
              Text(
                outName,
                style: const TextStyle(color: AppColors.red),
              ),
            ],
          ),
        ],
      );

  static buildTitle(String text) => Text(
        text,
        style: const TextStyle(fontSize: 12),
      );
  static buildSubTitle(String text) => Text(
        text,
        style: const TextStyle(
          fontSize: 10,
          color: AppColors.outline,
        ),
      );
  static buildPlayer(String path) => Image.asset(
        path,
        width: 30,
      );
  static buildIcon(String path) => Image.asset(
        path,
        height: 20,
        width: 20,
      );

  @override
  Widget build(BuildContext context) {
    final children = [
      leading ?? const SizedBox.shrink(),
      const Gap(2),
      Expanded(
          child: Column(
        crossAxisAlignment:
            (isHome) ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          title ?? const SizedBox.shrink(),
          if (subTitle != null) subTitle!
        ],
      )),
      trailing ?? const SizedBox.shrink(),
      gap4
    ];
    return Expanded(
      child: Row(
        children: (isHome) ? children : children.reversed.toList(),
      ),
    );
  }
}

class CardWrapper extends StatelessWidget {
  const CardWrapper({
    super.key,
    required this.leading,
    this.title,
    this.trailng,
    required this.child,
  });

  final Widget leading;
  final Widget? title;
  final Widget? trailng;
  final Widget child;

  static buildTitle(String text) => Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return AppMaterial(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 44,
            color: AppColors.primary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                leading,
                title ?? const SizedBox.shrink(),
                trailng ?? const SizedBox.shrink()
              ],
            ),
          ),
          child,
        ],
      ),
    );
  }
}

class ClubHighlightIcon extends StatelessWidget {
  const ClubHighlightIcon({
    super.key,
    required this.icon,
    required this.name,
  });

  final String icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          icon,
          width: 80,
        ),
        gap8,
        Text(
          name,
          textAlign: TextAlign.end,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
