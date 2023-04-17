import 'package:intl/intl.dart';

String getOnlyDateInIst(String utcTime) {
  DateTime dateTime = DateTime.parse(utcTime).add(
    const Duration(hours: 5, minutes: 30),
  );
  String indianTime = DateFormat("d MMM y").format(dateTime);
  return indianTime;
}
