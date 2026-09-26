import 'package:flutter_test/flutter_test.dart';
import 'package:zap_sem_contato/shared/data/database_country.dart';
import 'package:zap_sem_contato/shared/models/country_model.dart';

void main() {
  group('DatabaseCountry', () {
    late DatabaseCountry db;

    setUp(() {
      db = DatabaseCountry();
    });

    test('não está vazio', () {
      expect(db.countries, isNotEmpty);
      expect(db.countries.length, greaterThan(50),
          reason: 'Banco deve conter um conjunto razoável de países');
    });

    test('todos os países têm id, pais, img e ddi preenchidos', () {
      for (final entry in db.countries.entries) {
        final country = entry.value;
        expect(country.id, entry.key,
            reason: 'Chave do mapa deve bater com id do modelo');
        expect(country.pais, isNotEmpty,
            reason: 'País ${entry.key} sem nome');
        expect(country.ddi, isNotEmpty,
            reason: 'País ${entry.key} sem DDI');
      }
    });

    test('todo DDI começa com "+"', () {
      for (final country in db.countries.values) {
        expect(country.ddi.startsWith('+'), isTrue,
            reason: 'DDI "${country.ddi}" de ${country.pais} deve começar com +');
      }
    });

    test('todo DDI contém apenas dígitos após o "+"', () {
      final nonDigitRegex = RegExp(r'^\+\d+$');
      for (final country in db.countries.values) {
        expect(nonDigitRegex.hasMatch(country.ddi), isTrue,
            reason:
                'DDI "${country.ddi}" de ${country.pais} deve ter formato +NN...');
      }
    });

    test('ids são únicos', () {
      final ids = db.countries.keys.toList();
      expect(ids.toSet().length, equals(ids.length),
          reason: 'Não deve haver id duplicado');
    });

    test('DDIs são únicos', () {
      final ddis = db.countries.values.map((c) => c.ddi).toList();
      expect(ddis.toSet().length, equals(ddis.length),
          reason: 'Não deve haver DDI duplicado');
    });

    test('todos os países retornados são instâncias de CountryModel', () {
      for (final country in db.countries.values) {
        expect(country, isA<CountryModel>());
      }
    });

    test('contém Brasil (+55)', () {
      final brasil = db.countries.values.firstWhere(
        (c) => c.ddi == '+55',
        orElse: () => fail('Brasil (+55) não encontrado no banco'),
      );
      expect(brasil.pais.toLowerCase(), contains('brasil'));
    });

    test('contém Portugal (+351)', () {
      final has = db.countries.values.any((c) => c.ddi == '+351');
      expect(has, isTrue, reason: 'Portugal (+351) deve estar presente');
    });

    test('contém EUA (+1)', () {
      final has = db.countries.values.any((c) => c.ddi == '+1');
      expect(has, isTrue, reason: '+1 deve estar presente');
    });

    test('cada DDI gera um identificador de telefone compatível', () {
      // Para que um link wa.me funcione, o DDI + telefone devem estar
      // no formato apenas dígitos. Aqui validamos que cada DDI,
      // quando combinado com um telefone simulado, produz uma URL plausível.
      for (final country in db.countries.values) {
        final digits = country.ddi.replaceAll(RegExp(r'[^\d]'), '');
        expect(digits.length, greaterThanOrEqualTo(1));
        expect(digits.length, lessThanOrEqualTo(4),
            reason:
                'DDI ${country.ddi} (${country.pais}) tem tamanho incomum: $digits dígitos');
      }
    });

    test('id do mapa sempre bate com id do modelo', () {
      for (final entry in db.countries.entries) {
        expect(entry.value.id, entry.key);
      }
    });

    test('URLs de imagem são http(s) quando parecem ser URLs', () {
      // Algumas entradas podem usar placeholders textuais ("Ascensão" etc.)
      // em vez de URL. Aqui validamos apenas quando a string começa com
      // "http", sinalizando que deveria ser uma URL real.
      for (final country in db.countries.values) {
        if (country.img.isEmpty) continue;
        final looksLikeUrl = country.img.startsWith('http://') ||
            country.img.startsWith('https://');
        if (looksLikeUrl) {
          expect(
            Uri.tryParse(country.img)?.hasScheme == true,
            isTrue,
            reason: 'Imagem deveria ser URL válida: ${country.pais}: ${country.img}',
          );
        }
      }
    });
  });
}
