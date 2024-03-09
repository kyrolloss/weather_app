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

  late Map<String, dynamic> currentWeather= {};

  Future<void> getCurrentWeather({
    required String city,
  }) async {
    emit(GetCurrentWeatherLoading());

    final response =await DioHelper.getWeather(
        endPoint: EndPoint.currentWeather,
      queryParameters: {
          'q':city,
        'Current weather':EndPoint.currentWeather,

      }
    );
    currentWeather = response.data;

  }
}
