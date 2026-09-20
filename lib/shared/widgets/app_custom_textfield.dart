import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zap_sem_contato/shared/services/phone_input_formatter.dart';
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
    List<TextInputFormatter> formatters = [];
    if (type == TextInputType.phone) {
      formatters.add(const PhoneInputFormatter());
      formatters.add(LengthLimitingTextInputFormatter(20));
    }

    if(maxLength != null) {
      formatters.add(LengthLimitingTextInputFormatter(maxLength));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != ''
            ? Text(
                title,
                style: AppTextStyles.txtTextForm,
              )
            : Container(),

        TextFormField(
          maxLength: maxLength,
          enabled: enabled,
          keyboardType: type,
          obscureText: oculto,
          inputFormatters: formatters.isNotEmpty ? formatters : null,
          decoration: InputDecoration(
            hintText: hint,
            border: const OutlineInputBorder(

            ),
            hintStyle: AppTextStyles.txtTextFormHint,
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

