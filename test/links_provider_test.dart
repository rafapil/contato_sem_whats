import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:zap_sem_contato/modules/providers/links_provider.dart';
import 'package:zap_sem_contato/shared/models/saved_link_model.dart';
import 'test_helpers.dart';

Future<void> _saveLink(
  LinksProvider provider, {
  required String name,
  required String ddi,
  required String phone,
  String? message,
  required String link,
}) {
  return provider.saveLink(
    name: name,
    ddi: ddi,
    phone: phone,
    message: message,
    link: link,
  );
}

void main() {
  setUpAll(() async {
    await initHiveForTest();
  });

  setUp(() async {
    // Limpa a box entre testes para isolamento
    await Hive.box<SavedLinkModel>('saved_links').clear();
  });

  group('LinksProvider', () {
    test('inicia vazio', () {
      final provider = LinksProvider();
      expect(provider.links, isEmpty);
      expect(provider.hasLinks, isFalse);
      expect(provider.linksCount, 0);
    });

    test('saveLink adiciona um link e notifica listeners', () async {
      final provider = LinksProvider();
      var notified = 0;
      provider.addListener(() => notified++);

      await _saveLink(
        provider,
        name: 'Maria',
        ddi: '+55',
        phone: '11999998888',
        message: 'Olá',
        link: 'https://wa.me/5511999998888',
      );

      expect(provider.links, hasLength(1));
      expect(provider.links.first.name, 'Maria');
      expect(provider.links.first.ddi, '+55');
      expect(provider.links.first.phone, '11999998888');
      expect(provider.links.first.message, 'Olá');
      expect(notified, greaterThan(0),
          reason: 'Listeners devem ser notificados após saveLink');
    });

    test('saveLink gera id único (UUID v4) para cada link', () async {
      final provider = LinksProvider();

      await _saveLink(
        provider,
        name: 'A',
        ddi: '+55',
        phone: '11111111111',
        link: 'https://wa.me/5511111111111',
      );
      await _saveLink(
        provider,
        name: 'B',
        ddi: '+55',
        phone: '22222222222',
        link: 'https://wa.me/5522222222222',
      );

      final ids = provider.links.map((l) => l.id).toList();
      expect(ids.toSet().length, equals(ids.length),
          reason: 'IDs devem ser únicos');
    });

    test('saveLink persiste o link na box do Hive', () async {
      final provider = LinksProvider();

      await _saveLink(
        provider,
        name: 'Persistente',
        ddi: '+55',
        phone: '11999998888',
        link: 'https://wa.me/5511999998888',
      );

      // Recria o provider para verificar persistência
      final newProvider = LinksProvider();
      expect(newProvider.links, hasLength(1));
      expect(newProvider.links.first.name, 'Persistente');
    });

    test('saveLink aceita message nulo', () async {
      final provider = LinksProvider();

      await _saveLink(
        provider,
        name: 'Sem msg',
        ddi: '+55',
        phone: '11999998888',
        message: null,
        link: 'https://wa.me/5511999998888',
      );

      expect(provider.links.first.message, isNull);
    });

    test('deleteLink remove um link existente', () async {
      final provider = LinksProvider();
      await _saveLink(
        provider,
        name: 'A',
        ddi: '+55',
        phone: '11111111111',
        link: 'https://wa.me/5511111111111',
      );
      final idToDelete = provider.links.first.id;

      await provider.deleteLink(idToDelete);

      expect(provider.links, isEmpty);
      expect(provider.hasLinks, isFalse);
    });

    test('deleteLink com id inexistente não quebra', () async {
      final provider = LinksProvider();
      await _saveLink(
        provider,
        name: 'A',
        ddi: '+55',
        phone: '11111111111',
        link: 'https://wa.me/5511111111111',
      );

      await provider.deleteLink('id-que-nao-existe');

      expect(provider.links, hasLength(1));
    });

    test('clearAllLinks remove todos os links', () async {
      final provider = LinksProvider();
      await _saveLink(
        provider,
        name: 'A',
        ddi: '+55',
        phone: '11111111111',
        link: 'https://wa.me/5511111111111',
      );
      await _saveLink(
        provider,
        name: 'B',
        ddi: '+55',
        phone: '22222222222',
        link: 'https://wa.me/5522222222222',
      );
      expect(provider.links, hasLength(2));

      await provider.clearAllLinks();

      expect(provider.links, isEmpty);
      expect(provider.hasLinks, isFalse);
      expect(provider.linksCount, 0);
    });

    test('hasLinks e linksCount refletem estado atual', () async {
      final provider = LinksProvider();
      expect(provider.hasLinks, isFalse);
      expect(provider.linksCount, 0);

      await _saveLink(
        provider,
        name: 'A',
        ddi: '+55',
        phone: '11111111111',
        link: 'https://wa.me/5511111111111',
      );
      expect(provider.hasLinks, isTrue);
      expect(provider.linksCount, 1);

      await _saveLink(
        provider,
        name: 'B',
        ddi: '+55',
        phone: '22222222222',
        link: 'https://wa.me/5522222222222',
      );
      expect(provider.linksCount, 2);
    });

    test('loadLinks recarrega dados da box', () async {
      // Popula diretamente a box, simulando dados preexistentes
      final box = Hive.box<SavedLinkModel>('saved_links');
      await box.put(
        'preset-id',
        SavedLinkModel(
          id: 'preset-id',
          name: 'Pré-existente',
          ddi: '+55',
          phone: '11999998888',
          link: 'https://wa.me/5511999998888',
          createdAt: DateTime(2020, 1, 1),
        ),
      );

      final provider = LinksProvider();
      provider.loadLinks();

      expect(provider.links, hasLength(1));
      expect(provider.links.first.name, 'Pré-existente');
    });
  });
}
