import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:system_settings/system_settings.dart';

void main() {
  const MethodChannel channel = MethodChannel('system_settings');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      switch (methodCall.method) {
        case 'app':
        case 'app-notifications':
        case 'system':
        case 'location':
        case 'wifi':
        case 'bluetooth':
        case 'nfc':
        case 'security':
        case 'display':
        case 'date':
        case 'sound':
        case 'apps':
        case 'wireless':
        case 'device-info':
        case 'data-usage':
        case 'data-roaming':
        case 'locale':
        case 'default-apps':
        case 'airplane-mode':
        case 'privacy':
        case 'accessibility':
        case 'internal-storage':
        case 'notification-policy':
        case 'power-options':
          return null;
        default:
          throw MissingPluginException('not implemented');
      }
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('open app settings', () async {
    await SystemSettings.app();
  });

  test('open app notifications settings', () async {
    await SystemSettings.appNotifications();
  });

  test('open system settings', () async {
    await SystemSettings.system();
  });

  test('open location settings', () async {
    await SystemSettings.location();
  });

  test('open wifi settings', () async {
    await SystemSettings.wifi();
  });

  test('open bluetooth settings', () async {
    await SystemSettings.bluetooth();
  });

  test('open nfc settings', () async {
    await SystemSettings.nfc();
  });

  test('open security settings', () async {
    await SystemSettings.security();
  });

  test('open display settings', () async {
    await SystemSettings.display();
  });

  test('open date settings', () async {
    await SystemSettings.date();
  });

  test('open sound settings', () async {
    await SystemSettings.sound();
  });

  test('open apps settings', () async {
    await SystemSettings.apps();
  });

  test('open wireless settings', () async {
    await SystemSettings.wireless();
  });

  test('open device info settings', () async {
    await SystemSettings.deviceInfo();
  });

  test('open data usage settings', () async {
    await SystemSettings.dataUsage();
  });

  test('open data roaming settings', () async {
    await SystemSettings.dataRoaming();
  });

  test('open locale settings', () async {
    await SystemSettings.locale();
  });

  test('open default apps settings', () async {
    await SystemSettings.defaultApps();
  });

  test('open airplane mode settings', () async {
    await SystemSettings.airplaneMode();
  });

  test('open privacy settings', () async {
    await SystemSettings.privacy();
  });

  test('open accessibility settings', () async {
    await SystemSettings.accessibility();
  });

  test('open internal storage settings', () async {
    await SystemSettings.internalStorage();
  });

  test('open notification policy settings', () async {
    await SystemSettings.notificationPolicy();
  });

  test('open power options settings', () async {
    await SystemSettings.powerOptions();
  });
}
