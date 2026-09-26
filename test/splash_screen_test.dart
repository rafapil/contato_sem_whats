import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:zap_sem_contato/modules/providers/links_provider.dart';
import 'package:zap_sem_contato/modules/splash/splash_screen.dart';
import 'package:zap_sem_contato/modules/views/send_message_screen.dart';
import 'test_helpers.dart';

void main() {
  setUpAll(() async {
    await initHiveForTest();
  });

  testWidgets('Navigates to SendMessageScreen', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider<LinksProvider>(
        create: (_) => LinksProvider(),
        child: MaterialApp(
          home: const SplashScreen(),
          routes: {
            '/message': (context) => const SendMessageScreen(),
          },
        ),
      ),
    );

    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    expect(find.byType(SendMessageScreen), findsOneWidget);
  });
}
