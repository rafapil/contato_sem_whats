import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:zap_sem_contato/shared/models/saved_link_model.dart';

/// Flag global para garantir que `Hive.init` é chamado uma única vez.
bool _hiveTestInitialized = false;

/// Inicializa o Hive para uso em testes.
///
/// IMPORTANTE: testes que usam este helper compartilham a mesma box `saved_links`.
/// Por isso, ao rodar todos os testes com `flutter test`, use `-j 1` para
/// evitar conflitos de lock quando múltiplos arquivos tentam abrir a mesma box
/// simultaneamente.
Future<void> initHiveForTest() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  if (!_hiveTestInitialized) {
    Hive.init('./test/.tmp_hive');
    _hiveTestInitialized = true;
  }
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(SavedLinkModelAdapter());
  }
  if (!Hive.isBoxOpen('saved_links')) {
    await Hive.openBox<SavedLinkModel>('saved_links');
  }
}
