import 'package:flutter/material.dart';
import 'package:hackathon_project/data/models/report_history_model.dart';

import '../../utils/get_time_date_year_in_ist.dart';
import '../../utils/get_status_color.dart';

class ReportListTile extends StatelessWidget {
  const ReportListTile({
    super.key,
    required this.reportHistoryModel,
  });

  final ReportHistoryModel reportHistoryModel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        ListTile(
          title: Text(
            (reportHistoryModel.userName).substring(
              0,
              reportHistoryModel.userName.length.clamp(0, 16),
            ),
            style: theme.textTheme.bodyLarge,
          ),
          subtitle: Text(
            GetTimeDateYearInIst(reportHistoryModel.createdAt),
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.normal,
            ),
          ),
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: getStatusColor(
                status: reportHistoryModel.status,
              ),
            ),
            child: Text(
              reportHistoryModel.status,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          enableFeedback: true,
        ),
        const Divider(
          color: Colors.grey,
          thickness: 1,
        )
      ],
    );
  }
}
