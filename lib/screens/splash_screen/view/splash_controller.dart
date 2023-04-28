import 'package:get/get.dart';
import 'package:moon_flutter_getx_architecture/app/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _manageNavigateAfterSplash();
  }

  // Where to navigate after splash that code goes here
  void _manageNavigateAfterSplash() {
    Future.delayed(
      const Duration(seconds: 2),
      () => Get.offAllNamed(AppRoutes.homePage),
    );
  }
}
