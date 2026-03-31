# system_settings

This project is based on [system_settings](https://github.com/fweinaug/system_settings) and provides system settings navigation support for Flutter on OpenHarmony.

## 1. Installation and Usage

### 1.1 Installation

Add the dependency in `pubspec.yaml`:

#### pubspec.yaml

```yaml
dependencies:
  system_settings:
    git:
      url: https://gitcode.com/org/OpenHarmony-Flutter/system_settings
      ref: master
```

Then run:

```bash
flutter pub get
```

### 1.2 Example

See [example](example/lib/main.dart) for full usage.

The simplest usage:

```dart
import 'package:system_settings/system_settings.dart';

Future<void> openBasicSettings() async {
  await SystemSettings.wifi();
  await SystemSettings.bluetooth();
}
```

## 2. Constraints

1. Flutter: 3.22.0-ohos; SDK: 5.0.0 (12); IDE: DevEco Studio 5.1.0.828; ROM: 5.1.0.130 SP8
2. Flutter: oh-3.27.4-dev; SDK: 5.0.0 (12); IDE: DevEco Studio 5.1.0.828; ROM: 5.1.0.130 SP8
3. Flutter: 3.35.8-ohos-0.0.1; SDK: 6.0.1 (21); IDE: DevEco Studio 6.0.1.260; ROM: 6.0.0.120 SP6

## 3. Version and Framework Mapping

| Version | 3.7 | 3.22 | 3.27 | 3.35 |
| ---- | :--: | :--: | :--: | :--: |
| 1.0.0 | ❌ | ✅ | ✅ | ✅ |

## 4. API

> [!TIP] In "ohos Support": yes means supported; no means unsupported; partially means partially supported.

| Name | Description | Type | Input | Output | ohos Support |
| --- | --- | --- | --- | --- | --- |
| `SystemSettings.powerOptions()` | Open battery and power management settings page | function | None | `Future<void>` | yes |
| `SystemSettings.app()` | Open current app settings details page | function | None | `Future<void>` | yes |
| `SystemSettings.appNotifications()` | Open current app notification settings page | function | None | `Future<void>` | yes |
| `SystemSettings.system()` | Open system settings home page | function | None | `Future<void>` | yes |
| `SystemSettings.location()` | Open location settings page | function | None | `Future<void>` | yes |
| `SystemSettings.wifi()` | Open WLAN settings page | function | None | `Future<void>` | yes |
| `SystemSettings.bluetooth()` | Open Bluetooth settings page | function | None | `Future<void>` | yes |
| `SystemSettings.nfc()` | Open NFC settings page | function | None | `Future<void>` | yes |
| `SystemSettings.security()` | Open security and password settings page | function | None | `Future<void>` | yes |
| `SystemSettings.display()` | Open display settings page | function | None | `Future<void>` | yes |
| `SystemSettings.date()` | Open date and time settings page | function | None | `Future<void>` | yes |
| `SystemSettings.sound()` | Open sound settings page | function | None | `Future<void>` | yes |
| `SystemSettings.apps()` | Open apps and services settings page | function | None | `Future<void>` | yes |
| `SystemSettings.wireless()` | Open mobile network settings page | function | None | `Future<void>` | yes |
| `SystemSettings.deviceInfo()` | Open about device page | function | None | `Future<void>` | yes |
| `SystemSettings.dataUsage()` | Open mobile data usage settings page | function | None | `Future<void>` | yes |
| `SystemSettings.dataRoaming()` | Open data roaming related settings entry | function | None | `Future<void>` | yes |
| `SystemSettings.locale()` | Open language and region settings page | function | None | `Future<void>` | yes |
| `SystemSettings.defaultApps()` | Open default apps related settings entry | function | None | `Future<void>` | no |
| `SystemSettings.airplaneMode()` | Open airplane mode related settings entry | function | None | `Future<void>` | yes |
| `SystemSettings.privacy()` | Open privacy settings page | function | None | `Future<void>` | yes |
| `SystemSettings.accessibility()` | Open accessibility settings page | function | None | `Future<void>` | yes |
| `SystemSettings.internalStorage()` | Open storage settings page | function | None | `Future<void>` | yes |
| `SystemSettings.notificationPolicy()` | Open scene mode and notification policy related entry | function | None | `Future<void>` | yes |

## 5. Known Issues

1. `SystemSettings.dataUsage()` and `SystemSettings.dataRoaming()` currently navigate to the same system page (mobile data settings), and cannot be separated into distinct entries as on Android.
2. `SystemSettings.notificationPolicy()` maps to a "Do Not Disturb / notification policy" page on Android, but currently maps to "Scene Mode (Intelligent Scene)" on OpenHarmony, so there is a platform semantic difference.
3. `SystemSettings.defaultApps()` is not supported on OpenHarmony (no corresponding default apps settings page).

## 6. License

This project is open-sourced under [MIT](LICENSE).
