// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

// import '../../../domain/providers/local_notification_service.dart';

class HomeScreenController extends GetxController {
  final _selectedPage = 1.obs;

  static HomeScreenController get instance => Get.find<HomeScreenController>();

  int get selectedPage => _selectedPage.value;

  set selectedPage(page) => _selectedPage.value = page;

  @override
  void onInit() async {
    // _initNotification();
    // startSocket();
    super.onInit();
  }
}
