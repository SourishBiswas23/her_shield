import 'package:flutter/material.dart';
import 'package:hackathon_project/views/aadhar_details_screen/aadhar_details_screen.dart';
import 'package:hackathon_project/views/be_aware_screen/be_aware_screen.dart';
import 'package:hackathon_project/views/directions_screen/directions_screen.dart';
import 'package:hackathon_project/views/e_learning_screen/e_learning_screen.dart';
import 'package:hackathon_project/views/enter_pin_screen/enter_pin_screen.dart';
import 'package:hackathon_project/views/favourites_screen/favourites_screen.dart';
import 'package:hackathon_project/views/community_posts/community_posts.dart';
import 'package:hackathon_project/views/helpline_numbers_screen/helpline_numbers_screen.dart';
import 'package:hackathon_project/views/home_screen/home_screen.dart';
import 'package:hackathon_project/views/introduction_screen/introduction_screen.dart';
import 'package:hackathon_project/views/loading_screen/loading_screen.dart';
import 'package:hackathon_project/views/login_screen/login_screen.dart';
import 'package:hackathon_project/views/my_incidents_screen/my_incidents_screen.dart';
import 'package:hackathon_project/views/page_not_found/page_not_found.dart';
import 'package:hackathon_project/views/permissions_sceen/permissions_screen.dart';
import 'package:hackathon_project/views/report_as_victim_screen/report_as_victim_screen.dart';
import 'package:hackathon_project/views/report_as_witness_screen/report_as_witness_screen.dart';
import 'package:hackathon_project/views/report_history_screen/report_history_screen.dart';
import 'package:hackathon_project/views/request_help_screen/request_help_screen.dart';
import 'package:hackathon_project/views/sakhi_screen/sakhi_screen.dart';
import 'package:hackathon_project/views/sign_up_screen/sign_up_screen.dart';
import 'package:hackathon_project/views/sos_history_screen/sos_history_screen.dart';
import 'package:hackathon_project/views/sos_triggered_screen/sos_triggered_screen.dart';
import 'package:hackathon_project/views/splash_screen/splash_screen.dart';
import 'package:hackathon_project/views/tip_of_the_day_screen/tip_of_the_day_screen.dart';

enum Routes {
  splashScreen,
  pageNotFoundScreen,
  introductionScreen,
  loginScreen,
  signUpScreen,
  homeScreen,
  permissionsScreen,
  sosTriggeredScreen,
  aadharDetailsScreen,
  enterPinScreen,
  beAwareScreen,
  directionsScreen,
  eLearningScreen,
  communityPostsScreen,
  helplineNumbersScreen,
  loadingScreen,
  tipOfTheDayScreen,
  favouritesScreen,
  myIncidentsScreen,
  requestHelpScreen,
  reportAsVictimScreen,
  reportAsWitnessScreen,
  reportHistoryScreen,
  sakhiScreen,
  sosHistoryScreen,
}

class _Paths {
  static const String splash = '/';
  static const String pageNotFoundScreen = '/pageNotFoundScreen';
  static const String introductionScreen = '/introductionScreen';
  static const String loginScreen = '/loginScreen';
  static const String signUpScreen = '/signUpScreen';
  static const String homeScreen = '/homeScreen';
  static const String permissionsScreen = '/permissionsScreen';
  static const String sosTriggeredScreen = '/sosTriggeredScreen';
  static const String aadharDetailsScreen = '/aadharDetailsScreen';
  static const String enterPinScreen = '/enterPinScreen';
  static const String beAwareScreen = '/beAwareScreen';
  static const String directionsScreen = '/directionsScreen';
  static const String eLearningScreen = '/eLearningScreen';
  static const String communityPostsScreen = '/communityPostsScreen';
  static const String helplineNumbersScreen = '/helplineNumbersScreen';
  static const String loadingScreen = '/loadingScreen';
  static const String tipOfTheDayScreen = '/tipOfTheDay';
  static const String favouritesScreen = '/favouritesScreen';
  static const String myIncidentsScreen = '/myIncidentsScreen';
  static const String requestHelpScreen = '/requestHelpScreen';
  static const String reportAsVictimScreen = '/reportAsVictimScreen';
  static const String reportAsWitnessScreen = '/reportAsWitnessScreen';
  static const String reportHistoryScreen = '/reportHistoryScreen';
  static const String sakhiScreen = '/sakhiScreen';
  static const String sosHistoryScreen = '/sosHistoryScreen';

  static const Map<Routes, String> _pathMap = {
    Routes.splashScreen: splash,
    Routes.pageNotFoundScreen: pageNotFoundScreen,
    Routes.introductionScreen: introductionScreen,
    Routes.loginScreen: loginScreen,
    Routes.signUpScreen: signUpScreen,
    Routes.homeScreen: homeScreen,
    Routes.permissionsScreen: permissionsScreen,
    Routes.sosTriggeredScreen: sosTriggeredScreen,
    Routes.aadharDetailsScreen: aadharDetailsScreen,
    Routes.enterPinScreen: enterPinScreen,
    Routes.beAwareScreen: beAwareScreen,
    Routes.directionsScreen: directionsScreen,
    Routes.eLearningScreen: eLearningScreen,
    Routes.communityPostsScreen: communityPostsScreen,
    Routes.helplineNumbersScreen: helplineNumbersScreen,
    Routes.loadingScreen: loadingScreen,
    Routes.tipOfTheDayScreen: tipOfTheDayScreen,
    Routes.favouritesScreen: favouritesScreen,
    Routes.myIncidentsScreen: myIncidentsScreen,
    Routes.requestHelpScreen: requestHelpScreen,
    Routes.reportAsVictimScreen: reportAsVictimScreen,
    Routes.reportAsWitnessScreen: reportAsWitnessScreen,
    Routes.reportHistoryScreen: reportHistoryScreen,
    Routes.sakhiScreen: sakhiScreen,
    Routes.sosHistoryScreen: sosHistoryScreen,
  };

  static String of(Routes route) => _pathMap[route] ?? pageNotFoundScreen;
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  static GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _Paths.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case _Paths.introductionScreen:
        return MaterialPageRoute(
          builder: (context) => const IntroductionScreen(),
        );
      case _Paths.loginScreen:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case _Paths.signUpScreen:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        );
      case _Paths.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case _Paths.permissionsScreen:
        return MaterialPageRoute(
          builder: (context) => const PermissionsScreen(),
        );
      case _Paths.sosTriggeredScreen:
        return MaterialPageRoute(
          builder: (context) => const SosTriggeredScreen(),
        );
      case _Paths.aadharDetailsScreen:
        return MaterialPageRoute(
          builder: (context) => const AadharDetailsScreen(),
        );
      case _Paths.enterPinScreen:
        return MaterialPageRoute(
          builder: (context) => const EnterPinScreen(),
        );
      case _Paths.beAwareScreen:
        return MaterialPageRoute(
          builder: (context) => const BeAwareScreen(),
        );
      case _Paths.directionsScreen:
        return MaterialPageRoute(
          builder: (context) => const DirectionsScreen(),
        );
      case _Paths.eLearningScreen:
        return MaterialPageRoute(
          builder: (context) => const ELearningScreen(),
        );
      case _Paths.communityPostsScreen:
        return MaterialPageRoute(
          builder: (context) => const CommunityPosts(),
        );
      case _Paths.helplineNumbersScreen:
        return MaterialPageRoute(
          builder: (context) => const HelplineNumbersScreen(),
        );
      case _Paths.loadingScreen:
        return MaterialPageRoute(
          builder: (context) => const LoadingScreen(),
        );
      case _Paths.tipOfTheDayScreen:
        return MaterialPageRoute(
          builder: (context) => const TipOfTheDayScreen(),
        );
      case _Paths.favouritesScreen:
        return MaterialPageRoute(
          builder: (context) => const FavouritesScreen(),
        );
      case _Paths.myIncidentsScreen:
        return MaterialPageRoute(
          builder: (context) => const MyIncidentsScreen(),
        );
      case _Paths.requestHelpScreen:
        return MaterialPageRoute(
          builder: (context) => const RequestHelpScreen(),
        );
      case _Paths.reportAsVictimScreen:
        return MaterialPageRoute(
          builder: (context) => const ReportAsVictimScreen(),
        );
      case _Paths.reportAsWitnessScreen:
        return MaterialPageRoute(
          builder: (context) => const ReportAsWitnessScreen(),
        );
      case _Paths.reportHistoryScreen:
        return MaterialPageRoute(
          builder: (context) => const ReportHistoryScreen(),
        );
      case _Paths.sakhiScreen:
        return MaterialPageRoute(
          builder: (context) => const SakhiScreen(),
        );
      case _Paths.sosHistoryScreen:
        return MaterialPageRoute(
          builder: (context) => const SosHistoryScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const PageNotFound(),
        );
    }
  }

  static Future? push({required Routes route}) {
    navigatorKey.currentState?.pushNamed(_Paths.of(route));
    return null;
  }

  static Future? pushReplace({required Routes route}) {
    navigatorKey.currentState?.pushReplacementNamed(_Paths.of(route));
    return null;
  }

  static Future? pop() {
    navigatorKey.currentState?.pop();
    return null;
  }

  static Future? showSnackBar({required SnackBar snackBar}) {
    scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
    return null;
  }

  static Future? removeSnackBar() {
    scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
    return null;
  }
}
