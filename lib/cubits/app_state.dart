part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}


class GetCurrentWeatherSuccess extends AppState {}
class GetCurrentWeatherLoading extends AppState {}
class GetCurrentWeatherFailed extends AppState {}

