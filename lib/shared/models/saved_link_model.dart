import 'package:hive/hive.dart';

part 'saved_link_model.g.dart';

@HiveType(typeId: 0)
class SavedLinkModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String ddi;

  @HiveField(3)
  final String phone;

  @HiveField(4)
  final String? message;

  @HiveField(5)
  final String link;

  @HiveField(6)
  final DateTime createdAt;

  SavedLinkModel({
    required this.id,
    required this.name,
    required this.ddi,
    required this.phone,
    this.message,
    required this.link,
    required this.createdAt,
  });

  String get fullPhone => '$ddi$phone';

  String get maskedPhone {
    if (phone.length <= 4) return phone;
    final visible = phone.substring(phone.length - 4);
    return '****$visible';
  }

  String get messagePreview {
    if (message == null || message!.isEmpty) return '';
    if (message!.length <= 30) return message!;
    return '${message!.substring(0, 30)}...';
  }
}
