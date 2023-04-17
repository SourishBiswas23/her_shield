import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../controllers/sos_bloc/sos_bloc.dart';

class ImSafeButton extends StatelessWidget {
  const ImSafeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final SosBloc sosBloc = context.read<SosBloc>();
    return ElevatedButton(
      onPressed: () async {
        sosBloc.add(LoadEnterPinScreenForVerification());
        // await grantPermission();
        // await _sendSms();
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        backgroundColor: const Color(0xFF87D95C),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: const Text(
        "I'm Safe",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

// List<String> recipients = [
//   '+917479535799',
//   '+919336178527',
//   '+917052176412',
//   '+919801436673'
// ];

// Future<void> grantPermission() async {
//   var locationStatus = Permission.location.status;
//   var smsStatus = Permission.sms.status;
//   // var cameraStatus = Permission.camera.status;
//   // var contactsStatus = Permission.contacts.status;
//   // var microphoneStatus = Permission.microphone.status;
//   if (await locationStatus.isDenied) {
//     await Permission.location.request();
//   }
//   if (await smsStatus.isDenied) {
//     await Permission.sms.request();
//   }
//   // if (await cameraStatus.isDenied) {
//   //   await Permission.camera.request();
//   // }
//   // if (await contactsStatus.isDenied) {
//   //   await Permission.contacts.request();
//   // }
//   // if (await microphoneStatus.isDenied) {
//   //   await Permission.microphone.request();
//   // }
// }

// Future<void> _sendSms() async {
//   final result = await sendSMS(
//     message: 'This is for testing purpose',
//     recipients: recipients,
//     sendDirect: true,
//   ).catchError((e) {
//     print(e);
//     return 'failed';
//   });
//   print(result);
// }
