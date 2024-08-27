import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:zap_sem_contato/modules/controllers/send_message_controller.dart';
// import 'package:zap_sem_contato/send_message_controller.dart';

// Mock para o URL Launcher
class MockUrlLauncher extends Mock implements UrlLauncherPlatform {}

void main() {
  late SendMessageController controller;
  late MockUrlLauncher mockUrlLauncher;

  setUp(() {
    controller = SendMessageController();
    mockUrlLauncher = MockUrlLauncher();
    UrlLauncherPlatform.instance = mockUrlLauncher;
  });

  // test(
  //     'sendMessageNoContact should return WhatsAppUnilink when tipeLink is true',
  //     () async {
  //   const ddi = '+55';
  //   const phoneNumber = '123456789';
  //   const message = 'Hello!';
  //   const tipeLink = true;

  //   final result = await controller.sendMessageNoContact(
  //     ddi: ddi,
  //     phoneNumber: phoneNumber,
  //     message: message,
  //     tipeLink: tipeLink,
  //   );

  //   expect(result, isA<WhatsAppUnilink>());
  //   final link = result as WhatsAppUnilink;
  //   expect(link.phoneNumber, ddi + phoneNumber);
  //   expect(link.text, message);
  // });

  // test('sendMessageNoContact should launch URL when tipeLink is false',
  //     () async {
  //   const ddi = '+55';
  //   const phoneNumber = '123456789';
  //   const message = 'Hello!';
  //   const tipeLink = false;

  //   final link = WhatsAppUnilink(
  //     phoneNumber: ddi + phoneNumber,
  //     text: message,
  //   );

  //   when(mockUrlLauncher.launch(
  //     link.asUri().toString(),
  //     useSafariVC: false,
  //     useWebView: false,
  //     enableJavaScript: false,
  //     enableDomStorage: false,
  //     universalLinksOnly: false,
  //     headers: {},
  //   )).thenAnswer((_) async => true);

  //   await controller.sendMessageNoContact(
  //     ddi: ddi,
  //     phoneNumber: phoneNumber,
  //     message: message,
  //     tipeLink: tipeLink,
  //   );

  //   verify(mockUrlLauncher.launch(
  //     link.asUri().toString(),
  //     useSafariVC: false,
  //     useWebView: false,
  //     enableJavaScript: false,
  //     enableDomStorage: false,
  //     universalLinksOnly: false,
  //     headers: {},
  //   )).called(1);
  // });

  // test('copyToClipboard should copy text to clipboard', () async {
  //   const text = 'Text to copy';
  //   await Clipboard.setData(ClipboardData(text: text));

  //   controller.copyToClipboard(text);

  //   final clipboardData = await Clipboard.getData('text/plain');
  //   expect(clipboardData!.text, text);
  // });

  // test('redirectUrl should launch URL', () async {
  //   const url = 'https://example.com';

  //   when(mockUrlLauncher.launch(
  //     url,
  //     useSafariVC: false,
  //     useWebView: false,
  //     enableJavaScript: false,
  //     enableDomStorage: false,
  //     universalLinksOnly: false,
  //     headers: {},
  //   )).thenAnswer((_) async => true);

  //   controller.redirectUrl(url);

  //   verify(mockUrlLauncher.launch(
  //     url,
  //     useSafariVC: false,
  //     useWebView: false,
  //     enableJavaScript: false,
  //     enableDomStorage: false,
  //     universalLinksOnly: false,
  //     headers: {},
  //   )).called(1);
  // });
}
