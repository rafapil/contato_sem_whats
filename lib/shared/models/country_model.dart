import 'dart:convert';

class CountryModel {
  final int id;
  final String pais;
  final String img;
  final String ddi;

  CountryModel(
      {required this.id,
      required this.pais,
      required this.img,
      required this.ddi});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'country': pais,
      'img': img,
      'ddi': ddi,
    };
  }

  factory CountryModel.fromMap(Map<String, dynamic> map) {
    return CountryModel(
      id: map['id']?.toInt() ?? 0,
      pais: map['country'] ?? '',
      img: map['img'] ?? '',
      ddi: map['ddi'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CountryModel.fromJson(String source) =>
      CountryModel.fromMap(json.decode(source));
}
