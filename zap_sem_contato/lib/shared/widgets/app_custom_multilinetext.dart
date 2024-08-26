import 'package:flutter/material.dart';

class AppCustomMultilinetext extends StatelessWidget {
  final String titulo, hint;
  final TextEditingController? textEditingController;
  final TextInputType type;
  final bool oculto;

  const AppCustomMultilinetext({
    Key? key,
    required this.titulo,
    required this.hint,
    required this.type,
    this.textEditingController,
    this.oculto = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          maxLength: 200,
          keyboardType: type,
          obscureText: oculto,
          maxLines: 5,
          minLines: 3,
          decoration: InputDecoration(
              isDense: true,
              hintText: hint,
              border: const OutlineInputBorder(),
              hintStyle: const TextStyle(fontSize: 12)),
          controller: textEditingController,
        ),
      ],
    );
  }
}
