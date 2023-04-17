part of 'report_bloc.dart';

@immutable
abstract class ReportEvent {}

class GetAllReports extends ReportEvent {}

class ReportAsVictimEvent extends ReportEvent {
  ReportAsVictimEvent({required this.ReportAsVictimModel});
  final ReportAsVictimModel;
}

class ReportAsWitnessEvent extends ReportEvent {
  ReportAsWitnessEvent({required this.ReportAsWitnessModel});
  final ReportAsWitnessModel;
}
