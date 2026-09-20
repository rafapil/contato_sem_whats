import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static final txtButtomWhite = TextStyle(
    fontFamily: 'NotoSans',
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );

  static final txtTitleWhite = TextStyle(
    fontFamily: 'NotoSans',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static final txtAlertTitle = TextStyle(
    fontFamily: 'NotoSans',
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );

  static final txtTextForm = TextStyle(
    fontFamily: 'NotoSans',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  static final txtTextAlertHint = TextStyle(
    fontFamily: 'NotoSans',
    fontSize: 14,
    color: AppColors.black,
  );

  static final txtTextFormHint = TextStyle(
    fontFamily: 'NotoSans',
    fontSize: 12,
    color: AppColors.black,
  );

  static final txtTextLink = TextStyle(
    fontFamily: 'NotoSans',
    fontSize: 12,
    color: AppColors.primary,
  );
}
