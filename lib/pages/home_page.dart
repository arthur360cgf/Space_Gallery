import 'package:apod_app/pages/controller.dart';
import 'package:apod_app/services/apod_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/apod_model.dart';
import 'apod_details_page.dart';
import 'name_group_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = ApodController(ApodService(Dio()));
  final countController = TextEditingController();

  int count = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("S P A C E   G A L L E RY"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => NameGroupPage(),
                ),
              );
            },
            icon: const Icon(Icons.group),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.refresh();
          setState(() {});
        },
        child: FutureBuilder<List<ApodModel>>(
          future: controller.getApodData(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('Houve um erro ao carregar os dados!'),
                  );
                }
            }
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: TextFormField(
                    controller: countController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          if (countController.text.isNotEmpty) {
                            controller.setCountImage(
                              int.parse(countController.text),
                            );
                            setState(() {});
                          }
                        },
                        icon: const Icon(Icons.search),
                      ),
                      border: const OutlineInputBorder(),
                      label: const Text(
                        'Número de fotos',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      var item = snapshot.data![index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ApodDetailPage(
                                model: snapshot.data![index],
                              ),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            CachedNetworkImage(
                              progressIndicatorBuilder:
                                  (context, url, progress) => Center(
                                child: CircularProgressIndicator(
                                  value: progress.progress,
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              imageUrl: item.url!,
                            ),
                            Text(item.title!),
                            const SizedBox(height: 15),
                            Text(
                                '${item.date.day}/${item.date.month}/${item.date.year}'),
                            const SizedBox(height: 15),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
