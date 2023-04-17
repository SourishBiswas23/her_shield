part of 'contact_bloc.dart';

@immutable
abstract class ContactEvent {}

class AddContactEvent extends ContactEvent {
  AddContactEvent({required this.name, required this.phoneNumber});
  final String name;
  final String phoneNumber;
}

class RemoveContactEvent extends ContactEvent {
  RemoveContactEvent({required this.phoneNumber});
  final String phoneNumber;
}
