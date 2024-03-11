import 'package:flutter/material.dart';
import 'package:splash_view/splash_view.dart';
import 'package:zap_sem_contato/modules/views/send-message-screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashView(
        backgroundColor: Colors.red,
        loadingIndicator: const RefreshProgressIndicator(),
        logo: const FlutterLogo(),
        done: Done(SendMessageScreen()),
      ),
    );
    // );
  }
}
