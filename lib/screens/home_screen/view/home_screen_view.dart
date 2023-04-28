import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:moon_flutter_getx_architecture/app/app_colors.dart';
import 'package:moon_flutter_getx_architecture/app/app_images.dart';
import 'package:moon_flutter_getx_architecture/app/app_routes.dart';
import 'package:moon_flutter_getx_architecture/app/app_strings.dart';
import 'package:moon_flutter_getx_architecture/widgets/common_app_image.dart';
import 'package:moon_flutter_getx_architecture/network/models/get_user_list_model.dart';
import 'package:moon_flutter_getx_architecture/screens/home_screen/view/home_controller.dart';

class HomeScreenView extends GetView<HomeController> {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      floatingActionButton: _floatingButtonWidget(),
      body: _bodyWidget(),
    );
  }

  // widget method of appbar
  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(AppStrings.homePage),
      centerTitle: true,
    );
  }

  // floating button widget method
  FloatingActionButton _floatingButtonWidget() {
    return FloatingActionButton(
      onPressed: () {
        Get.toNamed(AppRoutes.addUserPage);
      },
      splashColor: Colors.indigoAccent.withOpacity(0.6),
      child: const Icon(Icons.add),
    );
  }

  // body widget method
  Obx _bodyWidget() {
    return Obx(() {
      return ListView.builder(
        itemCount: controller.userList.length,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 10),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          var item = controller.userList[index];
          return _userItem(item);
        },
      );
    });
  }

  // user list item widget method
  Widget _userItem(Data item) {
    return Row(
      children: [
        _imageView(item),
        _commonSize(width: 10),
        _cardView(item),
      ],
    ).marginAll(10);
  }

  // common sized box widget method
  SizedBox _commonSize({double? height, double? width}) {
    return SizedBox(width: width, height: height);
  }

  // image view for list of users
  Container _imageView(Data item) {
    return Container(
      padding: const EdgeInsets.all(1.5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.colorIndigo.withOpacity(0.5),
      ),
      child: CommonAppImage(
        imagePath: item.avatar ?? AppImages.icMoon,
        height: 50,
        width: 50,
        isCircle: true,
        fit: BoxFit.contain,
      ),
    );
  }

  // card view for list of users
  Expanded _cardView(Data item) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.indigoAccent.withOpacity(0.2))),
        child: InkWell(
          onTap: () {},
          splashColor: Colors.indigoAccent.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${item.firstName ?? ''} ${item.lastName ?? ''}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              _commonSize(height: 5),
              Text(
                item.email ?? '',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.colorFontGrey.withOpacity(0.7),
                ),
              ),
            ],
          ).marginAll(10),
        ),
      ),
    );
  }
}
