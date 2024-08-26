import 'package:flutter/material.dart';
import 'package:zap_sem_contato/shared/themes/app_colors.dart';

class AppButtom extends StatelessWidget {
  final double width;
  final String textoButtom;
  final TextStyle buttomStyle;
  final Color color;
  final VoidCallback function;

  const AppButtom(
      {Key? key,
      required this.width,
      required this.textoButtom,
      required this.buttomStyle,
      required this.color,
      required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 0.8, color: AppColors.white),
        color: color,
        borderRadius: BorderRadius.circular(5.0),
      ),
      height: 52.0,
      width: width,
      child: TextButton(
        // ignore: prefer_const_constructors
        onPressed: function,
        // ignore: prefer_const_constructors
        child: Text(textoButtom, style: buttomStyle),
      ),
    );
  }
}
