part of 'sos_bloc.dart';

@immutable
abstract class SosState {}

class SosInitial extends SosState {}

class SosTriggeredState extends SosState {
  SosTriggeredState({required this.sosId});
  final String sosId;
}
