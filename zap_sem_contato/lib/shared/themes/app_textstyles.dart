import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  static final txtButtomWhite = GoogleFonts.notoSans(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );

  static final txtTitleWhite = GoogleFonts.notoSans(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static final txtAlertTitle = GoogleFonts.notoSans(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );

  static final txtTextForm = GoogleFonts.notoSans(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  static final txtTextAlertHint = GoogleFonts.notoSans(
    fontSize: 14,
    color: AppColors.black,
  );

  static final txtTextFormHint = GoogleFonts.notoSans(
    fontSize: 12,
    color: AppColors.black,
  );

  static final txtTextLink = GoogleFonts.notoSans(
    fontSize: 12,
    color: AppColors.primary,
  );
}
