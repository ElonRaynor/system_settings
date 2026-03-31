# system_settings

本项目基于 [system_settings](https://github.com/fweinaug/system_settings) 开发，为 OpenHarmony Flutter 场景提供系统设置页跳转能力。

## 1. 安装与使用

### 1.1 安装方式

进入工程目录并在 `pubspec.yaml` 中添加依赖：

#### pubspec.yaml

```yaml
dependencies:
  system_settings:
    git:
      url: https://gitcode.com/org/OpenHarmony-Flutter/system_settings
      ref: master
```

执行命令：

```bash
flutter pub get
```

### 1.2 使用案例

使用案例详见 [example](example/lib/main.dart)。

最简单的调用方式：

```dart
import 'package:system_settings/system_settings.dart';

Future<void> openBasicSettings() async {
  await SystemSettings.wifi();
  await SystemSettings.bluetooth();
}
```

## 2. 约束条件

1. Flutter: 3.22.0-ohos; SDK: 5.0.0 (12); IDE: DevEco Studio 5.1.0.828; ROM: 5.1.0.130 SP8
2. Flutter: oh-3.27.4-dev; SDK: 5.0.0 (12); IDE: DevEco Studio 5.1.0.828; ROM: 5.1.0.130 SP8
3. Flutter: 3.35.8-ohos-0.0.1; SDK: 6.0.1 (21); IDE: DevEco Studio 6.0.1.260; ROM: 6.0.0.120 SP6

## 3. 版本和框架对应关系

| 版本  | 3.7 | 3.22 | 3.27 | 3.35 |
| ---- | :--: | :--: | :--: | :--: |
| 1.0.0 | ❌ | ✅ | ✅ | ✅ |

## 4. API

> [!TIP] "ohos Support" 列：yes 表示支持；no 表示不支持；partially 表示部分支持。

| Name | Description | Type | Input | Output | ohos Support |
| --- | --- | --- | --- | --- | --- |
| `SystemSettings.powerOptions()` | 打开电池/电源管理设置页面 | function | 无 | `Future<void>` | yes |
| `SystemSettings.app()` | 打开当前应用设置详情页 | function | 无 | `Future<void>` | yes |
| `SystemSettings.appNotifications()` | 打开当前应用通知设置页 | function | 无 | `Future<void>` | yes |
| `SystemSettings.system()` | 打开系统设置首页 | function | 无 | `Future<void>` | yes |
| `SystemSettings.location()` | 打开定位设置页面 | function | 无 | `Future<void>` | yes |
| `SystemSettings.wifi()` | 打开 WLAN 设置页面 | function | 无 | `Future<void>` | yes |
| `SystemSettings.bluetooth()` | 打开蓝牙设置页面 | function | 无 | `Future<void>` | yes |
| `SystemSettings.nfc()` | 打开 NFC 设置页面 | function | 无 | `Future<void>` | yes |
| `SystemSettings.security()` | 打开安全与密码设置页面 | function | 无 | `Future<void>` | yes |
| `SystemSettings.display()` | 打开显示设置页面 | function | 无 | `Future<void>` | yes |
| `SystemSettings.date()` | 打开日期和时间设置页面 | function | 无 | `Future<void>` | yes |
| `SystemSettings.sound()` | 打开声音设置页面 | function | 无 | `Future<void>` | yes |
| `SystemSettings.apps()` | 打开应用与服务设置页面 | function | 无 | `Future<void>` | yes |
| `SystemSettings.wireless()` | 打开移动网络设置页面 | function | 无 | `Future<void>` | yes |
| `SystemSettings.deviceInfo()` | 打开关于设备页面 | function | 无 | `Future<void>` | yes |
| `SystemSettings.dataUsage()` | 打开数据流量设置页面 | function | 无 | `Future<void>` | yes |
| `SystemSettings.dataRoaming()` | 打开数据漫游相关设置入口 | function | 无 | `Future<void>` | yes |
| `SystemSettings.locale()` | 打开语言和地区设置页面 | function | 无 | `Future<void>` | yes |
| `SystemSettings.defaultApps()` | 打开默认应用相关设置入口 | function | 无 | `Future<void>` | no |
| `SystemSettings.airplaneMode()` | 打开飞行模式相关设置入口 | function | 无 | `Future<void>` | yes |
| `SystemSettings.privacy()` | 打开隐私设置页面 | function | 无 | `Future<void>` | yes |
| `SystemSettings.accessibility()` | 打开无障碍设置页面 | function | 无 | `Future<void>` | yes |
| `SystemSettings.internalStorage()` | 打开存储设置页面 | function | 无 | `Future<void>` | yes |
| `SystemSettings.notificationPolicy()` | 打开智能场景/通知策略设置入口 | function | 无 | `Future<void>` | yes |

## 5. 遗留问题

1. `SystemSettings.dataUsage()` 与 `SystemSettings.dataRoaming()` 当前都跳转到同一系统页面（移动数据设置页），无法像 Android 一样精确区分到独立入口。
2. `SystemSettings.notificationPolicy()` 在 Android 对应“勿扰权限/通知策略”页面，在 OpenHarmony 当前映射为“情景模式（智能场景）”入口，平台语义存在差异。
3. `SystemSettings.defaultApps()` 默认应用页面鸿蒙不支持


## 6. 开源协议

本项目基于 [MIT](LICENSE) 开源。
