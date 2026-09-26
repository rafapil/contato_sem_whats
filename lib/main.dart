import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app_widget.dart';
import 'shared/models/saved_link_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(SavedLinkModelAdapter());
  await Hive.openBox<SavedLinkModel>('saved_links');

  runApp(const AppWidget());
}