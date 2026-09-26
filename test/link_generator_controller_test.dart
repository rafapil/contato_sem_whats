import 'package:flutter_test/flutter_test.dart';
import 'package:zap_sem_contato/modules/controllers/link_generator_controller.dart';
import 'package:zap_sem_contato/shared/data/database_country.dart';

void main() {
  group('LinkGeneratorController', () {
    late LinkGeneratorController controller;

    setUp(() {
      controller = LinkGeneratorController();
    });

    test('generateLink returns empty string for empty phone', () {
      final link = controller.generateLink(ddi: '+55', phone: '');
      expect(link, isEmpty);
    });

    test('generateLink returns empty string for too-short phone', () {
      final link = controller.generateLink(ddi: '+55', phone: '123');
      expect(link, isEmpty);
    });

    test('generateLink produces wa.me link with DDI + phone for Brazil', () {
      final link = controller.generateLink(
        ddi: '+55',
        phone: '11999998888',
      );
      expect(link, isNotEmpty);
      expect(link, startsWith('https://wa.me/'));
      expect(link, contains('5511999998888'));
    });

    test('generateLink strips non-digits from phone', () {
      final link = controller.generateLink(
        ddi: '+55',
        phone: '(11) 99999-8888',
      );
      expect(link, contains('5511999998888'));
    });

    test('generateLink appends message text when provided', () {
      final link = controller.generateLink(
        ddi: '+55',
        phone: '11999998888',
        message: 'Olá, tudo bem?',
      );
      expect(link, contains('https://wa.me/5511999998888'));
      expect(link.toLowerCase(), contains('text='));
    });

    test('validatePhone accepts valid Brazilian mobile', () {
      expect(controller.validatePhone('11999998888'), isTrue);
    });

    test('validatePhone accepts formatted Brazilian mobile', () {
      expect(controller.validatePhone('(11) 99999-8888'), isTrue);
    });

    test('validatePhone rejects empty phone', () {
      expect(controller.validatePhone(''), isFalse);
    });

    test('validatePhone rejects too-short phone', () {
      expect(controller.validatePhone('12345'), isFalse);
    });

    test('validatePhone rejects too-long phone', () {
      expect(controller.validatePhone('12345678901234567'), isFalse);
    });

    group('Integration with DatabaseCountry', () {
      test('Every DDI from database generates a valid wa.me link', () {
        final countries = DatabaseCountry().countries.values;
        expect(countries, isNotEmpty,
            reason: 'DatabaseCountry deve conter ao menos um país');

        for (final country in countries) {
          final link = controller.generateLink(
            ddi: country.ddi,
            phone: '999999999',
          );

          expect(link, isNotEmpty,
              reason: 'Link vazio para DDI ${country.ddi} (${country.pais})');
          expect(link, startsWith('https://wa.me/'),
              reason: 'Link inválido para ${country.pais}: $link');

          final digits = country.ddi.replaceAll(RegExp(r'[^\d]'), '');
          expect(link, contains(digits),
              reason:
                  'Link para ${country.pais} deveria conter DDI $digits: $link');
        }
      });

      test('All DDIs from database are unique', () {
        final ddis = DatabaseCountry()
            .countries
            .values
            .map((c) => c.ddi)
            .toList();
        final uniqueDdis = ddis.toSet();
        expect(uniqueDdis.length, equals(ddis.length),
            reason: 'Não deve haver DDI duplicado no DatabaseCountry');
      });

      test('Default DDI +55 (Brasil) exists in the database', () {
        final hasBrazil =
            DatabaseCountry().countries.values.any((c) => c.ddi == '+55');
        expect(hasBrazil, isTrue,
            reason: 'Banco de dados deve conter Brasil (+55)');
      });

      test('WhatsApp-compatible link sample for various DDIs', () {
        // Amostra representativa de diferentes continentes
        final samples = ['+55', '+1', '+44', '+49', '+351', '+86', '+81'];

        for (final ddi in samples) {
          final link = controller.generateLink(
            ddi: ddi,
            phone: '987654321',
            message: 'Hi',
          );
          expect(link, startsWith('https://wa.me/'));
          expect(link, contains('Hi'));
          final digits = ddi.replaceAll(RegExp(r'[^\d]'), '');
          expect(link, contains(digits));
        }
      });
    });

    group('Edge cases', () {
      test('generateLink aceita telefone com 7 dígitos (mínimo)', () {
        final link = controller.generateLink(ddi: '+55', phone: '1234567');
        expect(link, isNotEmpty);
        expect(link, contains('551234567'));
      });

      test('generateLink aceita telefone com 15 dígitos (máximo E.164)', () {
        final phone = '1' * 15;
        final link = controller.generateLink(ddi: '+55', phone: phone);
        expect(link, isNotEmpty);
        expect(link, contains('55$phone'));
      });

      test('generateLink URL-encode espaços na mensagem', () {
        final link = controller.generateLink(
          ddi: '+55',
          phone: '11999998888',
          message: 'Olá mundo',
        );
        expect(link, contains('https://wa.me/5511999998888'));
        expect(link, contains('text='));
        // URL-encode de espaço pode ser '+' (form data) ou '%20'
        expect(link.contains('+') || link.contains('%20'), isTrue,
            reason: 'Espaço deve ser encodado como + ou %20');
      });

      test('generateLink sem mensagem não inclui text=', () {
        final link = controller.generateLink(
          ddi: '+55',
          phone: '11999998888',
        );
        expect(link, isNot(contains('text=')),
            reason: 'Sem mensagem, não deve haver parâmetro text=');
      });

      test('generateLink ignora caracteres não-dígitos do telefone', () {
        final link = controller.generateLink(
          ddi: '+55',
          phone: '+55 (11) 99999-8888',
        );
        expect(link, contains('5511999998888'));
        expect(link, isNot(contains(' ')));
        expect(link, isNot(contains('(')));
        expect(link, isNot(contains(')')));
        expect(link, isNot(contains('-')));
      });

      test('validatePhone aceita telefone com 7 dígitos', () {
        expect(controller.validatePhone('1234567'), isTrue);
      });

      test('validatePhone aceita telefone com 15 dígitos', () {
        expect(controller.validatePhone('123456789012345'), isTrue);
      });

      test('validatePhone rejeita telefone com 16+ dígitos', () {
        expect(controller.validatePhone('1234567890123456'), isFalse);
      });

      test('validatePhone rejeita telefone só com espaços/símbolos', () {
        expect(controller.validatePhone('   ---   '), isFalse);
      });

      test('generatedLink getter é null antes de gerar', () {
        expect(controller.generatedLink, isNull);
      });

      test('generatedLink getter retorna o último link gerado', () {
        controller.generateLink(ddi: '+55', phone: '11999998888');
        expect(controller.generatedLink, isNotNull);
        expect(controller.generatedLink, startsWith('https://wa.me/'));
      });

      test('generatedLink é resetado para null após falha de validação', () {
        controller.generateLink(ddi: '+55', phone: '11999998888');
        expect(controller.generatedLink, isNotNull);

        controller.generateLink(ddi: '+55', phone: '');
        expect(controller.generatedLink, isNull,
            reason: 'Telefone vazio deve resetar o link');
      });

      test('generateLink encoda caracteres especiais perigosos', () {
        final link = controller.generateLink(
          ddi: '+55',
          phone: '11999998888',
          message: '& = ? #',
        );
        // Caracteres que precisam ser encodados em URL
        expect(link, isNot(contains(' &')),
            reason: '& deve ser encodado');
        expect(link, isNot(contains(' =')),
            reason: '= deve ser encodado');
        expect(link, isNot(contains(' ?')),
            reason: '? deve ser encodado');
        expect(link, isNot(contains(' #')),
            reason: '# deve ser encodado');
      });
    });
  });
}
