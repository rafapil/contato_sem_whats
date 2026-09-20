import 'dart:io';

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

  final TextEditingController _phoneEdittingController =
      TextEditingController();
  final TextEditingController _messageEdittingController =
      TextEditingController();
  final TextEditingController _linkContactEdittingController =
      TextEditingController();

  String _selectedValue = '+55';
  List<MenuItemButton> _countryMenuItems = [];
  bool _isLoading = true;

  Future<void> _loadAndBuildItems() async {
    await _recoveryCountryesController.listCountryes();
    final itemsCountry = _recoveryCountryesController.countryesList;
    final menuItems = itemsCountry
        .map<MenuItemButton>((country) => MenuItemButton(
              onPressed: () {
                setState(() {
                  _selectedValue = country['ddi'].toString();
                });
              },
              child: Text(country['ddi'].toString()),
            ))
        .toList();

    setState(() {
      _countryMenuItems = menuItems;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadAndBuildItems();
  }

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.sizeOf(context).height;
    final widthScreen = MediaQuery.sizeOf(context).width;

    // ignore: prefer_typing_uninitialized_variables
    var linkContact;

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: AppColors.black,
              ),
              child: Image.asset(
                AppImages.logoImageApp,
                height: 32,
              ),
            ),
            ListTile(
              title: Text(
                AppStrings.menuAbout,
                style: AppTextStyles.txtTextForm,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              title: Text(
                AppStrings.menuPrivacyPolicy,
                style: AppTextStyles.txtTextForm,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/privacy');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: AppColors.black,
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
          padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
                    width: widthScreen * 0.22,
                    child: _isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : MenuAnchor(
                            alignmentOffset: const Offset(10, -8),
                            style: MenuStyle(
                              fixedSize: WidgetStatePropertyAll(
                                Size.fromHeight(heightScreen * 0.3),
                              ),
                            ),
                            menuChildren: _countryMenuItems,
                            builder: (context, controller, child) {
                              return TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 12.0),
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                      color: AppColors.primary,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  minimumSize: const Size.fromHeight(54),
                                ),
                                onPressed: () {
                                  if (controller.isOpen) {
                                    controller.close();
                                  } else {
                                    controller.open();
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      _selectedValue,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: AppColors.black,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                  ),
                  const SizedBox(width: 5),
                  SizedBox(
                    width: widthScreen * 0.65,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: AppCustomTextField(
                        textEditingController: _phoneEdittingController,
                        hint: AppStrings.hintTextPhoneCall,
                        type: TextInputType.phone,
                        maxLength: 20,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: heightScreen * 0.02,
              ),
              AppCustomMultilinetext(
                type: TextInputType.multiline,
                hint: AppStrings.hintMessageNotrequired,
                titulo: AppStrings.titleMessageNotrequired,
                textEditingController: _messageEdittingController,
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
                          if (_phoneEdittingController.text.isEmpty) {
                            showDialog<String>(
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
                                phoneNumber: _phoneEdittingController.text,
                                message: _messageEdittingController.text,
                                tipeLink: false);
                          }
                        },
                      ),
                      SizedBox(
                        height: heightScreen * 0.02,
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
                                  phoneNumber: _phoneEdittingController.text,
                                  message: _messageEdittingController.text,
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
                            _linkContactEdittingController.text =
                                linkContact.toString();
                          }
                        },
                      ),
                      SizedBox(
                        height: heightScreen * 0.03,
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
                    textEditingController: _linkContactEdittingController,
                  ),
                  SizedBox(
                    height: heightScreen * 0.02,
                  ),
                  AppButtom(
                    buttomStyle: AppTextStyles.txtButtomWhite,
                    color: AppColors.primary,
                    textoButtom: AppStrings.btnCopyLink,
                    width: 300,
                    function: () {
                      String response;
                      if (_phoneEdittingController.text.isEmpty) {
                        response = 'Insira um telefone valido antes!';
                      } else if (_linkContactEdittingController.text.isEmpty) {
                        response = 'Clique em criar link antes de copiar!';
                      } else {
                        response = 'Link copiado para area de transferencia';
                        _sendMessageController.copyToClipboard(
                            _linkContactEdittingController.text);
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            response,
                            textAlign: TextAlign.center,
                          ),
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
              SizedBox(
                height: heightScreen * 0.16,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Platform.isAndroid
          ? Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 50),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () => _sendMessageController
                        .redirectUrl(AppStrings.linkVaquinha),
                    child: Text(
                      AppStrings.btnDonate,
                      style: AppTextStyles.txtTextLink,
                    ),
                  ),
                ],
              ),
            )
          : null,
    );
  }
}
