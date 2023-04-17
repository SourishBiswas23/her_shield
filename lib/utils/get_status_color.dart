import 'package:flutter/material.dart';

Color getStatusColor({required String status}) {
  switch (status) {
    case 'Safe':
      return Colors.green;
    case 'False Sos':
      return Colors.red;
    case 'Rescued':
      return Colors.blue;
    case 'Active':
      return Colors.green;
    case 'Pending':
      return Colors.yellow.shade800;
    // case completed is being covered in this default
    default:
      return Colors.blue;
  }
}
