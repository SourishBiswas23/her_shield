import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactInitial()) {
    on<AddContactEvent>((event, emit) {
      emit(ContactList(contactList: [
        ...state.contactList,
        {'name': event.name, 'phoneNumber': event.phoneNumber}
      ]));
    });
    on<RemoveContactEvent>((event, emit) {
      List<Map<String, String>> contacts = state.contactList;
      contacts.removeWhere(
        (element) => element['phoneNumber'] == event.phoneNumber,
      );
      emit(
        ContactList(
          contactList: contacts,
        ),
      );
    });
  }
}
