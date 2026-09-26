import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class LinkGeneratorController {
  String? _generatedLink;
  String? get generatedLink => _generatedLink;

  String generateLink({
    required String ddi,
    required String phone,
    String? message,
  }) {
    if (phone.isEmpty || phone.length < 7) {
      _generatedLink = null;
      return '';
    }

    final cleanPhone = phone.replaceAll(RegExp(r'[^\d]'), '');
    final fullPhone = '$ddi$cleanPhone';

    final link = WhatsAppUnilink(
      phoneNumber: fullPhone,
      text: message,
    );

    _generatedLink = link.asUri().toString();
    return _generatedLink!;
  }

  Future<bool> openWhatsApp({
    required String ddi,
    required String phone,
    String? message,
  }) async {
    if (phone.isEmpty || phone.length < 7) {
      return false;
    }

    final cleanPhone = phone.replaceAll(RegExp(r'[^\d]'), '');
    final fullPhone = '$ddi$cleanPhone';

    final link = WhatsAppUnilink(
      phoneNumber: fullPhone,
      text: message,
    );

    try {
      await launchUrl(link.asUri(), mode: LaunchMode.externalApplication);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
  }

  bool validatePhone(String phone) {
    final cleanPhone = phone.replaceAll(RegExp(r'[^\d]'), '');
    return cleanPhone.length >= 7 && cleanPhone.length <= 15;
  }
}
