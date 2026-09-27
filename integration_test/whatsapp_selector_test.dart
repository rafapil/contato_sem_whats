import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:integration_test/integration_test.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:zap_sem_contato/modules/providers/links_provider.dart';
import 'package:zap_sem_contato/modules/views/send_message_screen.dart';
import 'package:zap_sem_contato/shared/models/saved_link_model.dart';
import 'package:zap_sem_contato/shared/themes/app_strings.dart';

/// Wrapper da tela com Provider necessário para os testes.
Widget _wrapForIntegrationTest(Widget child) {
  return ChangeNotifierProvider<LinksProvider>(
    create: (_) => LinksProvider(),
    child: MaterialApp(home: child),
  );
}

Future<void> _initHive() async {
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(SavedLinkModelAdapter());
  }
  if (!Hive.isBoxOpen('saved_links')) {
    await Hive.openBox<SavedLinkModel>('saved_links');
  }
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await _initHive();
  });

  tearDownAll(() async {
    await Hive.close();
  });

  group('WhatsApp Selector Integration', () {
    testWidgets(
      'full flow: generate link -> open selector -> choose Normal',
      (tester) async {
        await tester.pumpWidget(
          _wrapForIntegrationTest(const SendMessageScreen()),
        );
        await tester.pumpAndSettle();

        // Enter valid phone number
        final phoneField = find.byWidgetPredicate(
          (w) => w is TextField && w.decoration?.hintText == '(XX) XXXXX-XXXX',
        );
        expect(phoneField, findsOneWidget);
        await tester.enterText(phoneField, '11999998888');
        await tester.pumpAndSettle();

        // Tap "Criar Link"
        await tester.tap(find.text('Criar Link'));
        await tester.pumpAndSettle();

        // Verify link is generated
        final generatedLinkFinder = find.byWidgetPredicate(
          (w) =>
              w is TextField &&
              (w.controller?.text.startsWith('https://wa.me/') ?? false),
        );
        expect(generatedLinkFinder, findsOneWidget);

        // Tap "Abrir WhatsApp"
        await tester.tap(find.text('Abrir WhatsApp'));
        await tester.pumpAndSettle();

        // Verify selector dialog appears (bottom sheet)
        expect(find.text(AppStrings.dialogSelecionarWhatsApp), findsOneWidget);
        expect(find.text(AppStrings.optionWhatsAppNormal), findsOneWidget);
        expect(find.text(AppStrings.optionWhatsAppBusiness), findsOneWidget);
        expect(find.text(AppStrings.btnCancel), findsOneWidget);

        // Select "WhatsApp Normal"
        await tester.tap(find.text(AppStrings.optionWhatsAppNormal));
        await tester.pumpAndSettle();

        // Bottom sheet should be closed after selection
        expect(
          find.text(AppStrings.dialogSelecionarWhatsApp),
          findsNothing,
        );
      },
    );

    testWidgets(
      'full flow: generate link -> open selector -> choose Business',
      (tester) async {
        await tester.pumpWidget(
          _wrapForIntegrationTest(const SendMessageScreen()),
        );
        await tester.pumpAndSettle();

        // Enter valid phone number
        final phoneField = find.byWidgetPredicate(
          (w) => w is TextField && w.decoration?.hintText == '(XX) XXXXX-XXXX',
        );
        await tester.enterText(phoneField, '21988887777');
        await tester.pumpAndSettle();

        // Add a message
        final messageField = find.byWidgetPredicate(
          (w) =>
              w is TextField &&
              w.decoration?.labelText == 'Mensagem (opcional)',
        );
        await tester.enterText(messageField, 'Olá, tudo bem?');
        await tester.pumpAndSettle();

        // Tap "Criar Link"
        await tester.tap(find.text('Criar Link'));
        await tester.pumpAndSettle();

        // Verify link is generated with message
        final generatedLinkFinder = find.byWidgetPredicate(
          (w) =>
              w is TextField &&
              (w.controller?.text.startsWith('https://wa.me/') ?? false),
        );
        expect(generatedLinkFinder, findsOneWidget);

        // Tap "Abrir WhatsApp"
        await tester.tap(find.text('Abrir WhatsApp'));
        await tester.pumpAndSettle();

        // Verify selector dialog appears
        expect(find.text(AppStrings.dialogSelecionarWhatsApp), findsOneWidget);

        // Select "WhatsApp Business"
        await tester.tap(find.text(AppStrings.optionWhatsAppBusiness));
        await tester.pumpAndSettle();

        // Bottom sheet should be closed
        expect(
          find.text(AppStrings.dialogSelecionarWhatsApp),
          findsNothing,
        );
      },
    );

    testWidgets(
      'open selector -> cancel -> bottom sheet closes without action',
      (tester) async {
        await tester.pumpWidget(
          _wrapForIntegrationTest(const SendMessageScreen()),
        );
        await tester.pumpAndSettle();

        // Enter valid phone number first (required for the button to not just show snackbar)
        final phoneField = find.byWidgetPredicate(
          (w) => w is TextField && w.decoration?.hintText == '(XX) XXXXX-XXXX',
        );
        await tester.enterText(phoneField, '31977776666');
        await tester.pumpAndSettle();

        // Tap "Abrir WhatsApp"
        await tester.tap(find.text('Abrir WhatsApp'));
        await tester.pumpAndSettle();

        // Verify selector dialog appears
        expect(find.text(AppStrings.dialogSelecionarWhatsApp), findsOneWidget);

        // Tap "Cancelar"
        await tester.tap(find.text(AppStrings.btnCancel));
        await tester.pumpAndSettle();

        // Verify bottom sheet is closed (no action was taken)
        expect(
          find.text(AppStrings.dialogSelecionarWhatsApp),
          findsNothing,
        );
        // And the "Abrir WhatsApp" button is still visible and enabled
        expect(find.text('Abrir WhatsApp'), findsOneWidget);
      },
    );

    testWidgets(
      'open selector without generated link still works (opens with current phone)',
      (tester) async {
        await tester.pumpWidget(
          _wrapForIntegrationTest(const SendMessageScreen()),
        );
        await tester.pumpAndSettle();

        // Enter phone number but do NOT generate link
        final phoneField = find.byWidgetPredicate(
          (w) => w is TextField && w.decoration?.hintText == '(XX) XXXXX-XXXX',
        );
        await tester.enterText(phoneField, '41988887777');
        await tester.pumpAndSettle();

        // Tap "Abrir WhatsApp" without generating a link first
        await tester.tap(find.text('Abrir WhatsApp'));
        await tester.pumpAndSettle();

        // Selector should still appear (phone is valid)
        expect(find.text(AppStrings.dialogSelecionarWhatsApp), findsOneWidget);

        // Cancel
        await tester.tap(find.text(AppStrings.btnCancel));
        await tester.pumpAndSettle();

        expect(
          find.text(AppStrings.dialogSelecionarWhatsApp),
          findsNothing,
        );
      },
    );

    testWidgets(
      'open selector without valid phone shows snackbar and no dialog',
      (tester) async {
        await tester.pumpWidget(
          _wrapForIntegrationTest(const SendMessageScreen()),
        );
        await tester.pumpAndSettle();

        // Tap "Abrir WhatsApp" without entering phone
        await tester.tap(find.text('Abrir WhatsApp'));
        await tester.pumpAndSettle();

        // Validation snackbar should appear
        expect(find.text(AppStrings.msgTelefoneObrigatorio), findsOneWidget);

        // Dialog should NOT appear
        expect(
          find.text(AppStrings.dialogSelecionarWhatsApp),
          findsNothing,
        );
      },
    );

    testWidgets(
      'saved link row: open selector from list -> choose Normal',
      (tester) async {
        // Pre-populate with a saved link via LinksProvider
        final linksProvider = LinksProvider();
        await linksProvider.saveLink(
          name: 'Test Contact',
          ddi: '+55',
          phone: '11999998888',
          message: 'Test message',
          link: 'https://wa.me/5511999998888?text=Test%20message',
        );

        await tester.pumpWidget(
          ChangeNotifierProvider<LinksProvider>.value(
            value: linksProvider,
            child: MaterialApp(home: const SendMessageScreen()),
          ),
        );
        await tester.pumpAndSettle();

        // Verify saved link appears in the list
        expect(find.text('Test Contact'), findsOneWidget);

        // Find and tap the open icon on the saved link row
        final openIcon = find.byIcon(Icons.open_in_new);
        expect(openIcon, findsOneWidget);
        await tester.tap(openIcon);
        await tester.pumpAndSettle();

        // Verify selector dialog appears
        expect(find.text(AppStrings.dialogSelecionarWhatsApp), findsOneWidget);

        // Choose Normal
        await tester.tap(find.text(AppStrings.optionWhatsAppNormal));
        await tester.pumpAndSettle();

        // Dialog should be closed
        expect(
          find.text(AppStrings.dialogSelecionarWhatsApp),
          findsNothing,
        );
      },
    );
  });
}
