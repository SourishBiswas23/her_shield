part of 'history_bloc.dart';

@immutable
abstract class HistoryState {
  final List<ReportHistoryModel> reportHistoryList = [];
  final List<SosHistoryModel> sosHistoryList = [];
}

class HistoryInitial extends HistoryState {
  final List<ReportHistoryModel> reportHistoryList = [];
  final List<SosHistoryModel> sosHistoryList = [];
}

class AllHistory extends HistoryState {
  AllHistory({
    required this.reportHistoryList,
    required this.sosHistoryList,
  });
  final List<ReportHistoryModel> reportHistoryList;
  final List<SosHistoryModel> sosHistoryList;
}
