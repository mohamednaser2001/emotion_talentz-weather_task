import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theming/font_weight_helper.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(text,
            style: TextStyle(
              fontWeight: FontWeightHelper.semiBold,
              fontSize: 17.0.sp,
              height: 0,
              color: Colors.grey[700],
            ),
        ));
  }
}