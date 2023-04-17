import 'package:flutter/material.dart';
import 'package:hackathon_project/data/models/sos_history_model.dart';
import 'package:hackathon_project/utils/get_only_date_in_ist.dart';
import 'package:hackathon_project/utils/get_only_time_ist.dart';

import '../../utils/get_status_color.dart';

class SosListTile extends StatelessWidget {
  const SosListTile({
    super.key,
    required this.sosHistoryModel,
  });

  final SosHistoryModel sosHistoryModel;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        ListTile(
          title: Text(
            getOnlyTimeIst(sosHistoryModel.createdAt),
            style: theme.textTheme.bodyLarge,
          ),
          subtitle: Text(
            getOnlyDateInIst(sosHistoryModel.createdAt),
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.normal,
            ),
          ),
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: getStatusColor(
                status: sosHistoryModel.status,
              ),
            ),
            child: Text(
              sosHistoryModel.status,
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
