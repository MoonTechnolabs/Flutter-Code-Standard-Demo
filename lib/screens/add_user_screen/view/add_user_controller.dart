import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:moon_flutter_getx_architecture/utils/utils.dart';
import 'package:moon_flutter_getx_architecture/utils/either.dart';
import 'package:moon_flutter_getx_architecture/app/app_class.dart';
import 'package:moon_flutter_getx_architecture/app/app_routes.dart';
import 'package:moon_flutter_getx_architecture/app/app_strings.dart';
import 'package:moon_flutter_getx_architecture/network/repository/api_repository.dart';

class AddUserController extends GetxController {
  // TextEditingControllers for text fields
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  // FocusNodes to manage the text field focus
  FocusNode nameNode = FocusNode();
  FocusNode jobNode = FocusNode();

  // Final method to be called for API call (i.e. call on button tap)
  void onAddUser() async {
    _addUserValidation().fold(
      (l) => Utils.commonSnackBar(l, false),
      (m) => null,
      (r) => _addUserApiCall(),
    );
  }

  // Add user API call
  void _addUserApiCall() async {
    AppClass().showLoading(true);
    await apiRepository.addUser(name: nameController.text, job: jobController.text).then(
      (value) => _onAddUserApiSuccess(),
      onError: (error) {
        Utils.commonSnackBar(error.toString(), false);
        AppClass().showLoading(false);
      },
    );
  }

  // this method will be called when add user API gets success
  void _onAddUserApiSuccess() {
    AppClass().showLoading(false);
    Utils.commonSnackBar(AppStrings.userAddedSuccessfully, true);
    nameController.clear();
    jobController.clear();
    Get.offAllNamed(AppRoutes.homePage);
  }

  /*
   form validation for add user
   Left - Represents error - (means need to show error message)
   Middle - Will always return null
   Right - Represents Success - (means form data is valid)
  */
  Either<String, dynamic, bool> _addUserValidation() {
    if (nameController.text.trim().isEmpty) {
      return const Left(AppStrings.plsEnterName);
    } else if (jobController.text.trim().isEmpty) {
      return const Left(AppStrings.plsEnterJob);
    }
    return const Right(true);
  }
}
