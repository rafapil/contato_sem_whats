import 'package:flutter/material.dart';
import 'package:zap_sem_contato/modules/controllers/recovery_countryes_controller.dart';
import 'package:zap_sem_contato/modules/controllers/send_message_controller.dart';
import 'package:zap_sem_contato/shared/themes/app_colors.dart';
import 'package:zap_sem_contato/shared/themes/app_images.dart';
import 'package:zap_sem_contato/shared/themes/app_textstyles.dart';
import '../../shared/widgets/app_buttom.dart';
import '../../shared/widgets/app_custom_multilinetext.dart';
import '../../shared/widgets/app_custom_textfield.dart';
import '../../shared/widgets/app_strings.dart';

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

  String _selectedValue = '+55';

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
              AppStrings.appTitle,
              style: AppTextStyles.txtTitleWhite,
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                    AppStrings.insertNumberContact,
                    style: AppTextStyles.txtTextForm,
                  ),
                ],
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
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: AppCustomTextField(
                        textEditingController: phoneEdittingController,
                        hint: AppStrings.hintTextPhoneCall,
                        type: TextInputType.phone,
                        maxLength: 11,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              AppCustomMultilinetext(
                type: TextInputType.multiline,
                hint: AppStrings.hintMessageNotrequired,
                titulo: AppStrings.titleMessageNotrequired,
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
                        textoButtom: AppStrings.btnCallContact,
                        width: 300,
                        function: () {
                          if (phoneEdittingController.text.isEmpty) {
                            showDialog<String>(
                              // ignore: use_build_context_synchronously
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: Text(
                                  'Atenção',
                                  style: AppTextStyles.txtAlertTitle,
                                ),
                                content: Text(
                                  'Necessário digitar o telefone com ddd antes!',
                                  style: AppTextStyles.txtTextAlertHint,
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: Text(
                                      'OK',
                                      style: AppTextStyles.txtTextForm,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            _sendMessageController.sendMessageNoContact(
                                ddi: _selectedValue,
                                phoneNumber: phoneEdittingController.text,
                                message: messageEdittingController.text,
                                tipeLink: false);
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AppButtom(
                        buttomStyle: AppTextStyles.txtButtomWhite,
                        color: AppColors.primary,
                        textoButtom: AppStrings.btnLinkContact,
                        width: 300,
                        function: () async {
                          linkContact =
                              await _sendMessageController.sendMessageNoContact(
                                  ddi: _selectedValue,
                                  phoneNumber: phoneEdittingController.text,
                                  message: messageEdittingController.text,
                                  tipeLink: true);
                          if (linkContact == null) {
                            showDialog<String>(
                              // ignore: use_build_context_synchronously
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: Text(
                                  'Atenção',
                                  style: AppTextStyles.txtAlertTitle,
                                ),
                                content: Text(
                                  'Necessário digitar o telefone com ddd antes!',
                                  style: AppTextStyles.txtTextAlertHint,
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: Text(
                                      'OK',
                                      style: AppTextStyles.txtTextForm,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            linkContactEdittingController.text =
                                linkContact.toString();
                          }
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
                    enabled: false,
                    type: TextInputType.text,
                    textEditingController: linkContactEdittingController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppButtom(
                    buttomStyle: AppTextStyles.txtButtomWhite,
                    color: AppColors.primary,
                    textoButtom: AppStrings.btnCopyLink,
                    width: 300,
                    function: () {
                      String response;
                      if (phoneEdittingController.text.isEmpty) {
                        response = 'Insira um telefone valido antes!';
                      } else if (linkContactEdittingController.text.isEmpty) {
                        response = 'Clique em criar link antes de copiar!';
                      } else {
                        response = 'Link copiado para area de transferencia';
                        _sendMessageController.copyToClipboard(
                            linkContactEdittingController.text);
                      }
                      // _sendMessageController
                      //     .copyToClipboard(linkContactEdittingController.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(response),
                          duration: const Duration(milliseconds: 3000),
                          width: 320.0,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 8.0,
                          ),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(
          left: 8,
        ),
        child: Row(
          children: [
            TextButton(
              onPressed: () =>
                  _sendMessageController.redirectUrl(AppStrings.linkVaquinha),
              child: Text(
                AppStrings.btnDonate,
                style: AppTextStyles.txtTextLink,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
