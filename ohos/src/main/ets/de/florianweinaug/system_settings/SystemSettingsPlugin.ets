import {
  FlutterPlugin,
  FlutterPluginBinding,
  MethodCall,
  MethodCallHandler,
  MethodChannel,
  MethodResult,
} from '@ohos/flutter_ohos';
import { FlutterManager } from '@ohos/flutter_ohos';
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@kit.BasicServicesKit';

/** SystemSettingsPlugin **/
export default class SystemSettingsPlugin implements FlutterPlugin, MethodCallHandler {
  private channel: MethodChannel | null = null;
  private uiAbilityContext: common.UIAbilityContext | null = null;

  constructor() {
  }

  getUniqueClassName(): string {
    return "SystemSettingsPlugin"
  }

  onAttachedToEngine(binding: FlutterPluginBinding): void {
    // StartAbilities must use UIAbilityContext (common.Context doesn't expose startAbility in ArkTS).
    try {
      const uiAbility = FlutterManager.getInstance().getUIAbility();
      this.uiAbilityContext = uiAbility.context as common.UIAbilityContext;
    } catch (_) {
      this.uiAbilityContext = null;
    }
    this.channel = new MethodChannel(binding.getBinaryMessenger(), "system_settings");
    this.channel.setMethodCallHandler(this)
  }

  onDetachedFromEngine(binding: FlutterPluginBinding): void {
    if (this.channel != null) {
      this.channel.setMethodCallHandler(null)
    }
    this.uiAbilityContext = null;
  }

  onMethodCall(call: MethodCall, result: MethodResult): void {
    const method = call.method;

    switch (method) {
      case "getPlatformVersion":
        result.success("OpenHarmony ^ ^ ")
        return;
      case "app":
        this.openAppSettings(result);
        return;
      case "app-notifications":
        this.openAppNotificationSettings(result);
        return;
      case "system":
        this.openSystemSettings(result);
        return;
      case "location":
        this.openSettingUri("location_manager_settings", result);
        return;
      case "wifi":
        this.openSettingUri("wifi_entry", result);
        return;
      case "bluetooth":
        this.openSettingUri("bluetooth_entry", result);
        return;
      case "nfc":
        this.openSettingUri("nfc_settings", result);
        return;
      case "security":
        this.openSettingUri("biometrics_and_password_settings", result);
        return;
      case "display":
        this.openSettingUri("display_settings", result);
        return;
      case "date":
        this.openSettingUri("date_and_time", result);
        return;
      case "sound":
        this.openSettingUri("volume_settings", result);
        return;
      case "apps":
        this.openSettingUris(["application_and_service_settings"], result);
        return;
      case "wireless":
        this.openSettingUris(["more_connections_settings", "mobile_network_entry"], result);
        return;
      case "device-info":
        this.openSettingUris(["about_device", "system_and_updates"], result);
        return;
      case "data-usage":
        this.openSettingUris(["mobile_network_entry"], result);
        return;
      case "data-roaming":
        this.openSettingUris(["mobile_network_entry"], result);
        return;
      case "locale":
        this.openSettingUris(["system_and_updates"], result);
        return;
      case "default-apps":
        this.openSettingUris(["application_and_service_settings"], result);
        return;
      case "airplane-mode":
        this.openSettingUris(["more_connections_settings", "mobile_network_entry"], result);
        return;
      case "privacy":
        this.openSettingUris(["privacy_settings"], result);
        return;
      case "accessibility":
        this.openSettingUris(["accessibility_feature"], result);
        return;
      case "internal-storage":
        this.openSettingUris(["storage_settings"], result);
        return;
      case "notification-policy":
        this.openSettingUris(["systemui_notification_settings"], result);
        return;
      case "power-options":
        this.openSettingUri("battery", result);
        return;
      default:
        result.notImplemented()
        return;
    }
  }

  private getUiAbilityContext(): common.UIAbilityContext {
    const ctx = this.uiAbilityContext;
    if (!ctx) {
      throw new Error("uiAbilityContext is null");
    }
    return ctx;
  }

  private getSelfBundleName(): string {
    return this.getUiAbilityContext().abilityInfo.bundleName;
  }

  private async startSettingsAbility(want: Want): Promise<void> {
    await this.getUiAbilityContext().startAbility(want);
  }

  private async openSystemSettingsInternal(): Promise<void> {
    await this.startSettingsAbility({
      bundleName: 'com.huawei.hmos.settings',
      abilityName: 'com.huawei.hmos.settings.MainAbility',
    });
  }

  private openSystemSettings(result: MethodResult): void {
    this.openSystemSettingsInternal()
      .then(() => result.success(null))
      .catch((err: BusinessError | Error) => result.error("error", JSON.stringify(err), null));
  }

  private openSettingUri(uri: string, result: MethodResult): void {
    this.openSettingUris([uri], result);
  }

  private openSettingUris(uris: string[], result: MethodResult): void {
    const tryStart = async (): Promise<void> => {
      for (const uri of uris) {
        await this.startSettingsAbility({
          bundleName: 'com.huawei.hmos.settings',
          abilityName: 'com.huawei.hmos.settings.MainAbility',
          uri,
        });
        return;
      }
      await this.openSystemSettingsInternal();
    };

    tryStart()
      .then(() => result.success(null))
      .catch((err: BusinessError | Error) => result.error("error", JSON.stringify(err), null));
  }

  private openAppSettings(result: MethodResult): void {
    const run = async (): Promise<void> => {
      const bundleName = this.getSelfBundleName();
      await this.startSettingsAbility({
        bundleName: 'com.huawei.hmos.settings',
        abilityName: 'com.huawei.hmos.settings.MainAbility',
        uri: 'application_info_entry',
        parameters: {
          pushParams: bundleName,
        }
      });
    };

    run()
      .then(() => result.success(null))
      .catch((err: BusinessError | Error) => result.error("error", JSON.stringify(err), null));
  }

  private openAppNotificationSettings(result: MethodResult): void {
    const run = async (): Promise<void> => {
      const bundleName = this.getSelfBundleName();
      await this.startSettingsAbility({
        bundleName: 'com.huawei.hmos.settings',
        abilityName: 'com.huawei.hmos.settings.MainAbility',
        uri: 'systemui_notification_settings',
        parameters: {
          pushParams: {
            bundleName,
          }
        }
      });
    };

    run()
      .then(() => result.success(null))
      .catch((err: BusinessError | Error) => result.error("error", JSON.stringify(err), null));
  }

  private async openAppSettingsInternal(bundleName: string): Promise<void> {
    await this.startSettingsAbility({
      bundleName: 'com.huawei.hmos.settings',
      abilityName: 'com.huawei.hmos.settings.MainAbility',
      uri: 'application_info_entry',
      parameters: {
        pushParams: bundleName,
      }
    });
  }
}