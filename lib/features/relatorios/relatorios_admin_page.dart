import 'dart:io' as io;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gerenciador_matriculas/features/relatorios/relatorios_pdf_web.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_datagrid_export/export.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class RelatoriosAdminPage extends StatefulWidget {
  const RelatoriosAdminPage({Key? key}) : super(key: key);

  @override
  State<RelatoriosAdminPage> createState() => _RelatoriosAdminPageState();
}

class _RelatoriosAdminPageState extends State<RelatoriosAdminPage> {
  final GlobalKey<SfDataGridState> _dataGridKey = GlobalKey<SfDataGridState>();
  bool _loading = false;
  String? _status;
  List<AlunoReportModel> _users = [];

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    setState(() => _loading = true);
    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('alunos').get();

      /* Extrutura
      String matricula;
      String curso;
      String classe;
      String turma;
      bool status;
      */

      final users = querySnapshot.docs.map((doc) {
        final data = doc.data();
        return AlunoReportModel(
          name: data['nome'] ?? '',
          matricula: data['matricula'] ?? '',
          curso: data['curso'] ?? '',
          classe: data['classe'] ?? '',
          turma: data['turma'] ?? '',
          status: data['status'] ?? false,
        );
      }).toList();
      setState(() {
        _users = users;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _loading = false;
        _status = 'Erro ao buscar usuários: $e';
      });
    }
  }

  Uint8List makePdfContent() {
    final document = PdfDocument();

    final pdfPage = document.pages.add();
    final headerTemplate =
        PdfPageTemplateElement(const Rect.fromLTWH(0, 0, 515, 50));
    headerTemplate.graphics.drawString(
      'Relatório de usuários',
      PdfStandardFont(PdfFontFamily.helvetica, 12),
      bounds: const Rect.fromLTWH(0, 15, 200, 20),
    );
    document.template.top = headerTemplate;

    final dataGridState = _dataGridKey.currentState;
    if (dataGridState != null) {
      dataGridState.exportToPdfGrid().draw(
            page: pdfPage,
            bounds: Rect.zero,
          );
    }

    final bytes = document.saveSync();
    final bytesToSave = Uint8List.fromList(bytes);

    return bytesToSave;
  }

  Future<void> _exportarPDF() async {
    final bytesToSave = makePdfContent();
    final fileName =
        'relatorio_de_usuarios_${DateTime.now().millisecondsSinceEpoch}.pdf';

    if (kIsWeb) {
      // Usar método web para download
      savePdfOnWeb(bytesToSave, fileName);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('PDF gerado e baixado com sucesso!')),
      );
      return;
    } else {
      // Mobile/desktop
      bool result = await Permission.manageExternalStorage.request().isGranted;
      if (!result) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sem permissão para exportar para PDF')),
        );
        return;
      }
      final dir = await path.getApplicationDocumentsDirectory();
      final relatoriosDir = io.Directory('${dir.absolute.path}/relatorios');
      if (!relatoriosDir.existsSync()) {
        relatoriosDir.createSync(recursive: true);
      }
      final file = io.File('${relatoriosDir.path}/$fileName')
        ..createSync(recursive: true)
        ..writeAsBytesSync(bytesToSave);
      final result0 = await Share.shareXFiles(
        [XFile(file.path)],
        text: 'Relatório de usuários',
      );
      if (result0.status == ShareResultStatus.success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('PDF compartilhado com sucesso!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Ocorreu um erro ao exportar para PDF')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Relatórios de Alunos')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton(
                  onPressed: _loading ? null : _exportarPDF,
                  child: const Text('Exportar para PDF'),
                ),
                const SizedBox(width: 16),
                if (_loading) const CircularProgressIndicator(),
                if (_status != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(_status!,
                        style: const TextStyle(color: Colors.red)),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SfDataGridTheme(
                data: SfDataGridThemeData(
                  headerColor: Theme.of(context).primaryColor,
                ),
                child: SfDataGrid(
                  key: _dataGridKey,
                  source: UsersReportDataSource(users: _users),
                  allowSorting: true,
                  showHorizontalScrollbar: true,
                  columns: [
                    GridColumn(
                      columnName: 'name',
                      columnWidthMode: ColumnWidthMode.fitByCellValue,
                      label: Container(
                        padding: const EdgeInsets.all(16),
                        alignment: Alignment.centerLeft,
                        child: const Text('Nome',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    GridColumn(
                      columnName: 'matricula',
                      columnWidthMode: ColumnWidthMode.fitByColumnName,
                      label: Container(
                        padding: const EdgeInsets.all(16),
                        alignment: Alignment.centerLeft,
                        child: const Text('Matrícula',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    GridColumn(
                      columnName: 'curso',
                      columnWidthMode: ColumnWidthMode.fitByCellValue,
                      label: Container(
                        padding: const EdgeInsets.all(16),
                        alignment: Alignment.centerLeft,
                        child: const Text('Curso',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    GridColumn(
                      columnName: 'classe',
                      columnWidthMode: ColumnWidthMode.fitByColumnName,
                      label: Container(
                        padding: const EdgeInsets.all(16),
                        alignment: Alignment.centerLeft,
                        child: const Text('Classe',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    GridColumn(
                      columnName: 'turma',
                      columnWidthMode: ColumnWidthMode.fitByColumnName,
                      label: Container(
                        padding: const EdgeInsets.all(16),
                        alignment: Alignment.centerLeft,
                        child: const Text('Turma',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    GridColumn(
                      columnName: 'status',
                      columnWidthMode: ColumnWidthMode.fitByColumnName,
                      label: Container(
                        padding: const EdgeInsets.all(16),
                        alignment: Alignment.centerLeft,
                        child: const Text('Ativo',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AlunoReportModel {
  final String name;
  final String matricula;
  final String curso;
  final String classe;
  final String turma;
  final bool status;

  AlunoReportModel({
    required this.name,
    required this.matricula,
    required this.curso,
    required this.classe,
    required this.turma,
    required this.status,
  });
}

class UsersReportDataSource extends DataGridSource {
  final List<AlunoReportModel> users;
  List<DataGridRow> _rows = [];
  UsersReportDataSource({required this.users}) {
    _rows = users
        .map((u) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'name', value: u.name),
              DataGridCell<String>(columnName: 'matricula', value: u.matricula),
              DataGridCell<String>(columnName: 'curso', value: u.curso),
              DataGridCell<String>(columnName: 'classe', value: u.classe),
              DataGridCell<String>(columnName: 'turma', value: u.turma),
              DataGridCell<String>(columnName: 'status', value: u.status ? 'Sim' : 'Não'),
            ]))
        .toList();
  }
  @override
  List<DataGridRow> get rows => _rows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map((cell) {
        return Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Text(cell.value.toString()),
        );
      }).toList(),
    );
  }
}
