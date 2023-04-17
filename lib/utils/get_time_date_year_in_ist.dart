import 'package:intl/intl.dart';

String GetTimeDateYearInIst(String utcTime) {
  DateTime dateTime = DateTime.parse(utcTime).add(
    const Duration(hours: 5, minutes: 30),
  );
  String indianTime = DateFormat("h:mm a, d MMM, yy").format(dateTime);
  return indianTime;
}
