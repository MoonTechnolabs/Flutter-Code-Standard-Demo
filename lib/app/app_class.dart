import 'package:get/get.dart';

class AppClass {
  static final AppClass _singleton = AppClass._internal();

  factory AppClass() => _singleton;

  AppClass._internal();

  // bool to user when need to show top level loader
  RxBool isLoading = false.obs;

  void showLoading(bool value) => isLoading.value = value;
}
