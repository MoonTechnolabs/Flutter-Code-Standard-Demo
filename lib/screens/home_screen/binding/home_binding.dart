import 'package:get/get.dart';
import 'package:moon_flutter_getx_architecture/screens/home_screen/view/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
