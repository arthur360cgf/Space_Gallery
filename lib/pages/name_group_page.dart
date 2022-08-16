import 'package:flutter/material.dart';

import '../models/apod_model.dart';

class NameGroupPage extends StatefulWidget {
  const NameGroupPage({Key? key}) : super(key: key);

  @override
  _NameGroupPageState createState() => _NameGroupPageState();
}

class _NameGroupPageState extends State<NameGroupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("membros da equipe"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Nomes do integrantes',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Text('Arthur Aragão Mattei Moraes'),
            SizedBox(height: 15),
            Text('Victor Cavalcante Vieira'),
            SizedBox(height: 15),
            Text('Karlisson Brendo de Brito Ribeiro Ferreira'),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
 //imagem, título, data, explicação e copyright