import 'package:flutter_test/flutter_test.dart';
import 'package:zap_sem_contato/shared/models/country_model.dart';

void main() {
  group('CountryModel', () {
    final sampleCountry = CountryModel(
      id: 55,
      pais: 'Brasil',
      img: 'https://example.com/brasil.png',
      ddi: '+55',
    );

    test('toMap serializa todos os campos corretamente', () {
      final map = sampleCountry.toMap();
      expect(map['id'], 55);
      expect(map['country'], 'Brasil');
      expect(map['img'], 'https://example.com/brasil.png');
      expect(map['ddi'], '+55');
    });

    test('fromMap desserializa todos os campos corretamente', () {
      final map = {
        'id': 1,
        'country': 'EUA',
        'img': 'https://example.com/eua.png',
        'ddi': '+1',
      };
      final country = CountryModel.fromMap(map);

      expect(country.id, 1);
      expect(country.pais, 'EUA');
      expect(country.img, 'https://example.com/eua.png');
      expect(country.ddi, '+1');
    });

    test('fromMap aplica defaults seguros para campos nulos', () {
      final country = CountryModel.fromMap({});

      expect(country.id, 0);
      expect(country.pais, '');
      expect(country.img, '');
      expect(country.ddi, '');
    });

    test('toJson e fromJson são inversos', () {
      final json = sampleCountry.toJson();
      final restored = CountryModel.fromJson(json);

      expect(restored.id, sampleCountry.id);
      expect(restored.pais, sampleCountry.pais);
      expect(restored.img, sampleCountry.img);
      expect(restored.ddi, sampleCountry.ddi);
    });

    test('roundtrip preserva dados via toMap/fromMap', () {
      final restored = CountryModel.fromMap(sampleCountry.toMap());
      expect(restored.id, sampleCountry.id);
      expect(restored.pais, sampleCountry.pais);
      expect(restored.img, sampleCountry.img);
      expect(restored.ddi, sampleCountry.ddi);
    });

    test('equals/hashCode implícitos (referência) funcionam', () {
      final a = CountryModel(id: 1, pais: 'X', img: 'i', ddi: '+1');
      final b = CountryModel(id: 1, pais: 'X', img: 'i', ddi: '+1');

      expect(a, isNot(equals(b)),
          reason: 'CountryModel não sobrescreve == (igualdade por referência)');
    });
  });
}
