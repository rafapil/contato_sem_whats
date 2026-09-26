import 'package:flutter_test/flutter_test.dart';
import 'package:zap_sem_contato/shared/models/saved_link_model.dart';

SavedLinkModel _buildLink({
  String id = 'id-1',
  String name = 'Contato',
  String ddi = '+55',
  String phone = '11999998888',
  String? message,
  String link = 'https://wa.me/5511999998888',
  DateTime? createdAt,
}) {
  return SavedLinkModel(
    id: id,
    name: name,
    ddi: ddi,
    phone: phone,
    message: message,
    link: link,
    createdAt: createdAt ?? DateTime(2026, 1, 1),
  );
}

void main() {
  group('SavedLinkModel - getters', () {
    test('fullPhone concatena DDI + telefone', () {
      final link = _buildLink(ddi: '+55', phone: '11988887777');
      expect(link.fullPhone, '+5511988887777');
    });

    test('maskedPhone expõe apenas os 4 últimos dígitos', () {
      final link = _buildLink(phone: '11999998888');
      expect(link.maskedPhone, '****8888');
    });

    test('maskedPhone retorna o próprio telefone quando curto', () {
      final link = _buildLink(phone: '1234');
      expect(link.maskedPhone, '1234');
    });

    test('maskedPhone retorna o próprio telefone quando menor que 4 chars', () {
      final link = _buildLink(phone: '123');
      expect(link.maskedPhone, '123');
    });

    test('messagePreview retorna vazio quando message é null', () {
      final link = _buildLink(message: null);
      expect(link.messagePreview, isEmpty);
    });

    test('messagePreview retorna vazio quando message é vazio', () {
      final link = _buildLink(message: '');
      expect(link.messagePreview, isEmpty);
    });

    test('messagePreview retorna message quando curto (<=30 chars)', () {
      final link = _buildLink(message: 'Olá mundo');
      expect(link.messagePreview, 'Olá mundo');
    });

    test('messagePreview trunca com reticências quando >30 chars', () {
      final longMessage = 'A' * 50;
      final link = _buildLink(message: longMessage);
      expect(link.messagePreview.length, 33); // 30 chars + '...'
      expect(link.messagePreview.endsWith('...'), isTrue);
      expect(link.messagePreview.startsWith('A' * 30), isTrue);
    });

    test('messagePreview lida exatamente com 30 chars sem truncar', () {
      final exactMessage = 'B' * 30;
      final link = _buildLink(message: exactMessage);
      expect(link.messagePreview, exactMessage);
      expect(link.messagePreview.endsWith('...'), isFalse);
    });
  });

  group('SavedLinkModel - construção', () {
    test('construtor aceita message nulo', () {
      final link = SavedLinkModel(
        id: '1',
        name: 'n',
        ddi: '+55',
        phone: '11999998888',
        message: null,
        link: 'https://wa.me/5511999998888',
        createdAt: DateTime(2026, 1, 1),
      );
      expect(link.message, isNull);
    });

    test('todos os campos são preservados', () {
      final now = DateTime(2026, 5, 20, 10, 30);
      final link = SavedLinkModel(
        id: 'abc',
        name: 'Maria',
        ddi: '+351',
        phone: '912345678',
        message: 'Olá',
        link: 'https://wa.me/351912345678',
        createdAt: now,
      );

      expect(link.id, 'abc');
      expect(link.name, 'Maria');
      expect(link.ddi, '+351');
      expect(link.phone, '912345678');
      expect(link.message, 'Olá');
      expect(link.link, 'https://wa.me/351912345678');
      expect(link.createdAt, now);
    });
  });
}
