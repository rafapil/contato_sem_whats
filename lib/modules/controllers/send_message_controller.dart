import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class SendMessageController {
  Future<dynamic> sendMessageNoContact(
      {ddi, phoneNumber, message, tipeLink}) async {
    if (phoneNumber.length > 6) {
      String comprelePhoneNumber = ddi + phoneNumber;

      final link = WhatsAppUnilink(
        phoneNumber: comprelePhoneNumber,
        text: message,
      );

      if (tipeLink) {
        return link;
      } else {
        await launchUrl(link.asUri());
      }
    } else {
      return null;
    }
  }

  void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  void redirectUrl(String link) {
    launchUrl(Uri.parse(link));
  }
}
