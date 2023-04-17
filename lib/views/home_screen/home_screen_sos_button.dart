import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackathon_project/controllers/sos_bloc/sos_bloc.dart';

class HomeScreenSosButton extends StatelessWidget {
  const HomeScreenSosButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final SosBloc sosBloc = context.read<SosBloc>();
    return SizedBox(
      height: 100,
      width: 100,
      child: FloatingActionButton(
        onPressed: () => sosBloc.add(LoadSosScreenEvent()),
        enableFeedback: true,
        backgroundColor: Colors.red,
        child: Text(
          'SOS',
          style: theme.textTheme.headlineMedium?.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
