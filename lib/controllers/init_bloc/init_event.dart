part of 'init_bloc.dart';

@immutable
abstract class InitEvent {}

class InitializeApp extends InitEvent {}

class SplashScreenLoaded extends InitEvent {}
