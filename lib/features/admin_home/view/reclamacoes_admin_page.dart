import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReclamacoesAdminPage extends StatelessWidget {
  const ReclamacoesAdminPage({Key? key}) : super(key: key);

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const ReclamacoesAdminPage());
  }

  void _responderReclamacao(BuildContext context, String id, String? respostaAtual, {String? statusAtual}) async {
    final controller = TextEditingController(text: respostaAtual);
    final statusController = TextEditingController(text: statusAtual ?? 'pendente');
    bool loading = false;
    final result = await showDialog<Map<String, String>>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Responder Reclamação'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: controller,
                decoration: const InputDecoration(labelText: 'Resposta do Admin'),
                maxLines: 3,
              ),
              TextField(
                controller: statusController,
                decoration: const InputDecoration(labelText: 'Status (ex: pendente, resolvida)'),
              ),
              if (loading)
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: loading
                  ? null
                  : () async {
                      setState(() => loading = true);
                      await Future.delayed(const Duration(milliseconds: 400));
                      Navigator.of(context).pop({
                        'resposta': controller.text,
                        'status': statusController.text,
                      });
                    },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
    if (result != null) {
      await FirebaseFirestore.instance.collection('reclamacoes').doc(id).update({
        'respostaAdmin': result['resposta'],
        'status': result['status']?.isNotEmpty == true ? result['status'] : 'pendente',
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reclamações dos Clientes')),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('reclamacoes').orderBy('data', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final docs = snapshot.data!.docs;
          if (docs.isEmpty) {
            return const Center(child: Text('Nenhuma reclamação recebida.'));
          }
          return ListView.separated(
            itemCount: docs.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, i) {
              final d = docs[i];
              final status = (d['status'] ?? 'pendente').toString().toLowerCase();
              final isResolvida = status == 'resolvida';
              final resposta = d['respostaAdmin'] ?? '';
              final data = (d['data'] as Timestamp).toDate();
              Color statusColor;
              switch (status) {
                case 'resolvida':
                  statusColor = Colors.green;
                  break;
                case 'pendente':
                  statusColor = Colors.orange;
                  break;
                default:
                  statusColor = Colors.grey;
              }
              return Card(
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Usuário: ${d['usuarioId']}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Chip(
                            label: Text(status.toUpperCase()),
                            backgroundColor: statusColor.withOpacity(0.2),
                            labelStyle: TextStyle(color: statusColor, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text('${data.day.toString().padLeft(2, '0')}/${data.month.toString().padLeft(2, '0')}/${data.year} ${data.hour.toString().padLeft(2, '0')}:${data.minute.toString().padLeft(2, '0')}', style: const TextStyle(color: Colors.grey)),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        d['mensagem'] ?? '',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      if (resposta.isNotEmpty)
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.reply, size: 18, color: Colors.green),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  resposta,
                                  style: const TextStyle(color: Colors.green, fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (resposta.isEmpty)
                        Text('Sem resposta do admin.', style: TextStyle(color: Colors.orange[700], fontStyle: FontStyle.italic)),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            tooltip: 'Responder',
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () async {
                              _responderReclamacao(context, d.id, resposta, statusAtual: status);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Resposta/status atualizados!')),
                              );
                            },
                          ),
                          IconButton(
                            tooltip: 'Excluir',
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () async {
                              final confirm = await showDialog<bool>(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: const Text('Excluir reclamação'),
                                  content: const Text('Tem certeza que deseja excluir esta reclamação?'),
                                  actions: [
                                    TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancelar')),
                                    ElevatedButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Excluir')),
                                  ],
                                ),
                              );
                              if (confirm == true) {
                                await FirebaseFirestore.instance.collection('reclamacoes').doc(d.id).delete();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Reclamação excluída.')),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
