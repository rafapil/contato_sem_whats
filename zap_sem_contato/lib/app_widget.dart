import 'package:flutter/material.dart';
import 'package:zap_sem_contato/modules/views/send_message_screen.dart';
import 'modules/splash/splash_screen.dart';
import 'shared/themes/app_colors.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.orange, primaryColor: AppColors.primary),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/message': (context) => const SendMessageScreen(),
      },
    );
  }
}
