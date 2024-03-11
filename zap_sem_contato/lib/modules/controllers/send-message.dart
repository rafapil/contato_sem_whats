import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class SendMessage {
  Future<dynamic> sendMessageNoContact({phoneNumber, message, tipeLink}) async {
    // return true;
    final link = WhatsAppUnilink(
      phoneNumber: phoneNumber,
      text: message,
    );

    tipeLink ? await launchUrlString('$link') : await launchUrl(link.asUri());

    // return await launchUrl(link.asUri());
  }

  // Future<dynamic> createLinkNoContatac(phoneNumber, message) async {}
}
