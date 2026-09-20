import 'package:flutter/material.dart';
import 'package:zap_sem_contato/modules/views/send_message_screen.dart';
import 'modules/splash/splash_screen.dart';
import 'modules/views/about_screen.dart';
import 'modules/views/privacy_policy_screen.dart';
import 'shared/themes/app_colors.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: AppColors.background,
        primaryColor: AppColors.primary,
        navigationBarTheme: const NavigationBarThemeData(
          backgroundColor: AppColors.white,
          indicatorColor: AppColors.primary,
        ),
        appBarTheme: const AppBarTheme(
          // Definir a cor padrão dos icones de navegaçao da appBar
          iconTheme: IconThemeData(
            color: AppColors.white,
          ),
          // Padronizar o tamanho do texto da appBar
          titleTextStyle: TextStyle(
            color: AppColors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          // Define que o campo deve ser preenchido com uma cor
          filled: true,
          // Define a cor de fundo padrão como branco
          fillColor: AppColors.white,

          // Borda padrão (quando não está focado)
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(color: AppColors.grey, width: 1.0),
          ),

          // Borda QUANDO ESTÁ COM FOCO
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
                color: AppColors.primary,
                width: 1.5), // Cor preta e mais espessa
          ),

          // Define uma borda geral para outros estados (como o inicial)
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(color: AppColors.grey, width: 1.0),
          ),
        ),
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/message': (context) => const SendMessageScreen(),
        '/about': (context) => const AboutScreen(),
        '/privacy': (context) => const PrivacyPolicyScreen(),
      },
    );
  }
}
