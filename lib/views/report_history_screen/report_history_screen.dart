import 'package:flutter/material.dart';

import 'report_list_builder.dart';

class ReportHistoryScreen extends StatelessWidget {
  const ReportHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Report History',
          style: theme.textTheme.bodyLarge,
        ),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(10),
        child: ReportListBuilder(),
      ),
    );
  }
}
