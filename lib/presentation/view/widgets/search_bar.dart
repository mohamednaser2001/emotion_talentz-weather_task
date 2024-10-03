

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theming/font_weight_helper.dart';
import '../../view_model/weather_cubit.dart';
import '../../view_model/weather_states.dart';

class SearchBarWidget extends StatelessWidget {
  SearchBarWidget({super.key});
  TextEditingController searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: searchController,
            style: TextStyle(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400),
            decoration: InputDecoration(
              hintText: 'Search by city name ...',
              hintStyle: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 14.sp,
                  fontWeight: FontWeightHelper.regular),
              fillColor: Theme.of(context).colorScheme.primary,
              filled: true,
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                  vertical: 8.h, horizontal: 16.w),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400]!),
                borderRadius:
                BorderRadius.all(Radius.circular(12.r)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400]!),
                borderRadius:
                BorderRadius.all(Radius.circular(12.r)),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400]!),
                borderRadius:
                BorderRadius.all(Radius.circular(12.r)),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
        BlocBuilder<WeatherCubit, WeatherStates>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () async {
                  if (searchController.text.trim().isNotEmpty) {
                    await context
                        .read<WeatherCubit>()
                        .getWeather(searchController.text.trim());
                  }
                },
                child: CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 20.r,
                    child: const Icon(
                      Icons.search_rounded,
                    )),
              );
            }),
      ],
    );
  }
}
