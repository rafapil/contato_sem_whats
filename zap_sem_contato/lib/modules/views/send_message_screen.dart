import 'package:flutter/material.dart';
import 'package:zap_sem_contato/modules/controllers/recovery_countryes.dart';
import 'package:zap_sem_contato/modules/controllers/send_message.dart';

import '../../shared/widgets/app_custom_textfield.dart';

// import '../../shared/models/country_model.dart';

class SendMessageScreen extends StatefulWidget {
  const SendMessageScreen({super.key});

  @override
  State<SendMessageScreen> createState() => _SendMessageScreenState();
}

class _SendMessageScreenState extends State<SendMessageScreen> {
  final SendMessage sendMessage = SendMessage();
  final RecoveryCountryes _recoveryCountryes = RecoveryCountryes();

  var itemsCountry = [];

  @override
  void initState() {
    _recoveryCountryes.listCountryes().whenComplete(() => null);
    itemsCountry = _recoveryCountryes.countryesList;
    super.initState();
  }

  late List<DropdownMenuItem<String>> items = itemsCountry
      .map((country) => DropdownMenuItem(
            value: country['ddi'].toString(),
            child: Text(country['ddi'].toString()),
          ))
      .toList();

  String _selectedValue = "+55";

  @override
  Widget build(BuildContext context) {
    // _recoveryCountryes.listCountryes();

    return Scaffold(
      appBar: AppBar(
        title: const Text('teste'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 80,
                  child: DropdownButtonFormField(
                      isExpanded: true,
                      menuMaxHeight: double.maxFinite / 2,
                      // padding: EdgeInsets.only(top: 20.0),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      hint: const Text('Selecione o tipo de ocorrência'),
                      disabledHint:
                          const Text('Selecione o tipo de ocorrência'),
                      dropdownColor: Colors.white,
                      value: _selectedValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedValue = newValue!;
                        });
                      },
                      items: items),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 200,
                  child: AppCustomTextField(
                    hint: 'Digite o ddd + telefone',
                    // title: 'Telefone',
                    type: TextInputType.phone,
                    //   validator: (value) => EmailValidator.validate(value)
                    //       ? null
                    //       : "Email invalido, por favor verifique!",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
