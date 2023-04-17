import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackathon_project/controllers/auth_bloc/auth_bloc.dart';
import 'package:hackathon_project/controllers/history_bloc/history_bloc.dart';
import 'package:hackathon_project/controllers/sos_bloc/sos_bloc.dart';
import 'package:hackathon_project/views/login_screen/login_screen.dart';
import 'package:hackathon_project/views/splash_screen/splash_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app_theme.dart';
import 'controllers/chat_bot_bloc/chat_bot_bloc.dart';
import 'controllers/community_posts_bloc/community_posts_bloc.dart';
import 'controllers/init_bloc/init_bloc.dart';
import 'controllers/location_bloc/location_bloc.dart';
import 'controllers/page_changer_bloc/page_changer_bloc.dart';
import 'controllers/permissions_bloc/permissions_bloc.dart';
import 'controllers/report_bloc/report_bloc.dart';
import 'routes.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocationBloc(),
        ),
        BlocProvider(
          create: (context) => PageChangerBloc(
            locationBloc: BlocProvider.of<LocationBloc>(context),
          ),
        ),
        BlocProvider(
          create: (context) => InitBloc(
            pageChangerBloc: BlocProvider.of<PageChangerBloc>(context),
            context: context,
          ),
        ),
        BlocProvider(
          create: (context) => PermissionsBloc(
            pageChangerBloc: BlocProvider.of<PageChangerBloc>(context),
          ),
        ),
        BlocProvider(
          create: (context) => ChatBotBloc(),
        ),
        BlocProvider(
          create: (context) => CommunityPostsBloc(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => SosBloc(),
        ),
        BlocProvider(
          create: (context) => ReportBloc(),
        ),
        BlocProvider(
          create: (context) => HistoryBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'HerShield',
        theme: AppTheme().themeData,
        scaffoldMessengerKey: AppNavigator.scaffoldMessengerKey,
        navigatorKey: AppNavigator.navigatorKey,
        onGenerateRoute: AppNavigator.onGenerateRoute,
        home: const SplashScreen(),
      ),
    );
  }
}
