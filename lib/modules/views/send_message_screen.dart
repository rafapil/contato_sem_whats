import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../controllers/link_generator_controller.dart';
import '../controllers/export_controller.dart';
import '../providers/links_provider.dart';
import '../../shared/data/database_country.dart';
import '../../shared/themes/app_colors.dart';
import '../../shared/themes/app_strings.dart' as app_strings;
import 'about_screen.dart';

class SendMessageScreen extends StatefulWidget {
  const SendMessageScreen({super.key});

  @override
  State<SendMessageScreen> createState() => _SendMessageScreenState();
}

class _SendMessageScreenState extends State<SendMessageScreen> {
  final LinkGeneratorController _linkController = LinkGeneratorController();
  final ExportController _exportController = ExportController();

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final TextEditingController _linkDisplayController = TextEditingController();

  String _selectedDdi = '+55';
  String? _generatedLink;
  bool _linkGenerated = false;

  @override
  void dispose() {
    _phoneController.dispose();
    _messageController.dispose();
    _linkDisplayController.dispose();
    super.dispose();
  }

  void _createLink() {
    final phone = _phoneController.text;
    if (!_linkController.validatePhone(phone)) {
      _showSnackBar(app_strings.AppStrings.msgTelefoneObrigatorio);
      return;
    }

    final link = _linkController.generateLink(
      ddi: _selectedDdi,
      phone: phone,
      message: _messageController.text.isEmpty ? null : _messageController.text,
    );

    setState(() {
      _generatedLink = link;
      _linkDisplayController.text = link;
      _linkGenerated = true;
    });
  }

  Future<void> _openWhatsApp() async {
    final phone = _phoneController.text;
    if (!_linkController.validatePhone(phone)) {
      _showSnackBar(app_strings.AppStrings.msgTelefoneObrigatorio);
      return;
    }

    await _linkController.openWhatsApp(
      ddi: _selectedDdi,
      phone: phone,
      message: _messageController.text.isEmpty ? null : _messageController.text,
    );
  }

  Future<void> _copyLink() async {
    if (_generatedLink == null) return;
    await _linkController.copyToClipboard(_generatedLink!);
    _showSnackBar(app_strings.AppStrings.msgLinkCopiado);
  }

  Future<void> _saveLink() async {
    if (_generatedLink == null) {
      _showSnackBar('Crie um link primeiro');
      return;
    }

    final name = await _showNameDialog();
    if (name != null && name.isNotEmpty && mounted) {
      await context.read<LinksProvider>().saveLink(
            name: name,
            ddi: _selectedDdi,
            phone: _phoneController.text,
            message: _messageController.text.isEmpty ? null : _messageController.text,
            link: _generatedLink!,
          );
      _showSnackBar(app_strings.AppStrings.msgLinkSalvo);
    }
  }

  Future<String?> _showNameDialog() async {
    final nameController = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(app_strings.AppStrings.dialogSalvarLink),
        content: TextField(
          controller: nameController,
          decoration: InputDecoration(
            labelText: app_strings.AppStrings.dialogNomeLink,
            hintText: app_strings.AppStrings.dialogHintNomeLink,
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(app_strings.AppStrings.btnCancel),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, nameController.text),
            child: Text(app_strings.AppStrings.btnOk),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmClearAll() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(app_strings.AppStrings.msgConfirmarLimpar),
        content: Text(app_strings.AppStrings.msgConfirmarLimparTodos),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(app_strings.AppStrings.btnCancel),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
            onPressed: () => Navigator.pop(context, true),
            child: Text(app_strings.AppStrings.btnExcluir),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      await context.read<LinksProvider>().clearAllLinks();
      _showSnackBar(app_strings.AppStrings.msgLinksLimpados);
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        width: 300,
      ),
    );
  }

  void _showAboutSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const AboutScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Icon(Icons.chat, color: AppColors.white, size: 28),
            const SizedBox(width: 10),
            Text(
              app_strings.AppStrings.appTitle,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: AppColors.white),
            onPressed: _showAboutSheet,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // DDI and Phone Row
            Row(
              children: [
                // DDI Dropdown
                Expanded(
                  flex: 3,
                  child: DropdownButtonFormField<String>(
                    initialValue: _selectedDdi,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                    ),
                    items: _buildDdiItems(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() => _selectedDdi = value);
                      }
                    },
                  ),
                ),
                const SizedBox(width: 12),
                // Phone field
                Expanded(
                  flex: 5,
                  child: TextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: app_strings.AppStrings.labelTelefone,
                      hintText: app_strings.AppStrings.hintTelefone,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Message field
            TextField(
              controller: _messageController,
              keyboardType: TextInputType.text,
              maxLength: 300,
              decoration: InputDecoration(
                labelText: app_strings.AppStrings.labelMensagem,
                hintText: app_strings.AppStrings.hintMensagem,
                counterText: '',
              ),
            ),
            const SizedBox(height: 24),

            // Action buttons row
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _createLink,
                    child: Text(app_strings.AppStrings.btnCriarLink),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _openWhatsApp,
                    child: Text(app_strings.AppStrings.btnAbrirWhatsApp),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Link display and copy
            if (_linkGenerated) ...[
              TextField(
                controller: _linkDisplayController,
                enabled: true,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.copy),
                    onPressed: _copyLink,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: _saveLink,
                child: Text(app_strings.AppStrings.btnSalvarLink),
              ),
              const SizedBox(height: 32),
            ],

            // Saved Links Section
            _buildSavedLinksSection(),
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> _buildDdiItems() {
    final countries = DatabaseCountry().countries.values.toList();
    countries.sort((a, b) => a.ddi.compareTo(b.ddi));

    return countries.map((c) {
      return DropdownMenuItem<String>(
        value: c.ddi,
        child: Text(c.ddi),
      );
    }).toList();
  }

  Widget _buildSavedLinksSection() {
    return Consumer<LinksProvider>(
      builder: (context, linksProvider, child) {
        if (!linksProvider.hasLinks) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Text(
                app_strings.AppStrings.msgListaVazia,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14,
                ),
              ),
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${app_strings.AppStrings.sectionLinksSalvos} (${linksProvider.linksCount})',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                TextButton(
                  onPressed: _confirmClearAll,
                  child: Text(
                    app_strings.AppStrings.btnLimparLinks,
                    style: const TextStyle(
                      color: AppColors.error,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: linksProvider.links.length,
              itemBuilder: (context, index) {
                final link = linksProvider.links[index];
                return Slidable(
                  key: Key(link.id),
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (_) => linksProvider.deleteLink(link.id),
                        backgroundColor: AppColors.error,
                        foregroundColor: AppColors.white,
                        icon: Icons.delete,
                        label: app_strings.AppStrings.btnExcluir,
                      ),
                    ],
                  ),
                  child: Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      title: Text(
                        link.name,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        '${link.maskedPhone}${link.messagePreview.isNotEmpty ? ' - ${link.messagePreview}' : ''}',
                        style: const TextStyle(fontSize: 12),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.copy, size: 20),
                            onPressed: () async {
                              await _linkController.copyToClipboard(link.link);
                              _showSnackBar(app_strings.AppStrings.msgLinkCopiado);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.open_in_new, size: 20),
                            onPressed: () async {
                              await _linkController.openWhatsApp(
                                ddi: link.ddi,
                                phone: link.phone,
                                message: link.message,
                              );
                            },
                          ),
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          _selectedDdi = link.ddi;
                          _phoneController.text = link.phone;
                          _messageController.text = link.message ?? '';
                          _generatedLink = link.link;
                          _linkDisplayController.text = link.link;
                          _linkGenerated = true;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _exportController.exportToXls(linksProvider.links),
                    icon: const Icon(Icons.table_chart),
                    label: Text(app_strings.AppStrings.btnExportarXls),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _exportController.exportToCsv(linksProvider.links),
                    icon: const Icon(Icons.description),
                    label: Text(app_strings.AppStrings.btnExportarCsv),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
