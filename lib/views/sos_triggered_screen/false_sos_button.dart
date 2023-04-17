import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackathon_project/controllers/sos_bloc/sos_bloc.dart';

class FalseSosButton extends StatelessWidget {
  const FalseSosButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final SosBloc sosBloc = context.read<SosBloc>();
    return ElevatedButton(
      onPressed: () {
        sosBloc.add(LoadEnterPinScreenForVerification());
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: const Text(
        'False SOS',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
