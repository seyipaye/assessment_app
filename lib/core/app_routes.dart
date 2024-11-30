import 'package:assessment_app/presentation/modules/home/home_controller.dart';
import 'package:assessment_app/presentation/modules/home/home_screen.dart';
import 'package:assessment_app/presentation/modules/match_details/match_details_controller.dart';
import 'package:assessment_app/presentation/modules/match_details/match_details_screen.dart';
import 'package:get/get.dart';

class Routes {
  // Auth
  static const splash = '/';
  static const home = '/home';
  static const matchDetails = '/match-details';
}

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => HomeScreen(),
      binding: BindingsBuilder(() {
        Get.put(HomeScreenController());
      }),
    ),
    GetPage(
      name: Routes.matchDetails,
      page: () => MatchDetailsScreen(),
      binding: BindingsBuilder(() {
        Get.put(MatchDetailsController());
      }),
    ),
  ];
}
