import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

enum WhatsAppType { normal, business }

/// Abstraction over platform checks for testability.
class PlatformInfo {
  bool get isAndroid => Platform.isAndroid;
  bool get isIOS => Platform.isIOS;
}

/// Abstraction over url_launcher for testability.
class UrlLauncherHelper {
  Future<bool> canLaunch(Uri uri) => canLaunchUrl(uri);
  Future<bool> launch(Uri uri, {LaunchMode? mode, String? webOnlyWindowName}) {
    return launchUrl(uri, mode: mode ?? LaunchMode.externalApplication, webOnlyWindowName: webOnlyWindowName);
  }
}

class WhatsAppLauncherService {
  final PlatformInfo _platformInfo;
  final UrlLauncherHelper _urlLauncherHelper;

  static const String _whatsappNormalPkg = 'com.whatsapp';
  static const String _whatsappBusinessPkg = 'com.whatsapp.w4b';
  static const String _whatsappScheme = 'whatsapp://';
  static const String _waBusinessScheme = 'wab://';

  WhatsAppLauncherService({
    PlatformInfo? platformInfo,
    UrlLauncherHelper? urlLauncherHelper,
  })  : _platformInfo = platformInfo ?? PlatformInfo(),
        _urlLauncherHelper = urlLauncherHelper ?? UrlLauncherHelper();

  Future<bool> openWhatsApp({
    required String ddi,
    required String phone,
    String? message,
    required WhatsAppType type,
  }) async {
    final cleanedPhone = phone.replaceAll(RegExp(r'\D'), '');
    if (cleanedPhone.length < 7) {
      return false;
    }

    final fullPhone = '$ddi$cleanedPhone';

    final nativeResult = await _tryOpenNative(fullPhone, message, type);
    if (nativeResult) {
      return true;
    }

    return _fallbackToWeb(fullPhone, message);
  }

  Future<bool> _tryOpenNative(
    String fullPhone,
    String? message,
    WhatsAppType type,
  ) async {
    final link = WhatsAppUnilink(
      phoneNumber: fullPhone,
      text: message,
    );
    final uri = await link.asUri();

    if (_platformInfo.isAndroid) {
      return _tryAndroid(uri, type);
    } else if (_platformInfo.isIOS) {
      return _tryIOS(uri, type);
    }
    return false;
  }

  Future<bool> _tryAndroid(Uri uri, WhatsAppType type) async {
    final package = type == WhatsAppType.business
        ? _whatsappBusinessPkg
        : _whatsappNormalPkg;

    final phone = uri.pathSegments.isNotEmpty ? uri.pathSegments.first : '';
    final text = uri.queryParameters['text'] ?? '';
    final webUri = Uri.parse(
      'https://wa.me/$phone${text.isNotEmpty ? '?text=${Uri.encodeComponent(text)}' : ''}',
    );

    if (await _urlLauncherHelper.canLaunch(webUri)) {
      return _urlLauncherHelper.launch(
        webUri,
        mode: LaunchMode.externalApplication,
        webOnlyWindowName: package,
      );
    }
    return false;
  }

  Future<bool> _tryIOS(Uri uri, WhatsAppType type) async {
    final scheme = type == WhatsAppType.business ? _waBusinessScheme : _whatsappScheme;

    final iosUri = Uri.parse(
      '${scheme}send?phone=${uri.pathSegments.isNotEmpty ? uri.pathSegments.first : ''}'
      '${uri.queryParameters.containsKey('text') ? '&text=${Uri.encodeComponent(uri.queryParameters['text']!)}' : ''}',
    );

    if (await _urlLauncherHelper.canLaunch(iosUri)) {
      return _urlLauncherHelper.launch(iosUri, mode: LaunchMode.externalApplication);
    }
    return false;
  }

  Future<bool> _fallbackToWeb(String fullPhone, String? message) async {
    final link = WhatsAppUnilink(
      phoneNumber: fullPhone,
      text: message,
    );
    final uri = await link.asUri();
    return _urlLauncherHelper.launch(uri, mode: LaunchMode.externalApplication);
  }
}
