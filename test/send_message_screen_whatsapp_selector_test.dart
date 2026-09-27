import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zap_sem_contato/modules/services/whats_app_launcher_service.dart';
import 'package:zap_sem_contato/shared/themes/app_strings.dart';

void main() {
  /// Helper that mimics _showWhatsAppSelectorDialog from SendMessageScreen.
  Future<WhatsAppType?> showWhatsAppSelectorDialog(BuildContext context) {
    return showModalBottomSheet<WhatsAppType>(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                AppStrings.dialogSelecionarWhatsApp,
                style: Theme.of(ctx).textTheme.titleMedium,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.chat),
              title: Text(AppStrings.optionWhatsAppNormal),
              onTap: () => Navigator.pop(ctx, WhatsAppType.normal),
            ),
            ListTile(
              leading: const Icon(Icons.business),
              title: Text(AppStrings.optionWhatsAppBusiness),
              onTap: () => Navigator.pop(ctx, WhatsAppType.business),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.close),
              title: Text(AppStrings.btnCancel),
              onTap: () => Navigator.pop(ctx),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  group('WhatsApp Selector Dialog', () {
    testWidgets('shows dialog with title and all three options', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () => showWhatsAppSelectorDialog(context),
                child: const Text('Open'),
              ),
            ),
          ),
        ),
      );

      // Open dialog
      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      // Verify title
      expect(find.text(AppStrings.dialogSelecionarWhatsApp), findsOneWidget);

      // Verify all three options
      expect(find.text(AppStrings.optionWhatsAppNormal), findsOneWidget);
      expect(find.text(AppStrings.optionWhatsAppBusiness), findsOneWidget);
      expect(find.text(AppStrings.btnCancel), findsOneWidget);

      // Verify icons
      expect(find.byIcon(Icons.chat), findsOneWidget);
      expect(find.byIcon(Icons.business), findsOneWidget);
      expect(find.byIcon(Icons.close), findsOneWidget);
    });

    testWidgets('tapping WhatsApp Normal returns WhatsAppType.normal',
        (tester) async {
      WhatsAppType? selected;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () async {
                  selected = await showWhatsAppSelectorDialog(context);
                },
                child: const Text('Open'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      await tester.tap(find.text(AppStrings.optionWhatsAppNormal));
      await tester.pumpAndSettle();

      expect(selected, equals(WhatsAppType.normal));
    });

    testWidgets('tapping WhatsApp Business returns WhatsAppType.business',
        (tester) async {
      WhatsAppType? selected;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () async {
                  selected = await showWhatsAppSelectorDialog(context);
                },
                child: const Text('Open'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      await tester.tap(find.text(AppStrings.optionWhatsAppBusiness));
      await tester.pumpAndSettle();

      expect(selected, equals(WhatsAppType.business));
    });

    testWidgets('tapping Cancel returns null', (tester) async {
      WhatsAppType? selected;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () async {
                  selected = await showWhatsAppSelectorDialog(context);
                },
                child: const Text('Open'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      await tester.tap(find.text(AppStrings.btnCancel));
      await tester.pumpAndSettle();

      expect(selected, isNull);
    });
  });
}
