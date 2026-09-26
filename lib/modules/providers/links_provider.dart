import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';
import '../../shared/models/saved_link_model.dart';
import '../../shared/repositories/links_repository.dart';

class LinksProvider extends ChangeNotifier {
  final LinksRepository _repository = LinksRepository();
  final Uuid _uuid = const Uuid();

  List<SavedLinkModel> _links = [];
  List<SavedLinkModel> get links => _links;

  LinksProvider() {
    loadLinks();
  }

  void loadLinks() {
    _links = _repository.getAllLinks();
    notifyListeners();
  }

  Future<void> saveLink({
    required String name,
    required String ddi,
    required String phone,
    String? message,
    required String link,
  }) async {
    final savedLink = SavedLinkModel(
      id: _uuid.v4(),
      name: name,
      ddi: ddi,
      phone: phone,
      message: message,
      link: link,
      createdAt: DateTime.now(),
    );
    await _repository.saveLink(savedLink);
    loadLinks();
  }

  Future<void> deleteLink(String id) async {
    await _repository.deleteLink(id);
    loadLinks();
  }

  Future<void> clearAllLinks() async {
    await _repository.clearAllLinks();
    loadLinks();
  }

  bool get hasLinks => _links.isNotEmpty;
  int get linksCount => _links.length;
}
