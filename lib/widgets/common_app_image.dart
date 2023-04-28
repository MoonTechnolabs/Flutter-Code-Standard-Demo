// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moon_flutter_getx_architecture/app/app_images.dart';
import 'package:moon_flutter_getx_architecture/widgets/common_app_shimmer.dart';

/// Common app image which handles network, assets and local file paths
class CommonAppImage extends StatelessWidget {
  final String imagePath;
  final double radius;
  final double height;
  final double width;
  final BoxFit fit;
  final bool isCircle;
  final Color? color;

  const CommonAppImage({
    Key? key,
    required this.imagePath,
    required this.height,
    required this.width,
    this.radius = 0,
    this.isCircle = false,
    this.fit = BoxFit.cover,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          borderRadius: isCircle ? null : BorderRadius.circular(radius),
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle),
      child: imagePath.isEmpty
          ? Image.asset(
              AppImages.icMoon,
              height: height,
              width: width,
            )
          : imagePath.startsWith('http')
              ? imagePath.endsWith('svg')
                  ? SvgPicture.network(
                      imagePath,
                      height: height,
                      width: width,
                      fit: fit,
                      color: color,
                      placeholderBuilder: (_) => CommonAppShimmer.rectangular(
                        height: height,
                      ),
                    )
                  : CachedNetworkImage(
                      imageUrl: imagePath,
                      height: height,
                      width: width,
                      fit: fit,
                      color: color,
                      placeholder: (context, url) => CommonAppShimmer.rectangular(
                        height: height,
                      ),
                      errorWidget: (context, url, error) => Image.asset(
                        AppImages.icMoon,
                        height: height,
                        width: width,
                      ),
                    )
              : imagePath.contains('assets')
                  ? imagePath.endsWith('svg')
                      ? SvgPicture.asset(
                          imagePath,
                          height: height,
                          width: width,
                          fit: fit,
                          color: color,
                        )
                      : Image.asset(
                          imagePath,
                          height: height,
                          width: width,
                          fit: fit,
                          color: color,
                        )
                  : imagePath.endsWith('svg')
                      ? SvgPicture.file(
                          File(imagePath),
                          height: height,
                          width: width,
                          fit: fit,
                          color: color,
                        )
                      : Image.file(
                          File(imagePath),
                          height: height,
                          width: width,
                          fit: fit,
                          color: color,
                        ),
    );
  }
}
