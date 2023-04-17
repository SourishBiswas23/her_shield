import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_project/controllers/page_changer_bloc/page_changer_bloc.dart';
import 'package:hackathon_project/utils/app_meta_data.dart';
import 'package:hackathon_project/utils/data_base_services.dart';
import 'package:hackathon_project/utils/grant_permissions.dart';
import 'package:meta/meta.dart';

part 'init_event.dart';
part 'init_state.dart';

class InitBloc extends Bloc<InitEvent, InitState> {
  InitBloc({
    required PageChangerBloc pageChangerBloc,
    required BuildContext context,
  })  : _pageChangerBloc = pageChangerBloc,
        super(InitInitial()) {
    on<InitializeApp>((event, emit) async {
      final AppMetaData appMetaData = AppMetaData();
      final GrantPermissions permissions = GrantPermissions();
      await appMetaData.init();
      await permissions.init();
      _wasTheAppOpenedBefore = appMetaData.openedBefore;
      _isUserAuthenticated = await _dataBaseServices.userLoggedInStatus();
      _hasAllPermissions = permissions.allPermissionsGranted;
    });
    on<SplashScreenLoaded>((event, emit) async {
      if (_wasTheAppOpenedBefore) {
        if (_hasAllPermissions) {
          if (_isUserAuthenticated) {
            _pageChangerBloc.add(LoadHomeScreenEvent());
          } else {
            _pageChangerBloc.add(LoadLoginScreenEvent());
          }
        } else {
          _pageChangerBloc.add(LoadPermissionsScreenEvent());
        }
      } else {
        _pageChangerBloc.add(LoadIntroductionScreenEvent());
      }
    });
  }
  final PageChangerBloc _pageChangerBloc;
  late bool _wasTheAppOpenedBefore;
  late bool _hasAllPermissions;
  late bool _isUserAuthenticated;
  final DataBaseServices _dataBaseServices = DataBaseServices();
}
