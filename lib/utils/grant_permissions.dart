import 'package:permission_handler/permission_handler.dart';

class GrantPermissions {
  static final GrantPermissions _instance = GrantPermissions._();
  factory GrantPermissions() => _instance;
  GrantPermissions._();

  late bool _locationPermissionGranted;
  late bool _smsPermissionGranted;
  late bool _cameraPermissionGranted;
  late bool _microphonePermissionGranted;
  late bool _contactsPermissionGranted;
  late bool _allPermissionsGranted;

  init() async {
    _locationPermissionGranted = await Permission.location.status.isGranted;
    _smsPermissionGranted = await Permission.sms.status.isGranted;
    _cameraPermissionGranted = await Permission.camera.status.isGranted;
    _microphonePermissionGranted = await Permission.microphone.status.isGranted;
    _contactsPermissionGranted = await Permission.contacts.status.isGranted;
    _allPermissionsGranted = _locationPermissionGranted &
        _smsPermissionGranted &
        _cameraPermissionGranted &
        _microphonePermissionGranted &
        _contactsPermissionGranted;
  }

  Future<void> grantAllPermissions() async {
    if (!_locationPermissionGranted) {
      await Permission.location.request();
      _locationPermissionGranted = await Permission.location.status.isGranted;
    }
    if (!_smsPermissionGranted) {
      await Permission.sms.request();
      _smsPermissionGranted = await Permission.sms.status.isGranted;
    }
    if (!_cameraPermissionGranted) {
      await Permission.camera.request();
      _cameraPermissionGranted = await Permission.camera.status.isGranted;
    }
    if (!_microphonePermissionGranted) {
      await Permission.microphone.request();
      _microphonePermissionGranted =
          await Permission.microphone.status.isGranted;
    }
    if (!_contactsPermissionGranted) {
      await Permission.contacts.request();
      _contactsPermissionGranted = await Permission.contacts.status.isGranted;
    }
    await _refreshPermissionStatus();
  }

  Future<bool> checkIfPermissionsArePermanentlyDenied() async {
    final bool locationPermanentlyDenied =
        await Permission.location.isPermanentlyDenied;
    final bool smsPermanentlyDenied = await Permission.sms.isPermanentlyDenied;
    final bool cameraPermanentlyDenied =
        await Permission.camera.isPermanentlyDenied;
    final bool microphonePermanentlyDenied =
        await Permission.microphone.isPermanentlyDenied;
    final bool contactsPermanentlyDenied =
        await Permission.contacts.isPermanentlyDenied;

    return locationPermanentlyDenied ||
        smsPermanentlyDenied ||
        cameraPermanentlyDenied ||
        microphonePermanentlyDenied ||
        contactsPermanentlyDenied;
  }

  Future<void> _refreshPermissionStatus() async {
    _locationPermissionGranted = await Permission.location.status.isGranted;
    _smsPermissionGranted = await Permission.sms.status.isGranted;
    _cameraPermissionGranted = await Permission.camera.status.isGranted;
    _microphonePermissionGranted = await Permission.microphone.status.isGranted;
    _contactsPermissionGranted = await Permission.contacts.status.isGranted;
    _allPermissionsGranted = _locationPermissionGranted &&
        _smsPermissionGranted &&
        _cameraPermissionGranted &&
        _microphonePermissionGranted &&
        _contactsPermissionGranted;
  }

  bool get allPermissionsGranted => _allPermissionsGranted;
}
