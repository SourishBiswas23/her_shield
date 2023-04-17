import 'package:bloc/bloc.dart';
import 'package:hackathon_project/routes.dart';
import 'package:hackathon_project/utils/report_services.dart';
import 'package:meta/meta.dart';

part 'report_event.dart';
part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  ReportBloc() : super(ReportInitial()) {
    on<ReportAsVictimEvent>((event, emit) async {
      AppNavigator.push(route: Routes.loadingScreen);
      final wasReported = await _reportServices.reportAsVictim(
        reportAsVictimModel: event.ReportAsVictimModel,
      );
      if (wasReported) {
        AppNavigator.pop();
      }
      AppNavigator.pop();
    });
    on<ReportAsWitnessEvent>((event, emit) async {
      AppNavigator.push(route: Routes.loadingScreen);
      final wasReported = await _reportServices.reportAsWitness(
        reportAsWitness: event.ReportAsWitnessModel,
      );
      if (wasReported) {
        AppNavigator.pop();
      }
      AppNavigator.pop();
    });
  }
  final ReportServices _reportServices = ReportServices();
}
