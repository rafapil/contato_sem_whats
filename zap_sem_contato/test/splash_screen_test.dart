import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zap_sem_contato/modules/splash/splash_screen.dart';
import 'package:zap_sem_contato/modules/views/send_message_screen.dart';

void main() {
  testWidgets('Navigates to SendMessageScreen', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: const SplashScreen(),
        routes: {
          '/message': (context) => const SendMessageScreen(),
        },
      ),
    );

    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    expect(find.byType(SendMessageScreen), findsOneWidget);
  });
}
