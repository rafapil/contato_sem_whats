import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:zap_sem_contato/modules/services/whats_app_launcher_service.dart';

import 'whats_app_launcher_service_test.mocks.dart';

@GenerateNiceMocks([MockSpec<PlatformInfo>(), MockSpec<UrlLauncherHelper>()])
void main() {
  late WhatsAppLauncherService service;
  late MockPlatformInfo mockPlatformInfo;
  late MockUrlLauncherHelper mockUrlLauncherHelper;

  setUp(() {
    mockPlatformInfo = MockPlatformInfo();
    mockUrlLauncherHelper = MockUrlLauncherHelper();
    service = WhatsAppLauncherService(
      platformInfo: mockPlatformInfo,
      urlLauncherHelper: mockUrlLauncherHelper,
    );
    // Default: treat as Android so native path is taken
    when(mockPlatformInfo.isAndroid).thenReturn(true);
    when(mockPlatformInfo.isIOS).thenReturn(false);
  });

  group('openWhatsApp validation', () {
    test('returns false for empty phone', () async {
      final result = await service.openWhatsApp(
        ddi: '+55',
        phone: '',
        type: WhatsAppType.normal,
      );
      expect(result, isFalse);
    });

    test('returns false for phone < 7 digits', () async {
      final result = await service.openWhatsApp(
        ddi: '+55',
        phone: '123456',
        type: WhatsAppType.normal,
      );
      expect(result, isFalse);
    });

    test('returns false for phone with non-digit characters (after cleaning)', () async {
      // After cleaning, 'abc' has 0 digits → < 7
      final result = await service.openWhatsApp(
        ddi: '+55',
        phone: 'abc',
        type: WhatsAppType.normal,
      );
      expect(result, isFalse);
    });
  });

  group('openWhatsApp success path', () {
    test('returns true when native link succeeds', () async {
      when(mockUrlLauncherHelper.canLaunch(any)).thenAnswer((_) async => true);
      when(mockUrlLauncherHelper.launch(any, mode: anyNamed('mode'), webOnlyWindowName: anyNamed('webOnlyWindowName')))
          .thenAnswer((_) async => true);

      final result = await service.openWhatsApp(
        ddi: '+55',
        phone: '11999998888',
        message: 'Hello',
        type: WhatsAppType.normal,
      );
      expect(result, isTrue);
    });
  });

  group('_tryOpenNative Android', () {
    test('WhatsAppType.normal on Android uses com.whatsapp package', () async {
      when(mockUrlLauncherHelper.canLaunch(any)).thenAnswer((_) async => true);
      when(mockUrlLauncherHelper.launch(any,
              mode: anyNamed('mode'),
              webOnlyWindowName: anyNamed('webOnlyWindowName')))
          .thenAnswer((_) async => true);

      await service.openWhatsApp(
        ddi: '+55',
        phone: '11999998888',
        type: WhatsAppType.normal,
      );

      final captured = verify(
        mockUrlLauncherHelper.launch(
          captureAny,
          mode: anyNamed('mode'),
          webOnlyWindowName: captureAnyNamed('webOnlyWindowName'),
        ),
      );

      expect(captured.captured[1], equals('com.whatsapp'));
    });

    test('WhatsAppType.business on Android uses com.whatsapp.w4b package', () async {
      when(mockUrlLauncherHelper.canLaunch(any)).thenAnswer((_) async => true);
      when(mockUrlLauncherHelper.launch(any,
              mode: anyNamed('mode'),
              webOnlyWindowName: anyNamed('webOnlyWindowName')))
          .thenAnswer((_) async => true);

      await service.openWhatsApp(
        ddi: '+55',
        phone: '11999998888',
        type: WhatsAppType.business,
      );

      final captured = verify(
        mockUrlLauncherHelper.launch(
          captureAny,
          mode: anyNamed('mode'),
          webOnlyWindowName: captureAnyNamed('webOnlyWindowName'),
        ),
      );

      expect(captured.captured[1], equals('com.whatsapp.w4b'));
    });
  });

  group('_tryOpenNative iOS', () {
    test('WhatsAppType.normal on iOS uses whatsapp:// scheme', () async {
      when(mockPlatformInfo.isAndroid).thenReturn(false);
      when(mockPlatformInfo.isIOS).thenReturn(true);
      when(mockUrlLauncherHelper.canLaunch(any)).thenAnswer((_) async => true);
      when(mockUrlLauncherHelper.launch(any, mode: anyNamed('mode')))
          .thenAnswer((_) async => true);

      await service.openWhatsApp(
        ddi: '+55',
        phone: '11999998888',
        type: WhatsAppType.normal,
      );

      final captured = verify(
        mockUrlLauncherHelper.launch(captureAny, mode: anyNamed('mode')),
      );
      final launchedUri = captured.captured[0] as Uri;
      expect(launchedUri.toString(), startsWith('whatsapp://'));
    });

    test('WhatsAppType.business on iOS uses wab:// scheme', () async {
      when(mockPlatformInfo.isAndroid).thenReturn(false);
      when(mockPlatformInfo.isIOS).thenReturn(true);
      when(mockUrlLauncherHelper.canLaunch(any)).thenAnswer((_) async => true);
      when(mockUrlLauncherHelper.launch(any, mode: anyNamed('mode')))
          .thenAnswer((_) async => true);

      await service.openWhatsApp(
        ddi: '+55',
        phone: '11999998888',
        type: WhatsAppType.business,
      );

      final captured = verify(
        mockUrlLauncherHelper.launch(captureAny, mode: anyNamed('mode')),
      );
      final launchedUri = captured.captured[0] as Uri;
      expect(launchedUri.toString(), startsWith('wab://'));
    });
  });

  group('_fallbackToWeb', () {
    test('is called when native fails', () async {
      // _tryAndroid's canLaunch returns false → _tryAndroid returns false
      // → _fallbackToWeb is called, which calls launch on wa.me
      when(mockUrlLauncherHelper.canLaunch(any)).thenAnswer((_) async => false);
      when(mockUrlLauncherHelper.launch(any, mode: anyNamed('mode')))
          .thenAnswer((_) async => false);

      final result = await service.openWhatsApp(
        ddi: '+55',
        phone: '11999998888',
        message: 'Hello',
        type: WhatsAppType.normal,
      );

      // 1 canLaunch from _tryAndroid; launch from _fallbackToWeb (canLaunch not called in fallback)
      verify(mockUrlLauncherHelper.canLaunch(any)).called(1);
      verify(mockUrlLauncherHelper.launch(any, mode: anyNamed('mode'))).called(1);
      expect(result, isFalse);
    });

    test('returns true when wa.me succeeds', () async {
      when(mockUrlLauncherHelper.canLaunch(any)).thenAnswer((_) async => true);
      when(mockUrlLauncherHelper.launch(any, mode: anyNamed('mode')))
          .thenAnswer((_) async => true);

      final result = await service.openWhatsApp(
        ddi: '+55',
        phone: '11999998888',
        message: 'Hello',
        type: WhatsAppType.normal,
      );

      expect(result, isTrue);
    });
  });
}
