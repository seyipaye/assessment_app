import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'colors.dart';
import 'values.dart';

const gap4 = Gap(4);
const gap8 = Gap(8);
const gap16 = Gap(16);
const gap20 = Gap(20);
const gap24 = Gap(24);
const gap32 = Gap(32);

double kLineHeight(double height, {double fontSize = 1}) => height / fontSize;

const kDefaultPadding = 24.0;

const kSupport = '08168706767';

const kConnectionTestUrl = 'https://api.ipify.org/';

const kCaptiveportalUrl = 'http://10.5.50.1'; //'http://wifi.usefastlink.com';

const kCaptiveLogin = '$kCaptiveportalUrl/login';

final kIsWebMobile = kIsWeb &&
    (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.android);

final kIsWebAndroid = kIsWeb && defaultTargetPlatform == TargetPlatform.android;

SizedBox spacer({double h = AppPadding.p24, double w = AppPadding.p24}) =>
    SizedBox(height: h, width: w);

const kMinButtonSize = Size(239, 48);

Future get kAnimationDelay => Future.delayed(const Duration(milliseconds: 250));

doAfterBuild(VoidCallback callback) {
  SchedulerBinding.instance.addPostFrameCallback((_) {
    callback.call();
  });
}

RoundedRectangleBorder kRoundedSemiRectangularBorder({double radius = 16}) =>
    RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(radius),
      ),
    );

BorderRadius kSemiRectangularRadius({double radius = 16}) =>
    BorderRadius.vertical(
      top: Radius.circular(radius),
    );

BorderRadius kRectangularRadius({double radius = 16}) => BorderRadius.all(
      Radius.circular(radius),
    );

RoundedRectangleBorder kRoundedRectangularBorder({double radius = 16}) =>
    RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(radius),
      ),
    );

BoxDecoration kGradientDecoration = BoxDecoration(
  border: Border.all(color: Colors.white.withOpacity(0.25)),
  borderRadius: const BorderRadius.all(
    Radius.circular(AppSize.s100),
  ),
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.white.withOpacity(0.3),
      Colors.white.withOpacity(0.1),
    ],
  ),
);

BoxShadow kDropShadow(double dx, double dy, double blurRadius,
        {color = AppColors.offset}) =>
    BoxShadow(
      offset: Offset(dx, dy),
      blurRadius: blurRadius,
      spreadRadius: blurRadius,
      color: color,
    );

kMoneyTextStyle({
  double? fontsize = 20,
  FontWeight? fontWeight,
  Color? color,
}) =>
    TextStyle(
      fontSize: fontsize,
      fontFamily: '.SF UI Display',
      fontWeight: fontWeight,
      letterSpacing: .75,
      color: color,
    );

const kDivider = Divider(
  color: AppColors.outline,
  thickness: 0.5,
);
