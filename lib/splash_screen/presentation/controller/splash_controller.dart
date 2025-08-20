import 'package:demo_app/presentation/naviagation/screens/navigation_menu.dart';
import 'package:demo_app/presentation/sign_in/screens/login_screen.dart';

import '../../../presentation/home/screens/home_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{
  @override
  void onReady() {
    navigateToHome();
    super.onReady();
  }

  Future navigateToHome() async {
    await Future.delayed(Duration(seconds:3));
    Get.to(()=>LoginScreen());
  }
}