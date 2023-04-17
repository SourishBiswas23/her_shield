part of 'page_changer_bloc.dart';

@immutable
abstract class PageChangerEvent {}

class LoadIntroductionScreenEvent extends PageChangerEvent {}

class LoadPermissionsScreenEvent extends PageChangerEvent {}

class LoadLoginScreenEvent extends PageChangerEvent {}

class LoadSignUpScreenEvent extends PageChangerEvent {}

class LoadHomeScreenEvent extends PageChangerEvent {}

class LoadPageNotFoundScreenEvent extends PageChangerEvent {}

class IntroductionScreenLoadedEvent extends PageChangerEvent {}

class AllPermissionsGrantedEvent extends PageChangerEvent {}

class LoadBeAwareScreenEvent extends PageChangerEvent {}

class LoadDirectionsScreenEvent extends PageChangerEvent {}

class LoadCommunityPostsScreenEvent extends PageChangerEvent {}

class LoadHelplineNumbersScreenEvent extends PageChangerEvent {}

class LoadElearningScreenEvent extends PageChangerEvent {}

class LoadLoadingScreenEvent extends PageChangerEvent {}

class LoadTipOfTheDayEvent extends PageChangerEvent {}

class LoadFavouritesScreenEvent extends PageChangerEvent {}

class LoadMyIncidentsScreenEvent extends PageChangerEvent {}

class LoadRequestHelpScreenEvent extends PageChangerEvent {}

class LoadSosTriggeredScreenEvent extends PageChangerEvent {}

class LoadReportAsWitnessScreenEvent extends PageChangerEvent {}

class LoadReportAsVictimScreenEvent extends PageChangerEvent {}

class LoadSosHistoryScreenEvent extends PageChangerEvent {}

class LoadReportHistoryScreenEvent extends PageChangerEvent {}

class LoadSakhiScreenEvent extends PageChangerEvent {}
