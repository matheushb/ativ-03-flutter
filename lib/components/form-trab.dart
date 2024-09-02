import 'package:flutter/material.dart';

class FormTrab extends StatefulWidget {
  @override
  _FormTrabState createState() => _FormTrabState();
}

class _FormTrabState extends State<FormTrab> {
  final List<Map<String, String>> db = [];
  final _formKey = GlobalKey<FormState>();
  final controller = TextEditingController();
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formulário e Lista')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Formulário
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'CPF'),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: controller1,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Email'),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: controller2,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Senha'),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      final formData = {
                        'cpf': controller.text,
                        'nome': controller1.text,
                        'senha': controller2.text
                      };
                      setState(() {
                        db.add(formData);
                      });
                      controller.clear();
                      controller1.clear();
                      controller2.clear();
                      print(db); // Apenas para depuração
                    },
                    child: const Text('ME PRESSIONA'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Lista de itens
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: db.length,
                itemBuilder: (context, index) {
                  final item = db[index];
                  return ListTile(
                    title: Text('CPF: ${item['cpf']}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email: ${item['nome']}'),
                        Text('Senha: ${item['senha']}'),
                      ],
                    ),
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
