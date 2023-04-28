import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:moon_flutter_getx_architecture/app/app_class.dart';
import 'package:moon_flutter_getx_architecture/app/app_routes.dart';
import 'package:moon_flutter_getx_architecture/app/app_strings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // get_storage initialization
  await GetStorage.init();

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.moonFlutterGetxArchitecture,
      theme: ThemeData(primarySwatch: Colors.indigo),
      debugShowCheckedModeBanner: false,
      builder: (context, widget) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: _getMainAppViewBuilder(context, widget),
        );
      },
      initialRoute: AppRoutes.splashPage,
      getPages: AppRoutes.getPages,
    );
  }

  /// Create main app view builder
  Widget _getMainAppViewBuilder(BuildContext context, Widget? widget) {
    return Obx(() {
      return IgnorePointer(
        ignoring: AppClass().isLoading.isTrue,
        child: Stack(
          children: [
            widget ?? const Offstage(),
            if (AppClass().isLoading.isTrue) // Top level loading (used while api calls)
              Container(
                color: Colors.black12,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
          ],
        ),
      );
    });
  }
}
