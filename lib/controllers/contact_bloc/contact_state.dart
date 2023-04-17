part of 'contact_bloc.dart';

@immutable
abstract class ContactState {
  final List<Map<String, String>> contactList = [];
}

class ContactInitial extends ContactState {
  final List<Map<String, String>> contactList = [];
}

class ContactList extends ContactState {
  ContactList({required this.contactList});
  final List<Map<String, String>> contactList;
}
