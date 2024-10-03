import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_emotion_talent/core/widgets/empty_screen.dart';
import 'package:weather_app_emotion_talent/core/widgets/snack_bar.dart';
import 'package:weather_app_emotion_talent/presentation/view/widgets/search_bar.dart';
import 'package:weather_app_emotion_talent/presentation/view/widgets/weather_data_builder.dart';
import 'package:weather_app_emotion_talent/core/theming/theme_cubit.dart';
import '../../../core/dependency_injection/dependency_injection.dart';
import '../../view_model/weather_cubit.dart';
import '../../view_model/weather_states.dart';
import '../widgets/load_shimmer.dart';

class WeatherScreen extends StatefulWidget {
  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {


  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (_) => getIt<WeatherCubit>(),
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: (){
                  context.read<ThemeCubit>().toggleTheme();
                },
                icon: const Icon(Icons.dark_mode)),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ListView(
              children: [
                SizedBox(height: 10.h),
                SearchBarWidget(),
                SizedBox(height: 30.h),

                BlocConsumer<WeatherCubit, WeatherStates>(
                    listener: (context, state) {
                  if (state is GetWeatherErrorState && state.errorMessage.isNotEmpty) {
                    CustomSnackBarHandler.showCustomSnackBar(context: context, text: state.errorMessage);
                  }
                },

                    builder: (context, state) {
                      switch(state){
                        case GetWeatherLoadingState():
                          return const LoadWeatherShimmer();
                        case GetWeatherSuccessState():
                          return WeatherDataBuilder(state.weatherData);
                        case GetWeatherErrorState():

                          /// if weather data not null, that means the local data is not empty.
                          return context.read<WeatherCubit>().weatherData== null
                              ? Padding(
                            padding: EdgeInsets.only(top: 250.0.h),
                            child: const EmptyScreen(text: 'Search by city name',),
                          )
                              : WeatherDataBuilder(context.read<WeatherCubit>().weatherData!);

                        default :
                          return Padding(
                            padding: EdgeInsets.only(top: 250.0.h),
                            child: const EmptyScreen(text: 'Search by city name',),
                          );

                      }
                }),
              ],
            ),
          )),
    );
  }
}

