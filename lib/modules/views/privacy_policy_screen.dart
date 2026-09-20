import 'package:flutter/material.dart';
import 'package:zap_sem_contato/shared/themes/app_colors.dart';
import 'package:zap_sem_contato/shared/themes/app_textstyles.dart';
import 'package:zap_sem_contato/shared/widgets/app_strings.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.black,
        title: Text(
          AppStrings.titlePrivacyPolicy,
          style: AppTextStyles.txtTitleWhite,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            AppStrings.privacyPolicyContent,
            style: AppTextStyles.txtTextForm,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
