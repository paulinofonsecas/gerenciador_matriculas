import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
  List<UserReportModel> _users = [];

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    setState(() => _loading = true);
    try {
      final querySnapshot = await FirebaseFirestore.instance.collection('usuarios').get();
      final users = querySnapshot.docs.map((doc) {
        final data = doc.data();
        return UserReportModel(
          name: data['name'] ?? '',
          email: data['email'] ?? '',
          role: data['role'] ?? '',
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

  Future<void> _exportarPDF() async {
    final result = await Permission.manageExternalStorage.request().isGranted;
    if (!result) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sem permissão para exportar para PDF')),
      );
      return;
    }
    final document = PdfDocument();
    final pdfPage = document.pages.add();
    final headerTemplate = PdfPageTemplateElement(const Rect.fromLTWH(0, 0, 515, 50));
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
    final dir = await path.getApplicationDocumentsDirectory();
    final relatoriosDir = Directory('${dir.absolute.path}/relatorios');
    if (!relatoriosDir.existsSync()) {
      relatoriosDir.createSync(recursive: true);
    }
    final fileName = 'relatorio_de_usuarios_${DateTime.now().millisecondsSinceEpoch}.pdf';
    final file = File('${relatoriosDir.path}/$fileName')
      ..createSync(recursive: true)
      ..writeAsBytesSync(bytes);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Relatórios de Usuários (Admin)')),
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
                    child: Text(_status!, style: const TextStyle(color: Colors.red)),
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
                  columns: [
                    GridColumn(
                      columnName: 'name',
                      columnWidthMode: ColumnWidthMode.fitByCellValue,
                      label: Container(
                        padding: const EdgeInsets.all(16),
                        alignment: Alignment.centerLeft,
                        child: const Text('Nome', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    GridColumn(
                      columnName: 'email',
                      columnWidthMode: ColumnWidthMode.fitByCellValue,
                      label: Container(
                        padding: const EdgeInsets.all(16),
                        alignment: Alignment.centerLeft,
                        child: const Text('Email', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    GridColumn(
                      columnName: 'role',
                      columnWidthMode: ColumnWidthMode.fitByColumnName,
                      label: Container(
                        padding: const EdgeInsets.all(16),
                        alignment: Alignment.centerLeft,
                        child: const Text('Tipo', style: TextStyle(color: Colors.white)),
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

class UserReportModel {
  final String name;
  final String email;
  final String role;
  UserReportModel({required this.name, required this.email, required this.role});
}

class UsersReportDataSource extends DataGridSource {
  final List<UserReportModel> users;
  List<DataGridRow> _rows = [];
  UsersReportDataSource({required this.users}) {
    _rows = users
        .map((u) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'name', value: u.name),
              DataGridCell<String>(columnName: 'email', value: u.email),
              DataGridCell<String>(columnName: 'role', value: u.role),
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

        setState(() {
          _status = 'PDF gerado e baixado no navegador.';
        });
      } else {
        // MOBILE/DESKTOP: Salva no filesystem
        final dir = await getApplicationDocumentsDirectory();
        final file = File('${dir.path}/relatorio_${tipo}_${DateTime.now().millisecondsSinceEpoch}.pdf');
        await file.writeAsBytes(bytes, flush: true);
        setState(() {
          _status = 'PDF salvo em: ${file.path}';
        });
      }
    } catch (e) {
      setState(() {
        _status = 'Erro ao gerar PDF: $e';
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Relatórios (Admin)')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: _loading ? null : () => _generatePDF('alunos'),
              child: const Text('Gerar relatório de Alunos'),
            ),
            ElevatedButton(
              onPressed: _loading ? null : () => _generatePDF('reclamacoes'),
              child: const Text('Gerar relatório de Reclamações'),
            ),
            ElevatedButton(
              onPressed: _loading ? null : () => _generatePDF('usuarios'),
              child: const Text('Gerar relatório de Usuários'),
            ),
            const SizedBox(height: 24),
            if (_loading) const Center(child: CircularProgressIndicator()),
            if (_status != null) Text(_status!, style: const TextStyle(color: Colors.green)),
          ],
        ),
      ),
    );
  }
}
