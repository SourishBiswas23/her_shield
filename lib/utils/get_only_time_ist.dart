import 'package:intl/intl.dart';

String getOnlyTimeIst(String utcTime) {
  DateTime dateTime = DateTime.parse(utcTime).add(
    const Duration(hours: 5, minutes: 30),
  );
  String indianTime = DateFormat("h:mm a").format(dateTime);
  return indianTime;
}
