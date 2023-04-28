import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:moon_flutter_getx_architecture/app/app_images.dart';
import 'package:moon_flutter_getx_architecture/widgets/common_app_image.dart';
import 'package:moon_flutter_getx_architecture/screens/splash_screen/view/splash_controller.dart';

class SplashScreenView extends GetView<SplashController> {
  SplashScreenView({super.key});

  // controller needs to be initialize like this if any page does not needs the binding
  @override
  final controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(context),
    );
  }

  // body widget method
  Center _bodyWidget(BuildContext context) {
    return Center(
      child: CommonAppImage(
        imagePath: AppImages.icMoon,
        height: MediaQuery.of(context).size.width / 2,
        width: MediaQuery.of(context).size.width / 2,
        fit: BoxFit.contain,
      ),
    );
  }
}
