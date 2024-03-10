import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/Helpers/End%20Points/End%20Points.dart';

import '../Helpers/Dio Helper/Dio Helper.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);

  late  Map? currentWeather;
  late Map? forecastWeather;

  String country='';

  Future<void> getCurrentWeather({
    required String city,
  }) async {
    // if(
    // currentWeather != null
    // )
    // {
    //   currentWeather!.clear();
    //   emit(RemoveCurrentWeatherSuccess());
    //
    // }
    emit(GetCurrentWeatherLoading());
    await DioHelper.getWeather(
        endPoint: EndPoint.currentWeather,
        queryParameters: {
          'q': city,
          'Current weather': EndPoint.currentWeather,
        }).then((value) {
      emit(GetCurrentWeatherSuccess());
      currentWeather = value.data;
    }).catchError((onError) {
      print(onError.toString());
      emit(GetCurrentWeatherFailed());
    });
  }

  Future<void> getForecastWeather({
    required String city,
  }) async {
    // if(
    // forecastWeather != null
    // )
    // {
    //   currentWeather!.clear();
    //   emit(RemoveForecastWeatherSuccess());
    //
    // }

    emit(ForecastWeatherLoading());

    await DioHelper.getWeather(
        endPoint: EndPoint.forecastWeather,
        queryParameters: {
          'q': city,
          'Current weather': EndPoint.forecastWeather,
          'days': 1
        }).then((value) {
      emit(ForecastWeatherSuccess());
      forecastWeather = value.data;
      print(forecastWeather);
    }).catchError((onError) {
      print(onError.toString());
      emit(ForecastWeatherFailed());
    });
  }

  Color backgroundColor = const Color(0xff090122);
  List<Color> color = [
    const Color(0xff090122),
    Colors.white,
    Colors.white,
    const Color(0xff5b9aaf)
  ];
  List<Color> color1 = [
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
  ];
}
