No Flutter, a forma mais eficiente e recomendada de gerenciar isso é utilizando o pacote oficial url_launcher.Como você quer dar a opção de abrir uma versão ou outra, a lógica consiste em tentar abrir o aplicativo específico usando o URL Scheme / Intent correspondente. Se o app não estiver instalado, você faz um fallback (plano B) para o link web universal (https://wa.me).Aqui está a estrutura de código pronta para você implementar no seu app Flutter:1. Configurações Nativas ObrigatóriasAntes do código Flutter, você precisa liberar a permissão de abertura dos apps nos arquivos de configuração nativos, caso contrário o sistema operacional irá bloquear a tentativa.🍏 No iOS (ios/Runner/Info.plist)Adicione os schemas do WhatsApp normal (whatsapp) e do Business (wab) dentro da tag <dict>:xml<key>LSApplicationQueriesSchemes</key>
<array>
  <string>whatsapp</string>
  <string>wab</string>
  <string>https</string>
</array>
Use o código com cuidado.🤖 No Android (android/app/src/main/AndroidManifest.xml)A partir do Android 11, você precisa declarar as intenções de consulta dentro da tag <manifest>:xml<queries>
  <package android:name="com.whatsapp" />
  <package android:name="com.whatsapp.w4b" />
  <intent>
    <action android:name="android.intent.action.VIEW" />
    <category android:name="android.intent.category.BROWSABLE" />
    <data android:scheme="https" />
  </intent>
</queries>
Use o código com cuidado.2. Código em FlutterAbaixo está uma função limpa e assíncrona. Ela recebe o número, a mensagem e um booleano indicando se deve forçar a abertura do WhatsApp Business.dartimport 'dart:io';
import 'package:url_launcher/url_launcher.dart';

Future<void> abrirWhatsApp({
  required String numero, // Ex: "5511999999999"
  required String mensagem,
  required bool ehBusiness,
}) async {
  // Codifica o texto para o formato de URL (substitui espaços por %20, etc.)
  final String mensagemCodificada = Uri.encodeComponent(mensagem);

  // 1. Define os links específicos para cada plataforma e versão
  String urlCustomScheme = '';
  
  if (Platform.isAndroid) {
    // No Android usamos o pacote correspondente na própria URL para o url_launcher gerenciar
    final String pacote = ehBusiness ? "com.whatsapp.w4b" : "com.whatsapp";
    urlCustomScheme = "whatsapp://send?phone=$numero&text=$mensagemCodificada&package=$pacote";
  } else if (Platform.isIOS) {
    // No iOS usamos o scheme 'wab://' para Business e 'whatsapp://' para o Normal
    final String scheme = ehBusiness ? "wab://" : "whatsapp://";
    urlCustomScheme = "${scheme}send?phone=$numero&text=$mensagemCodificada";
  }

  final Uri uriCustom = Uri.parse(urlCustomScheme);
  final Uri uriUniversal = Uri.parse("https://wa.me");

  try {
    // 2. Tenta abrir o aplicativo específico diretamente (Deep Link)
    if (await canLaunchUrl(uriCustom)) {
      await launchUrl(uriCustom, mode: LaunchMode.externalApplication);
    } else {
      // 3. Fallback: Se o app específico não abrir, tenta o link universal no navegador
      if (await canLaunchUrl(uriUniversal)) {
        await launchUrl(uriUniversal, mode: LaunchMode.externalApplication);
      } else {
        throw 'Não foi possível abrir o WhatsApp.';
      }
    }
  } catch (e) {
    print("Erro ao abrir link: $e");
  }
}
Use o código com cuidado.💡 Dica de UX para o seu AppComo boa prática na interface do seu app, coloque um Switch ou Checkbox na tela de configuração ou no envio do link com o texto:"Enviar usando o WhatsApp Business"Assim, sua variável ehBusiness muda de acordo com o que o usuário escolher e o Flutter se encarrega de chamar o pacote ou scheme correto de forma transparente.Para deixar essa integração perfeita, me tire uma dúvida:O seu app vai rodar em Android e iOS, ou você está focando em apenas uma das plataformas por enquanto?Você precisa que o app também valide se o número digitado é válido antes de tentar abrir o link?