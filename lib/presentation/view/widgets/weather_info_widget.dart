
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theming/font_weight_helper.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget(
      {super.key,
        required this.iconPath,
        required this.value,
        required this.title});

  final String iconPath;
  final String value;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Image(
            image: AssetImage(iconPath),
            width: 26.0.w,
            height: 26.0.w,
          ),
          SizedBox(
            height: 8.0.h,
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12.0.sp,
              color: Colors.white.withOpacity(0.57),
            ),
          ),
          SizedBox(
            height: 8.0.h,
          ),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 11.0.sp,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }
}



class InfoColumn extends StatelessWidget {
  const InfoColumn(
      {super.key, required this.title, required this.value, this.valueColor});

  final String title;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeightHelper.semiBold,
            fontSize: 14.0.sp,
            color: Colors.white,
          ),
        ),
        // SizedBox(height: 10.0.h,),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeightHelper.semiBold,
            fontSize: 16.0.sp,
            color: valueColor ?? Colors.white.withOpacity(0.65),
          ),
        )
      ],
    );
  }
}
