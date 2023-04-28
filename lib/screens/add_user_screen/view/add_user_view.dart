import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:moon_flutter_getx_architecture/app/app_colors.dart';
import 'package:moon_flutter_getx_architecture/app/app_strings.dart';
import 'package:moon_flutter_getx_architecture/widgets/common_app_input.dart';
import 'package:moon_flutter_getx_architecture/screens/add_user_screen/view/add_user_controller.dart';

class AddUserView extends GetView<AddUserController> {
  const AddUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _bodyWidget(),
      ),
    );
  }

  // widget method for appbar
  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(AppStrings.addUser),
      centerTitle: true,
    );
  }

  // widget method of body
  Center _bodyWidget() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            AppStrings.plsFillBelowDetailsToAddUser,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          CommonAppInput(
            textEditingController: controller.nameController,
            focusNode: controller.nameNode,
            nextFocusNode: controller.jobNode,
            borderRadius: 10,
            hintText: AppStrings.nameHint,
            hintStyle: const TextStyle(
              color: AppColors.colorFontGrey,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          CommonAppInput(
            textEditingController: controller.jobController,
            focusNode: controller.jobNode,
            borderRadius: 10,
            hintText: AppStrings.jobHint,
            hintStyle: const TextStyle(
              color: AppColors.colorFontGrey,
              fontWeight: FontWeight.w500,
            ),
            onSubmitted: (_) => controller.onAddUser(),
          ),
          const SizedBox(height: 10),
          _addUserButton(),
        ],
      ).marginSymmetric(horizontal: 20),
    );
  }

  // widget method of add user button
  ElevatedButton _addUserButton() {
    return ElevatedButton(
      onPressed: () => controller.onAddUser(),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: const BorderSide(color: AppColors.colorBlack),
          ),
        ),
      ),
      child: const Text(
        AppStrings.add,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ).marginSymmetric(horizontal: 20, vertical: 5),
    );
  }
}
