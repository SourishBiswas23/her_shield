import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_project/controllers/location_bloc/location_bloc.dart';
import 'package:hackathon_project/utils/data_base_services.dart';
import 'package:meta/meta.dart';

import '../../routes.dart';
import '../../utils/app_meta_data.dart';
import '../../utils/grant_permissions.dart';

part 'page_changer_event.dart';
part 'page_changer_state.dart';

class PageChangerBloc extends Bloc<PageChangerEvent, PageChangerState> {
  PageChangerBloc({required this.locationBloc}) : super(PageChangerInitial()) {
    on<LoadPageNotFoundScreenEvent>((event, emit) async {
      await AppNavigator.push(route: Routes.pageNotFoundScreen);
    });
    on<LoadIntroductionScreenEvent>((event, emit) async {
      await AppNavigator.pushReplace(route: Routes.introductionScreen);
    });
    on<LoadPermissionsScreenEvent>((event, emit) async {
      await AppNavigator.pushReplace(route: Routes.permissionsScreen);
    });
    on<LoadLoginScreenEvent>((event, emit) async {
      await AppNavigator.pushReplace(route: Routes.loginScreen);
    });
    on<LoadSignUpScreenEvent>((event, emit) async {
      await AppNavigator.pushReplace(route: Routes.signUpScreen);
    });
    on<LoadHomeScreenEvent>((event, emit) async {
      await AppNavigator.pushReplace(route: Routes.homeScreen);
    });
    on<LoadBeAwareScreenEvent>((event, emit) async {
      await AppNavigator.push(route: Routes.beAwareScreen);
    });
    on<LoadElearningScreenEvent>((event, emit) async {
      await AppNavigator.push(route: Routes.eLearningScreen);
    });
    on<LoadCommunityPostsScreenEvent>((event, emit) async {
      await AppNavigator.push(route: Routes.communityPostsScreen);
    });
    on<LoadHelplineNumbersScreenEvent>((event, emit) async {
      await AppNavigator.push(route: Routes.helplineNumbersScreen);
    });
    on<LoadLoadingScreenEvent>((event, emit) async {
      await AppNavigator.push(route: Routes.loadingScreen);
    });
    on<LoadTipOfTheDayEvent>((event, emit) async {
      await AppNavigator.push(route: Routes.tipOfTheDayScreen);
    });
    on<LoadFavouritesScreenEvent>((event, emit) async {
      await AppNavigator.push(route: Routes.favouritesScreen);
    });
    on<LoadMyIncidentsScreenEvent>((event, emit) async {
      await AppNavigator.push(route: Routes.myIncidentsScreen);
    });
    on<LoadRequestHelpScreenEvent>((event, emit) async {
      await AppNavigator.push(route: Routes.requestHelpScreen);
    });
    on<LoadDirectionsScreenEvent>((event, emit) async {
      await AppNavigator.push(route: Routes.directionsScreen);
    });
    on<LoadSosTriggeredScreenEvent>((event, emit) async {
      await AppNavigator.push(route: Routes.sosTriggeredScreen);
    });
    on<LoadReportAsVictimScreenEvent>((event, emit) async {
      await AppNavigator.push(route: Routes.reportAsVictimScreen);
    });
    on<LoadReportAsWitnessScreenEvent>((event, emit) async {
      await AppNavigator.push(route: Routes.reportAsWitnessScreen);
    });
    on<LoadReportHistoryScreenEvent>((event, emit) async {
      await AppNavigator.push(route: Routes.reportHistoryScreen);
    });
    on<LoadSakhiScreenEvent>((event, emit) async {
      await AppNavigator.push(route: Routes.sakhiScreen);
    });
    on<LoadSosHistoryScreenEvent>((event, emit) async {
      await AppNavigator.push(route: Routes.sosHistoryScreen);
    });
    on<AllPermissionsGrantedEvent>((event, emit) async {
      bool isUserAuthenticated = await _dataBaseServices.userLoggedInStatus();
      if (isUserAuthenticated) {
        await AppNavigator.pushReplace(route: Routes.homeScreen);
      } else {
        await AppNavigator.pushReplace(route: Routes.loginScreen);
      }
    });
    on<IntroductionScreenLoadedEvent>((event, emit) async {
      bool hasAllPermissions = _permissions.allPermissionsGranted;
      bool isUserAuthenticated = await _dataBaseServices.userLoggedInStatus();
      if (hasAllPermissions) {
        if (isUserAuthenticated) {
          await AppNavigator.pushReplace(route: Routes.homeScreen);
        } else {
          await AppNavigator.pushReplace(route: Routes.loginScreen);
        }
      } else {
        await AppNavigator.pushReplace(route: Routes.permissionsScreen);
      }
    });
  }
  final GrantPermissions _permissions = GrantPermissions();
  final AppMetaData _appMetaData = AppMetaData();
  final LocationBloc locationBloc;
  final DataBaseServices _dataBaseServices = DataBaseServices();
}
