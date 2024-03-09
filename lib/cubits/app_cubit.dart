import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);
  Color backgroundColor = const Color(0xff090122);
  List<Color>color=[
    const Color(0xff090122) ,
    Colors.white,
    Colors.white,
    const Color(0xff5b9aaf)
  ];
  List<Color>color1=[
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
  ];



}
