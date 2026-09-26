import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:integration_test/integration_test.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:zap_sem_contato/modules/controllers/link_generator_controller.dart';
import 'package:zap_sem_contato/modules/providers/links_provider.dart';
import 'package:zap_sem_contato/modules/views/send_message_screen.dart';
import 'package:zap_sem_contato/shared/data/database_country.dart';
import 'package:zap_sem_contato/shared/models/saved_link_model.dart';

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

/// Recupera a referência do DropdownButton interno do DropdownButtonFormField.
DropdownButton<String> _findInnerDropdown(WidgetTester tester) {
  return tester.widget<DropdownButton<String>>(
    find.descendant(
      of: find.byType(DropdownButtonFormField<String>),
      matching: find.byType(DropdownButton<String>),
    ),
  );
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await _initHive();
  });

  tearDownAll(() async {
    await Hive.close();
  });

  group('End-to-end WhatsApp link generation flow', () {
    testWidgets(
      'Screen renders with DDI dropdown sourced from DatabaseCountry',
      (tester) async {
        await tester.pumpWidget(_wrapForIntegrationTest(const SendMessageScreen()));
        await tester.pumpAndSettle();

        final dropdown = _findInnerDropdown(tester);
        expect(dropdown.value, equals('+55'));
        expect(dropdown.items, isNotNull);

        final dbDdis = DatabaseCountry()
            .countries
            .values
            .map((c) => c.ddi)
            .toSet();

        for (final item in dropdown.items!) {
          expect(item.value, isIn(dbDdis));
          final textWidget = item.child as Text;
          expect(textWidget.data, equals(item.value));
        }
      },
    );

    testWidgets(
      'Generating a link for +55 + valid phone produces wa.me URL',
      (tester) async {
        await tester.pumpWidget(_wrapForIntegrationTest(const SendMessageScreen()));
        await tester.pumpAndSettle();

        // Encontra o campo telefone pelo hintText
        final phoneField = find.byWidgetPredicate(
          (w) => w is TextField && w.decoration?.hintText == '(XX) XXXXX-XXXX',
        );
        expect(phoneField, findsOneWidget);

        await tester.enterText(phoneField, '11999998888');
        await tester.pumpAndSettle();

        // Clica no botão "Criar Link"
        await tester.tap(find.text('Criar Link'));
        await tester.pumpAndSettle();

        // O link gerado aparece em um TextField desabilitado abaixo do botão
        final generatedLinkFinder = find.byWidgetPredicate(
          (w) =>
              w is TextField &&
              (w.controller?.text.startsWith('https://wa.me/') ?? false),
        );
        expect(generatedLinkFinder, findsOneWidget,
            reason: 'TextField com o link gerado deve aparecer');

        final generatedWidget =
            tester.widget<TextField>(generatedLinkFinder);
        final generatedLink = generatedWidget.controller!.text;
        expect(generatedLink, isNotEmpty);
        expect(generatedLink, startsWith('https://wa.me/'));
        expect(generatedLink, contains('5511999998888'));
      },
    );

    testWidgets(
      'Generated link with message includes text parameter',
      (tester) async {
        await tester.pumpWidget(_wrapForIntegrationTest(const SendMessageScreen()));
        await tester.pumpAndSettle();

        // Encontra o campo telefone pelo hintText
        final phoneField = find.byWidgetPredicate(
          (w) => w is TextField && w.decoration?.hintText == '(XX) XXXXX-XXXX',
        );
        expect(phoneField, findsOneWidget);

        // Encontra o campo mensagem
        final messageField = find.byWidgetPredicate(
          (w) =>
              w is TextField &&
              w.decoration?.labelText == 'Mensagem (opcional)',
        );
        expect(messageField, findsOneWidget);

        await tester.enterText(phoneField, '11988887777');
        await tester.enterText(messageField, 'Olá mundo');
        await tester.pumpAndSettle();

        await tester.tap(find.text('Criar Link'));
        await tester.pumpAndSettle();

        final generatedLinkFinder = find.byWidgetPredicate(
          (w) =>
              w is TextField &&
              (w.controller?.text.startsWith('https://wa.me/') ?? false),
        );
        expect(generatedLinkFinder, findsOneWidget);

        final generatedWidget =
            tester.widget<TextField>(generatedLinkFinder);
        final link = generatedWidget.controller!.text;
        expect(link, contains('5511988887777'));
        expect(link.toLowerCase(), contains('text='));
      },
    );

    testWidgets(
      'Empty phone triggers validation snackbar',
      (tester) async {
        await tester.pumpWidget(_wrapForIntegrationTest(const SendMessageScreen()));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Criar Link'));
        await tester.pumpAndSettle();

        // Verifica que aparece a snackbar de telefone obrigatório
        expect(find.text('Telefone é obrigatório'), findsOneWidget);
      },
    );

    testWidgets(
      'Every DDI from database generates a valid wa.me link (full mapping)',
      (tester) async {
        final controller = LinkGeneratorController();

        final countries = DatabaseCountry().countries.values;
        expect(countries, isNotEmpty);

        for (final country in countries) {
          final link = controller.generateLink(
            ddi: country.ddi,
            phone: '999999999',
            message: 'Teste',
          );

          expect(link, isNotEmpty,
              reason: 'Link vazio para ${country.pais} (${country.ddi})');
          expect(link, startsWith('https://wa.me/'),
              reason:
                  'Link para ${country.pais} deve iniciar com https://wa.me/: $link');

          final digits = country.ddi.replaceAll(RegExp(r'[^\d]'), '');
          expect(link, contains(digits),
              reason:
                  'Link para ${country.pais} deve conter DDI $digits: $link');
          expect(link.toLowerCase(), contains('text=teste'));
        }
      },
    );
  });
}
