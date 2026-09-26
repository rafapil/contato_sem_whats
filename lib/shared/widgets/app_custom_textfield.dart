import 'package:flutter/material.dart';
import '../themes/app_textstyles.dart';

class AppCustomTextField extends StatelessWidget {
  final int? maxLength;
  final String title;
  final String? hint;
  final TextEditingController? textEditingController;
  final TextInputType type;
  final bool oculto;
  final bool enabled;
  final Function? validator;

  const AppCustomTextField(
      {super.key,
      this.title = '',
      this.hint,
      this.textEditingController,
      required this.type,
      this.oculto = false,
      this.validator,
      this.enabled = true,
      this.maxLength});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != ''
            ? Text(
                title,
                style: AppTextStyles.txtFormField,
              )
            : Container(),
        // SizedBox(height: 5),
        TextFormField(
          maxLength: maxLength,
          enabled: enabled,
          keyboardType: type,
          obscureText: oculto,
          decoration: InputDecoration(
            hintText: hint,
            border: const OutlineInputBorder(),
            hintStyle: AppTextStyles.txtFormHint,
          ),
          controller: textEditingController,
          validator: (validator) {
            if (validator == null || validator.isEmpty) {
              return 'Por favor insira algum valor';
            }
            return null;
          },
        ),
      ],
    );
  }
}
