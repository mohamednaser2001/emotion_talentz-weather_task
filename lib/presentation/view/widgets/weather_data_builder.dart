

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app_emotion_talent/presentation/view/widgets/weather_info_widget.dart';

import '../../../core/theming/font_weight_helper.dart';
import '../../../data/models/weather_model.dart';

class WeatherDataBuilder extends StatelessWidget {
  const WeatherDataBuilder(this._weatherData);
  final WeatherModel _weatherData;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          width: size.width,
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
              Text(
                _weatherData!
                    .cityName,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 26.0,
                  color: Colors.white.withOpacity(0.75),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                _weatherData!
                    .lastUpdate,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15.0,
                  height: 0,
                  color: Colors.white.withOpacity(0.55),
                ),
              ),
              Image(
                image: NetworkImage(
                    'https:${_weatherData!.icon}'),
                width: size.width * 0.4,
                height: size.width * 0.4,
                fit: BoxFit.fill,
              ),
              Text(
                _weatherData!
                    .condition,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0.sp,
                  color: Colors.white.withOpacity(0.75),
                ),
              ),
              SizedBox(
                height: 4.0.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${_weatherData!.temp}',
                    style: TextStyle(
                      fontWeight: FontWeightHelper.bold,
                      fontSize: 36.0.sp,
                      color: Colors.white.withOpacity(
                        0.90,
                      ),
                    ),
                  ),
                  Text(
                    'o',
                    style: TextStyle(
                      fontWeight: FontWeightHelper.bold,
                      fontSize: 20.0.sp,
                      color: Colors.white.withOpacity(
                        0.90,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  InfoWidget(
                      iconPath: 'assets/images/wind.png',
                      value:
                      '${_weatherData!.wind} km/h',
                      title: 'Wind'),
                  InfoWidget(
                      iconPath: 'assets/images/cloud.png',
                      value:
                      '${_weatherData!.humidity}',
                      title: 'Humidity'),
                  InfoWidget(
                      iconPath: 'assets/images/wind_dir.png',
                      value: _weatherData!
                          .windDirection,
                      title: 'Wind Direction'),
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
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Column(
                  children: [
                    InfoColumn(
                        title: 'Gust',
                        value:
                        '${_weatherData!.gust} kp/h'),
                    SizedBox(
                      height: 20.0.h,
                    ),
                    InfoColumn(
                        title: 'Pressure',
                        value:
                        '${_weatherData!.pressure} hpa'),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    InfoColumn(
                        title: 'UV',
                        value:
                        '${_weatherData!.uv}'),
                    SizedBox(
                      height: 20.0.h,
                    ),
                    InfoColumn(
                        title: 'Precipitation',
                        value:
                        '${_weatherData!.pricipition} mm'),
                  ],
                ),
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
