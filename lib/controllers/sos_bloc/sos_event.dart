part of 'sos_bloc.dart';

@immutable
abstract class SosEvent {}

class LoadSosScreenEvent extends SosEvent {}

class LoadEnterPinScreenForVerification extends SosEvent {}

class VerifyPinForFalseSos extends SosEvent {
  VerifyPinForFalseSos({required this.activePin});
  final String activePin;
}

class VerifyPinForImSafe extends SosEvent {
  VerifyPinForImSafe({required this.activePin});
  final String activePin;
}
