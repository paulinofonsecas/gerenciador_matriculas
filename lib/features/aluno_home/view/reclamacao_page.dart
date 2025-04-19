import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ReclamacaoPage extends StatefulWidget {
  const ReclamacaoPage({Key? key}) : super(key: key);

  @override
  State<ReclamacaoPage> createState() => _ReclamacaoPageState();
}

class _ReclamacaoPageState extends State<ReclamacaoPage> {
  late User? user;
  final _controller = TextEditingController();
  bool _isLoading = false;

  Future<void> _enviarReclamacao() async {
    if (_controller.text.trim().isEmpty) return;
    setState(() => _isLoading = true);
    await FirebaseFirestore.instance.collection('reclamacoes').add({
      'usuarioId': user?.uid,
      'mensagem': _controller.text.trim(),
      'data': DateTime.now(),
      'status': 'pendente',
      'respostaAdmin': null,
    });
    _controller.clear();
    setState(() => _isLoading = false);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Reclamação enviada!')),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onChanged);
    user = FirebaseAuth.instance.currentUser;
  }

  void _onChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Reclamações'),
        elevation: 1,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
      ),
      body: Container(
        color: const Color(0xFFF7F7F7),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
              child: Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: _controller,
                        maxLines: 3,
                        decoration: InputDecoration(
                          labelText: 'Descreva sua reclamação',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: _isLoading ? null : _enviarReclamacao,
                          icon: const Icon(Icons.send_rounded),
                          label: _isLoading
                              ? const SizedBox(
                                  width: 18,
                                  height: 18,
                                  child:
                                      CircularProgressIndicator(strokeWidth: 2),
                                )
                              : const Text('Enviar'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurpleAccent,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            textStyle: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: const [
                  Icon(Icons.history, size: 20, color: Colors.deepPurple),
                  SizedBox(width: 8),
                  Text('Histórico de Reclamações',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('reclamacoes')
                    .where('usuarioId', isEqualTo: user?.uid)
                    .orderBy('data', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.data!.docs.isEmpty) {
                    return const Center(
                        child: Text('Nenhuma reclamação enviada.'));
                  }

                  final docs = snapshot.data!.docs;
                  if (docs.isEmpty) {
                    return const Center(
                        child: Text('Nenhuma reclamação enviada.'));
                  }

                  return ListView.separated(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                    itemCount: docs.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (context, i) {
                      final d = docs[i];
                      final dt = (d['data'] as Timestamp).toDate();
                      return Material(
                        elevation: 1,
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                d['mensagem'] ?? '',
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.info_outline,
                                          size: 16,
                                          color: (d['status'] == 'pendente'
                                              ? Colors.orange
                                              : Colors.green)),
                                      const SizedBox(width: 4),
                                      Text(
                                        'Status: ${d['status']}',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: (d['status'] == 'pendente'
                                                ? Colors.orange
                                                : Colors.green),
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')} ${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}',
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              ),
                              if (d['respostaAdmin'] != null &&
                                  d['respostaAdmin'].toString().isNotEmpty) ...[
                                const SizedBox(height: 8),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurple.shade50,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Icon(Icons.reply,
                                          size: 16, color: Colors.deepPurple),
                                      const SizedBox(width: 6),
                                      Expanded(
                                        child: Text(
                                          'Resposta do Admin: ${d['respostaAdmin']}',
                                          style: const TextStyle(
                                              fontSize: 13,
                                              color: Colors.deepPurple,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
