import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackathon_project/controllers/auth_bloc/auth_bloc.dart';
import 'package:hackathon_project/controllers/sos_bloc/sos_bloc.dart';

import '../../app_theme.dart';

class DoneButton extends StatelessWidget {
  const DoneButton({
    super.key,
    required TextEditingController pinConroller,
  }) : _pinConroller = pinConroller;

  final TextEditingController _pinConroller;

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = context.read<AuthBloc>();
    final SosBloc sosBloc = context.read<SosBloc>();
    return GestureDetector(
      onTap: () async {
        if (sosBloc.state is SosTriggeredState) {
          sosBloc.add(VerifyPinForFalseSos(activePin: _pinConroller.text));
        } else {
          authBloc.add(SaveActivePin(activePin: _pinConroller.text));
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [AppTheme.secondaryColor, AppTheme.primaryColor],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: const Text(
          'Okay',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }
}
