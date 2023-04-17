import 'package:hackathon_project/data/models/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DataBaseServices {
  static final DataBaseServices _instance = DataBaseServices._();
  factory DataBaseServices() => _instance;
  DataBaseServices._();

  bool _isAuthenticated = false;
  static const _authKey = 'isAuthenticated';
  static const _authBox = 'authBox';
  static const _userId = 'userId';
  static const _userName = 'userName';
  static const _userEmailId = 'userEmailId';
  static const _userContactNo = 'userContactNo';
  static const _activePin = 'activePin';

  Future<bool> userLoggedInStatus() async {
    await Hive.openBox(_authBox);
    final authBox = Hive.box(_authBox);
    if (authBox.containsKey(_authKey)) {
      _isAuthenticated = authBox.get(_authKey) ?? false;
    }
    await authBox.close();
    return _isAuthenticated;
  }

  Future<void> saveUser({required UserModel user}) async {
    await Hive.openBox(_authBox);
    final authBox = Hive.box(_authBox);
    await authBox.put(_authKey, true);
    await authBox.put(_userId, user.userId);
    await authBox.put(_userName, user.userName);
    await authBox.put(_userEmailId, user.userEmailId);
    await authBox.put(_userContactNo, user.userContactNo);
    await authBox.close();
  }

  Future<String> getUserId() async {
    await Hive.openBox(_authBox);
    final authBox = Hive.box(_authBox);
    final userId = await authBox.get(_userId);
    await authBox.close();
    return userId;
  }

  Future<void> deleteUser() async {
    await Hive.openBox(_authBox);
    final authBox = Hive.box(_authBox);
    await authBox.delete(_userId);
    await authBox.delete(_userName);
    await authBox.delete(_userEmailId);
    await authBox.delete(_userContactNo);
    await authBox.put(_authKey, false);
    await authBox.close();
  }

  Future<String> saveActivePin({required String activePin}) async {
    await Hive.openBox(_authBox);
    final authbox = Hive.box(_authBox);
    await authbox.put(_activePin, activePin);
    await authbox.close();
    return activePin;
  }

  Future<void> deleteActivePin() async {
    await Hive.openBox(_authBox);
    final authbox = Hive.box(_authBox);
    await authbox.delete(_activePin);
    await authbox.close();
  }
}
