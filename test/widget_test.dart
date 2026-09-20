import 'package:flutter_test/flutter_test.dart';
import 'package:zap_sem_contato/app_widget.dart';
import 'package:zap_sem_contato/modules/splash/splash_screen.dart';

void main() {
  testWidgets('AppWidget loads and navigates correctly from SplashScreen',
      (WidgetTester tester) async {
    await tester.pumpWidget(const AppWidget());
    expect(find.byType(SplashScreen), findsOneWidget);
    await tester.pump(const Duration(seconds: 3));
  });
}
