import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'core/app_routes.dart';

var initialRoute = Routes.home;

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Colors.white, // status bar color
      statusBarIconBrightness: Brightness.light, // status bar icons' color
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(430.13, 932),
      minTextAdapt: true,
      splitScreenMode: true,
    );

    return GetMaterialApp(
      title: 'FastLink Bills',
      debugShowCheckedModeBanner: false,
      //initialRoute: Routes.login,
      initialRoute: initialRoute,
      initialBinding: BindingsBuilder(
        () {
          // It is mandatory for all of these to be initialized for the effectual running of the app

          // T for Thanks

          /*
          Please note:
          Auth Repository & Provider are stand alone
          App Repository & Provider depends on them 
          */

          // Get.put<AuthRepository>(AuthRepository(), permanent: true);
          // Get.put<AppRepository>(AppRepository(), permanent: true);
          // Get.lazyPut<AuthProvider>(() => AuthProvider(), fenix: true);
        },
      ),
      getPages: AppPages.routes,
      // theme: getLightTheme(),
    );
  }
}
