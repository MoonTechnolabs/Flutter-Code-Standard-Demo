import 'package:flutter/material.dart';
import 'package:moon_flutter_getx_architecture/app/app_colors.dart';
import 'package:shimmer/shimmer.dart';

/// Common shimmer view
class CommonAppShimmer extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  /// Get rectangular shimmer
  const CommonAppShimmer.rectangular(
      {Key? key,
      this.width = double.infinity,
      required this.height,
      this.shapeBorder = const RoundedRectangleBorder()})
      : super(key: key);

  /// Get circular shimmer
  const CommonAppShimmer.circular(
      {Key? key,
      this.width = double.infinity,
      required this.height,
      this.shapeBorder = const CircleBorder()})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: AppColors.colorIndigo.withOpacity(0.3),
        highlightColor: AppColors.colorIndigo.withOpacity(0.1),
        period: const Duration(seconds: 2),
        child: Container(
          width: width,
          height: height,
          decoration: ShapeDecoration(
            color: AppColors.colorGreen,
            shape: shapeBorder,
          ),
        ),
      );
}
