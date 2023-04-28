import 'package:get/get.dart';
import 'package:moon_flutter_getx_architecture/screens/add_user_screen/view/add_user_controller.dart';

class AddUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddUserController());
  }
}
