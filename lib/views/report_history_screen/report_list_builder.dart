import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackathon_project/controllers/history_bloc/history_bloc.dart';
import 'report_tile.dart';

class ReportListBuilder extends StatelessWidget {
  const ReportListBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final HistoryBloc historyBloc = context.read<HistoryBloc>();
    historyBloc.add(GetReportHistoryEvent());
    return BlocBuilder<HistoryBloc, HistoryState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.reportHistoryList.length,
          itemBuilder: (context, index) {
            return ReportListTile(
              reportHistoryModel: state.reportHistoryList[index],
            );
          },
        );
      },
    );
  }
}
