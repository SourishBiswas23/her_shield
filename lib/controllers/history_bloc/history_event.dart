part of 'history_bloc.dart';

@immutable
abstract class HistoryEvent {}

class GetReportHistoryEvent extends HistoryEvent {}

class GetSosHistoryEvent extends HistoryEvent {}
