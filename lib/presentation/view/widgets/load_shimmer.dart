


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_app_emotion_talent/core/helpers/spacing.dart';
import '../../../../../../core/widgets/custom_shimmer.dart';



class LoadWeatherShimmer extends StatelessWidget {
  const LoadWeatherShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
              horizontal: 10.w, vertical: 16.h),
          decoration: BoxDecoration(
            // color: Colors.blueGrey,//Colors.grey[800],
              borderRadius: BorderRadius.circular(14.0.r),
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.outline,
                  Theme.of(context)
                      .colorScheme
                      .outlineVariant,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: const [0.2, 0.85],
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomShimmer(height: 20, width: size.width*0.4),
              const SizedBox(
                height: 10.0,
              ),
              CustomShimmer(height: 10, width: size.width*0.6),
              const SizedBox(
                height: 8.0,
              ),
              CustomShimmer(height: size.width*0.35, width: size.width*0.4, radius: 50,),
              const SizedBox(
                height: 20.0,
              ),
              CustomShimmer(height: 24, width: size.width*0.25),

              SizedBox(
                height: 8.0.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomShimmer(height: 40, width: size.width*0.1),
                  CustomShimmer(height: 10, width: 10),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const CustomShimmer(height: 20, width: 20),
                        SizedBox(
                          height: 6.h,
                        ),
                        const CustomShimmer(height: 14, width: 60),
                        SizedBox(
                          height: 6.h,
                        ),
                        const CustomShimmer(height: 10, width: 50),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const CustomShimmer(height: 20, width: 20),
                        SizedBox(
                          height: 6.h,
                        ),
                        const CustomShimmer(height: 14, width: 60),
                        SizedBox(
                          height: 6.h,
                        ),
                        const CustomShimmer(height: 10, width: 50),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const CustomShimmer(height: 20, width: 20),
                        SizedBox(
                          height: 6.h,
                        ),
                        const CustomShimmer(height: 14, width: 60),
                        SizedBox(
                          height: 6.h,
                        ),
                        const CustomShimmer(height: 10, width: 50),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Container(
          width: size.width,
          padding: EdgeInsets.symmetric(
              horizontal: 8.w, vertical: 10.h),
          decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(14.0.r),
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.outline,
                  Theme.of(context)
                      .colorScheme
                      .outlineVariant,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: const [0.2, 0.85],
              )),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const CustomShimmer(height: 14, width: 60),
                        SizedBox(
                          height: 6.h,
                        ),
                        const CustomShimmer(height: 10, width: 50),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const CustomShimmer(height: 14, width: 60),
                        SizedBox(
                          height: 6.h,
                        ),
                        const CustomShimmer(height: 10, width: 50),
                      ],
                    ),
                  ),
                ],
              ),
              verticalSpace(10),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const CustomShimmer(height: 14, width: 60),
                        SizedBox(
                          height: 6.h,
                        ),
                        const CustomShimmer(height: 10, width: 50),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const CustomShimmer(height: 14, width: 60),
                        SizedBox(
                          height: 6.h,
                        ),
                        const CustomShimmer(height: 10, width: 50),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),

        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}