import 'package:demo_app/navigation/presentation/screens/navigation_menu.dart';

import '../../../home/presentation/screens/home_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{
  @override
  void onReady() {
    navigateToHome();
    super.onReady();
  }

  Future navigateToHome() async {
    await Future.delayed(Duration(seconds:3));
    Get.to(()=>NavigationMenu());
  }
}