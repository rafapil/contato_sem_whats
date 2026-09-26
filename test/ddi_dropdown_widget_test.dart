import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:zap_sem_contato/modules/providers/links_provider.dart';
import 'package:zap_sem_contato/modules/views/send_message_screen.dart';
import 'package:zap_sem_contato/shared/data/database_country.dart';
import 'test_helpers.dart';

Widget _wrapForTest(Widget child) {
  return ChangeNotifierProvider<LinksProvider>(
    create: (_) => LinksProvider(),
    child: MaterialApp(home: child),
  );
}

/// Encontra o DropdownButton interno dentro do DropdownButtonFormField.
DropdownButton<String> _findInnerDropdown(WidgetTester tester) {
  return tester.widget<DropdownButton<String>>(
    find.descendant(
      of: find.byType(DropdownButtonFormField<String>),
      matching: find.byType(DropdownButton<String>),
    ),
  );
}

void main() {
  setUpAll(() async {
    await initHiveForTest();
  });

  group('DDI Dropdown - DatabaseCountry Integration', () {
    testWidgets('Dropdown renders with only DDI text values from database',
        (tester) async {
      await tester.pumpWidget(_wrapForTest(const SendMessageScreen()));
      await tester.pumpAndSettle();

      // Localiza o DropdownButton interno
      final innerDropdown = _findInnerDropdown(tester);
      expect(innerDropdown.items, isNotNull);
      final items = innerDropdown.items!;

      // Recupera DDIs únicos do banco
      final dbDdis = DatabaseCountry()
          .countries
          .values
          .map((c) => c.ddi)
          .toSet();

      // Cada item do dropdown deve mostrar APENAS o DDI (sem nome de país)
      for (final item in items) {
        expect(item.value, isIn(dbDdis),
            reason: 'DDI ${item.value} deve existir no DatabaseCountry');

        final textWidget = item.child as Text;
        expect(textWidget.data, equals(item.value),
            reason:
                'O texto exibido deve ser apenas o DDI (${item.value}), sem país');
      }
    });

    testWidgets('Default selected DDI is +55 (Brasil) and exists in database',
        (tester) async {
      await tester.pumpWidget(_wrapForTest(const SendMessageScreen()));
      await tester.pumpAndSettle();

      final innerDropdown = _findInnerDropdown(tester);

      expect(innerDropdown.value, equals('+55'),
          reason: 'DDI padrão deve ser +55 (Brasil)');

      final hasBrazil =
          DatabaseCountry().countries.values.any((c) => c.ddi == '+55');
      expect(hasBrazil, isTrue,
          reason: '+55 deve existir no DatabaseCountry');
    });

    testWidgets('Dropdown items count matches unique DDIs in database',
        (tester) async {
      await tester.pumpWidget(_wrapForTest(const SendMessageScreen()));
      await tester.pumpAndSettle();

      final innerDropdown = _findInnerDropdown(tester);
      final items = innerDropdown.items!;

      final dbDdis = DatabaseCountry()
          .countries
          .values
          .map((c) => c.ddi)
          .toSet();

      expect(items.length, equals(dbDdis.length),
          reason:
              'Quantidade de itens no dropdown deve corresponder aos DDIs únicos do banco');
    });

    testWidgets('Visible selected item displays only DDI text', (tester) async {
      await tester.pumpWidget(_wrapForTest(const SendMessageScreen()));
      await tester.pumpAndSettle();

      // O texto "+55" deve aparecer visível como label do dropdown
      expect(find.text('+55'), findsWidgets,
          reason: 'DDI padrão +55 deve aparecer como texto visível');

      // Não deve haver texto "+55 Brasil" - o país não deve aparecer no label
      expect(find.text('+55 Brasil'), findsNothing,
          reason: 'Label do dropdown não deve conter nome do país');
    });
  });
}
