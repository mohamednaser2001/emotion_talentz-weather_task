

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({Key? key, required this.height, required this.width, this.radius=6.0, this.color}) : super(key: key);
  final double height;
  final double width;
  final double radius;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[300]!,
      child: Container(
        height: height.h,
        width: width.w,
        decoration: BoxDecoration(
          color: color??Colors.grey[400],
          borderRadius: BorderRadius.circular(radius.r),
        ),
      ),
    );
  }
}