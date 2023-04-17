import 'package:bloc/bloc.dart';
import 'package:hackathon_project/data/models/report_history_model.dart';
import 'package:hackathon_project/data/models/sos_history_model.dart';
import 'package:hackathon_project/utils/data_base_services.dart';
import 'package:hackathon_project/utils/history_services.dart';
import 'package:meta/meta.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(HistoryInitial()) {
    on<GetReportHistoryEvent>((event, emit) async {
      final userId = await _dataBaseServices.getUserId();
      final reportHistoryList = await _historyServices.getReportHistory(
        userId: userId,
      );
      emit(AllHistory(
        reportHistoryList: reportHistoryList,
        sosHistoryList: state.sosHistoryList,
      ));
    });
    on<GetSosHistoryEvent>((event, emit) async {
      final userId = await _dataBaseServices.getUserId();
      final sosHistoryList = await _historyServices.getSosHistory(
        userId: userId,
      );
      emit(AllHistory(
        reportHistoryList: state.reportHistoryList,
        sosHistoryList: sosHistoryList,
      ));
    });
  }
  final DataBaseServices _dataBaseServices = DataBaseServices();
  final HistoryServices _historyServices = HistoryServices();
}
