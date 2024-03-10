part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}


class GetCurrentWeatherSuccess extends AppState {}
class GetCurrentWeatherLoading extends AppState {}
class GetCurrentWeatherFailed extends AppState {}
class RemoveCurrentWeatherSuccess extends AppState {}

class ForecastWeatherSuccess extends AppState {}
class RemoveForecastWeatherSuccess extends AppState {}

class ForecastWeatherLoading extends AppState {}
class ForecastWeatherFailed extends AppState {}

