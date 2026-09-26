import 'dart:io';
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../../shared/models/saved_link_model.dart';

class ExportController {
  Future<void> exportToXls(List<SavedLinkModel> links) async {
    final excel = Excel.createExcel();
    final sheet = excel['Links'];

    // Headers
    sheet.cell(CellIndex.indexByString('A1')).value = TextCellValue('Nome');
    sheet.cell(CellIndex.indexByString('B1')).value = TextCellValue('Telefone');
    sheet.cell(CellIndex.indexByString('C1')).value = TextCellValue('Mensagem');
    sheet.cell(CellIndex.indexByString('D1')).value = TextCellValue('Link');
    sheet.cell(CellIndex.indexByString('E1')).value = TextCellValue('Data');

    // Data rows
    for (int i = 0; i < links.length; i++) {
      final link = links[i];
      final row = i + 2;

      sheet.cell(CellIndex.indexByString('A$row')).value = TextCellValue(link.name);
      sheet.cell(CellIndex.indexByString('B$row')).value = TextCellValue(link.fullPhone);
      sheet.cell(CellIndex.indexByString('C$row')).value = TextCellValue(link.message ?? '');
      sheet.cell(CellIndex.indexByString('D$row')).value = TextCellValue(link.link);
      sheet.cell(CellIndex.indexByString('E$row')).value = TextCellValue(link.createdAt.toString());
    }

    final directory = await getTemporaryDirectory();
    final file = File('${directory.path}/zap_sem_contato_links.xlsx');
    final bytes = excel.save();
    if (bytes == null) {
      throw Exception('Falha ao gerar o arquivo XLSX.');
    }
    await file.writeAsBytes(bytes);

    await Share.shareXFiles(
      [XFile(file.path, mimeType: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')],
      subject: 'Links Zap sem Contato',
    );
  }

  Future<void> exportToCsv(List<SavedLinkModel> links) async {
    final buffer = StringBuffer();

    // Header
    buffer.writeln('Nome,Telefone,Mensagem,Link,Data');

    // Data rows
    for (final link in links) {
      final name = _escapeCsv(link.name);
      final phone = _escapeCsv(link.fullPhone);
      final message = _escapeCsv(link.message ?? '');
      final linkStr = _escapeCsv(link.link);
      final date = link.createdAt.toString();

      buffer.writeln('$name,$phone,$message,$linkStr,$date');
    }

    final directory = await getTemporaryDirectory();
    final file = File('${directory.path}/zap_sem_contato_links.csv');
    await file.writeAsString(buffer.toString());

    await Share.shareXFiles(
      [XFile(file.path)],
      subject: 'Links Zap sem Contato',
    );
  }

  String _escapeCsv(String value) {
    if (value.contains(',') || value.contains('"') || value.contains('\n')) {
      return '"${value.replaceAll('"', '""')}"';
    }
    return value;
  }
}
