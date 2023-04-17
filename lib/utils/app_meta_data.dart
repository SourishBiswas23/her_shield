import 'package:hive_flutter/hive_flutter.dart';

class AppMetaData {
  static final AppMetaData _instance = AppMetaData._();
  factory AppMetaData() => _instance;
  AppMetaData._();

  bool _openedBefore = false;
  static const _openedBeforeKey = 'openedBefore';
  static const _initBox = 'initBox';

  init() async {
    // Checking if the user has opened the app for the first time
    await Hive.openBox(_initBox);
    final initBox = Hive.box(_initBox);
    if (initBox.containsKey(_openedBeforeKey)) {
      _openedBefore = initBox.get(_openedBeforeKey);
      if (!_openedBefore) {
        initBox.put(_openedBeforeKey, true);
        _openedBefore = false;
      }
    } else {
      initBox.put(_openedBeforeKey, true);
      _openedBefore = false;
    }
    await initBox.close();

    // Checking if the user has logged in before
  }

  bool get openedBefore => _openedBefore;
}
