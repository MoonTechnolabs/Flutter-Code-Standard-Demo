import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:moon_flutter_getx_architecture/app/app_class.dart';
import 'package:moon_flutter_getx_architecture/app/app_strings.dart';
import 'package:moon_flutter_getx_architecture/network/models/get_user_list_model.dart';
import 'package:moon_flutter_getx_architecture/network/repository/api_repository.dart';
import 'package:moon_flutter_getx_architecture/utils/utils.dart';

class HomeController extends GetxController {
  // observable variable of which value can be changed
  RxList<Data> userList = <Data>[].obs;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getUserList();
    });
  }

  // API call to get the user list
  void getUserList() async {
    AppClass().showLoading(true);

    await apiRepository.userList().then(
      (value) {
        AppClass().showLoading(false);

        if (value.data != null) {
          userList.value = value.data ?? [];
          Utils.commonSnackBar(AppStrings.dataGotSuccessfully, true);
        }
      },
      onError: (error) {
        AppClass().showLoading(false);
        Utils.commonSnackBar(error.toString(), false);
      },
    );
  }
}
