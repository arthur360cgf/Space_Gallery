import 'package:flutter/material.dart';

import '../models/apod_model.dart';

class ApodDetailPage extends StatefulWidget {
  final ApodModel model;
  const ApodDetailPage({Key? key, required this.model}) : super(key: key);

  @override
  _ApodDetailPageState createState() => _ApodDetailPageState();
}

class _ApodDetailPageState extends State<ApodDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            Image.network(
              widget.model.url!,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(widget.model.title!),
                  const SizedBox(height: 15),
                  Text(
                      '${widget.model.date.day}/${widget.model.date.month}/${widget.model.date.year}'),
                  const SizedBox(height: 15),
                  Text(widget.model.explanation!),
                  const SizedBox(height: 15),
                  const SizedBox(height: 15),
                  Text(widget.model.copyright!),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
 //imagem, título, data, explicação e copyright