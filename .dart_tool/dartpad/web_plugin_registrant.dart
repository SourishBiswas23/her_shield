// Flutter web plugin registrant file.
//
// Generated file. Do not edit.
//

// @dart = 2.13
// ignore_for_file: type=lint

import 'package:battery_plus/src/battery_plus_web.dart';
import 'package:flutter_sms/flutter_sms_web.dart';
import 'package:location_web/location_web.dart';
import 'package:smart_auth/smart_auth_web.dart';
import 'package:url_launcher_web/url_launcher_web.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void registerPlugins([final Registrar? pluginRegistrar]) {
  final Registrar registrar = pluginRegistrar ?? webPluginRegistrar;
  BatteryPlusWebPlugin.registerWith(registrar);
  FlutterSmsPlugin.registerWith(registrar);
  LocationWebPlugin.registerWith(registrar);
  SmartAuthWeb.registerWith(registrar);
  UrlLauncherPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}
