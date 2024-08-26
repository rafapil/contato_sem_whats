import 'package:flutter/material.dart';
import 'package:zap_sem_contato/modules/controllers/recovery_countryes_controller.dart';
import 'package:zap_sem_contato/modules/controllers/send_message_controller.dart';
import 'package:zap_sem_contato/shared/themes/app_colors.dart';
import 'package:zap_sem_contato/shared/themes/app_images.dart';
import 'package:zap_sem_contato/shared/themes/app_textstyles.dart';
import '../../shared/widgets/app_buttom.dart';
import '../../shared/widgets/app_custom_multilinetext.dart';
import '../../shared/widgets/app_custom_textfield.dart';

class SendMessageScreen extends StatefulWidget {
  const SendMessageScreen({super.key});

  @override
  State<SendMessageScreen> createState() => _SendMessageScreenState();
}

class _SendMessageScreenState extends State<SendMessageScreen> {
  final SendMessageController _sendMessageController = SendMessageController();
  final RecoveryCountryesController _recoveryCountryesController =
      RecoveryCountryesController();

  var itemsCountry = [];

  @override
  void initState() {
    _recoveryCountryesController.listCountryes().whenComplete(() => null);
    itemsCountry = _recoveryCountryesController.countryesList;
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
    final phoneEdittingController = TextEditingController();
    final messageEdittingController = TextEditingController();
    var linkContactEdittingController = TextEditingController();
    // ignore: prefer_typing_uninitialized_variables
    var linkContact;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Row(
          children: [
            Image.asset(
              AppImages.logoImageApp,
              height: 32,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Zap sem contato',
              style: AppTextStyles.txtTitleWhite,
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'Insira o número para contato',
                  style: AppTextStyles.txtTextForm,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: 80,
                  child: DropdownButtonFormField(
                      isExpanded: true,
                      menuMaxHeight: double.maxFinite / 2,
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
                  width: 250,
                  child: AppCustomTextField(
                    textEditingController: phoneEdittingController,
                    hint: 'Digite o ddd + telefone',
                    type: TextInputType.phone,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            AppCustomMultilinetext(
              type: TextInputType.multiline,
              hint: 'Mensagem não obrigatorio!',
              titulo: 'Mensagem (não obrigatorio)',
              textEditingController: messageEdittingController,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    AppButtom(
                      buttomStyle: AppTextStyles.txtButtomWhite,
                      color: AppColors.primary,
                      textoButtom: 'Chamar contato',
                      width: 300,
                      function: () {
                        _sendMessageController.sendMessageNoContact(
                            ddi: _selectedValue,
                            phoneNumber: phoneEdittingController.text,
                            message: messageEdittingController.text,
                            tipeLink: false);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppButtom(
                      buttomStyle: AppTextStyles.txtButtomWhite,
                      color: AppColors.primary,
                      textoButtom: 'Criar link para contato',
                      width: 300,
                      function: () async {
                        linkContact =
                            await _sendMessageController.sendMessageNoContact(
                                ddi: _selectedValue,
                                phoneNumber: phoneEdittingController.text,
                                message: messageEdittingController.text,
                                tipeLink: true);
                        linkContactEdittingController.text =
                            linkContact.toString();
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                AppCustomTextField(
                  type: TextInputType.text,
                  textEditingController: linkContactEdittingController,
                ),
                const SizedBox(
                  height: 20,
                ),
                AppButtom(
                  buttomStyle: AppTextStyles.txtButtomWhite,
                  color: AppColors.primary,
                  textoButtom: 'Copiar link',
                  width: 300,
                  function: () => _sendMessageController
                      .copyToClipboard(linkContactEdittingController.text),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          bottom: 2,
          top: 2,
        ),
        child: Row(
          children: [
            TextButton(
              onPressed: () {},
              child: Text('Contribua com nosso trabalho - Faz um PIX!'),
            ),
          ],
        ),
      ),
    );
  }
}
