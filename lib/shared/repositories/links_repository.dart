import 'package:hive/hive.dart';
import '../models/saved_link_model.dart';

class LinksRepository {
  static const String _boxName = 'saved_links';

  Box<SavedLinkModel> get _box => Hive.box<SavedLinkModel>(_boxName);

  List<SavedLinkModel> getAllLinks() {
    return _box.values.toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  Future<void> saveLink(SavedLinkModel link) async {
    await _box.put(link.id, link);
  }

  Future<void> deleteLink(String id) async {
    await _box.delete(id);
  }

  Future<void> clearAllLinks() async {
    await _box.clear();
  }

  SavedLinkModel? getLinkById(String id) {
    return _box.get(id);
  }
}
