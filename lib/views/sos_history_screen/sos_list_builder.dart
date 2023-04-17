import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackathon_project/views/sos_history_screen/sos_list_tile.dart';

import '../../controllers/history_bloc/history_bloc.dart';

class SosListBuilder extends StatelessWidget {
  const SosListBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final HistoryBloc historyBloc = context.read<HistoryBloc>();
    historyBloc.add(GetSosHistoryEvent());
    return BlocBuilder<HistoryBloc, HistoryState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.sosHistoryList.length,
          itemBuilder: (context, index) {
            return SosListTile(
              sosHistoryModel: state.sosHistoryList[index],
            );
          },
        );
      },
    );
  }
}
