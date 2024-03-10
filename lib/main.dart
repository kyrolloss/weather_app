import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/app_cubit.dart';

import 'Helpers/Dio Helper/Dio Helper.dart';
import 'Screens/mainLayout.dart';

void main() async{
  await DioHelper.init();

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getCurrentWeather(city: 'cairo')..getForecastWeather(city: 'cairo'),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainLayout(),
      ),
    );
  }
}

