import 'package:flutter/material.dart';
import '../../shared/themes/app_colors.dart';
import '../../shared/themes/app_strings.dart' as app_strings;
import '../../shared/themes/app_textstyles.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              // Drag handle
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.textSecondary.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              // Content
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(24),
                  children: [
                    // App header
                    Center(
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              Icons.chat,
                              size: 48,
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            app_strings.AppStrings.appTitle,
                            style: AppTextStyles.txtAboutTitle,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            app_strings.AppStrings.appVersion,
                            style: AppTextStyles.txtCaption,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Divider(),
                    const SizedBox(height: 16),

                    // Description
                    Text(
                      app_strings.AppStrings.sectionSobre,
                      style: AppTextStyles.txtSectionHeader,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      app_strings.AppStrings.aboutDescricao,
                      style: AppTextStyles.txtAboutBody,
                    ),
                    const SizedBox(height: 24),

                    // Privacy Policy
                    _buildExpandableSection(
                      title: app_strings.AppStrings.sectionPolitica,
                      content: _buildPrivacyPolicy(),
                    ),
                    const SizedBox(height: 16),

                    // Terms of Use
                    _buildExpandableSection(
                      title: app_strings.AppStrings.sectionTermos,
                      content: _buildTermsOfUse(),
                    ),
                    const SizedBox(height: 24),

                    // Developer info
                    const Divider(),
                    const SizedBox(height: 16),
                    Text(
                      'Desenvolvedor',
                      style: AppTextStyles.txtSectionHeader,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      app_strings.AppStrings.developerNome,
                      style: AppTextStyles.txtAboutBody,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      app_strings.AppStrings.developerEmail,
                      style: AppTextStyles.txtLink,
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildExpandableSection({
    required String title,
    required Widget content,
  }) {
    return ExpansionTile(
      title: Text(
        title,
        style: AppTextStyles.txtSectionHeader,
      ),
      tilePadding: EdgeInsets.zero,
      childrenPadding: const EdgeInsets.only(top: 8),
      children: [content],
    );
  }

  Widget _buildPrivacyPolicy() {
    return Text(
      '''**Última atualização:** 20 de setembro de 2026

**1. Introdução**
O Zap sem Contato é um aplicativo que prioriza sua privacidade. Não coletamos, transmitimos ou compartilhamos dados pessoais.

**2. Dados coletados**
O app armazena apenas localmente no dispositivo:
- Telefone e mensagem que você insere para criar links
- Lista de links salvos por você

**3. O que NÃO coletamos**
- Não coletamos nome, e-mail ou dados pessoais
- Não acessamos sua localização
- Não acessamos sua lista de contatos
- Não usamos analytics ou rastreadores
- Não temos sistema de login
- Não possuímos servidores

**4. Armazenamento**
Todos os dados ficam armazenados exclusivamente no seu dispositivo. Para excluir todos os dados, basta desinstalar o app.

**5. Links wa.me**
O app gera links no formato wa.me. Não temos controle sobre as políticas de privacidade da Meta/WhatsApp.

**6. Contato**
${app_strings.AppStrings.developerEmail}''',
      style: AppTextStyles.txtAboutBody,
    );
  }

  Widget _buildTermsOfUse() {
    return Text(
      '''**Última atualização:** 20 de setembro de 2026

**1. Aceitação**
Ao usar o app, você concorda com estes termos.

**2. Finalidade**
O Zap sem Contato gera links wa.me para comunicação via WhatsApp sem adicionar contatos.

**3. Uso aceitável**
- Criar links para comunicação consensual
- Não utilizar para harassment, spam ou fins ilegais

**4. Isenção de responsabilidade**
- App fornecido "como está"
- Não garantimos disponibilidade contínua
- Não temos controle sobre links wa.me ou WhatsApp

**5. Propriedade intelectual**
O nome e identidade visual são propriedade do desenvolvedor.

**6. Lei aplicável**
Leis brasileiras. Foro da comarca do desenvolvedor.''',
      style: AppTextStyles.txtAboutBody,
    );
  }
}
