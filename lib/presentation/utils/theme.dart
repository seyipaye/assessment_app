import 'package:flutter/material.dart';

import 'colors.dart';
import 'constants.dart';
import 'strings.dart';
import 'styles.dart';

kGetInputBorder(Color color) => OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
      borderSide: BorderSide(color: color),
    );

ThemeData getLightTheme() {
  return ThemeData(
    // colorScheme: ColorScheme.fromSwatch(
    //   primarySwatch: AppColors.primary,
    //   accentColor: AppColors.primary,
    //   errorColor: AppColors.red,
    // ),
    fontFamily: kRaleway,
    brightness: Brightness.light,
    useMaterial3: true,

    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),

    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
    ),
    //splashColor: Colors.black.withOpacity(0.2),
    scaffoldBackgroundColor: Colors.white,
    drawerTheme: const DrawerThemeData(scrimColor: AppColors.scrim),
    // textTheme: GoogleFonts.poppinsTextTheme(),
    // textTheme: textTheme.copyWith(
    //   titleLarge: getTitleLargeStyle(color: Colors.black),
    //   titleMedium: getTitleMediumStyle(color: Colors.black),
    //   titleSmall: getTitleSmallStyle(color: AppColors.text),
    //   //labelLarge: getBodyLargeStyle(color: AppColors.otpText),
    //   labelSmall: getLabelSmallStyle(color: AppColors.label),
    //   bodyLarge: getBodyLargeStyle(color: AppColors.text),
    //   bodyMedium: getBodyMediumStyle(color: AppColors.text),
    //   bodySmall: getBodySmallStyle(color: AppColors.label),
    // ),
    dialogTheme: DialogTheme(
      shape: kRoundedRectangularBorder(),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      titleTextStyle: getAppBarTitleStyle(color: Colors.black),
    ),
    iconTheme: const IconThemeData(size: 20),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        minimumSize: const Size(239, 48),
        backgroundColor: AppColors.primary,
        elevation: 0,
        textStyle: const TextStyle(
          fontFamily: kRaleway,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        shape: kRoundedRectangularBorder(),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
      minimumSize: const Size(0, 48),
      textStyle: TextStyle(
          fontFamily: kRaleway,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 1,
          height: kLineHeight(28, fontSize: 16)),
      shape: kRoundedRectangularBorder(),
      //onPrimary: Colors.white,
    )),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(0, 48),
        textStyle: const TextStyle(
          fontFamily: kRaleway,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 1,
        ),
        side: const BorderSide(color: AppColors.outline, width: 1),
        shape: kRoundedRectangularBorder(),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      helperMaxLines: 2,
      errorMaxLines: 2,
      isDense: true,
      focusedBorder: kGetInputBorder(AppColors.primary),
      enabledBorder: kGetInputBorder(AppColors.outline),
      errorBorder: kGetInputBorder(AppColors.red),
      focusedErrorBorder: kGetInputBorder(AppColors.red),
      hintStyle: getLabelSmallStyle(
        color: AppColors.hint,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      indicatorColor: AppColors.primary.shade100,
      //backgroundColor: Colors.white,
      elevation: 10,
      surfaceTintColor: Colors.white,
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const IconThemeData(size: 20, color: AppColors.primary);
        }
        return const IconThemeData(size: 20, color: AppColors.buttonText);
      }),
      labelTextStyle: WidgetStateProperty.all(
          getBodyMediumStyle(color: AppColors.buttonText)),
    ),
  );
}

ThemeData getDarkTheme() {
  final theme = ThemeData(brightness: Brightness.dark);

  return ThemeData.dark().copyWith(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: AppColors.primary,
      accentColor: AppColors.primary,
      errorColor: AppColors.red,
    ),
    scaffoldBackgroundColor: AppColors.scaffold_bg,
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      titleTextStyle: getAppBarTitleStyle(color: Colors.black),
    ),
    iconTheme: const IconThemeData(size: 20, color: Colors.white),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      minimumSize: const Size(0, 48),
      textStyle: const TextStyle(
        fontFamily: kRaleway,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 1,
      ),
      shape: kRoundedRectangularBorder(),
    )),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
      minimumSize: const Size(0, 48),
      textStyle: const TextStyle(
        fontFamily: kRaleway,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 1,
      ),
      shape: kRoundedRectangularBorder(),
      //onPrimary: Colors.white,
    )),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.buttonText,
        minimumSize: const Size(0, 48),
        textStyle: const TextStyle(
          fontFamily: kRaleway,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 1,
        ),
        shape: kRoundedRectangularBorder(),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      focusedBorder: kGetInputBorder(AppColors.primary),
      enabledBorder: kGetInputBorder(AppColors.outline),
    ),
  );
}
