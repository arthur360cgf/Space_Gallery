import 'package:apod_app/models/apod_model.dart';
import 'package:apod_app/services/apod_service.dart';
import 'package:flutter/material.dart';

class ApodController extends ChangeNotifier {
  final ApodService _service;

  ApodController(this._service);

  int countImages = 20;

  setCountImage(int value) {
    countImages = value;
    getApodData();
  }

  Future<List<ApodModel>> getApodData() async {
    return await _service.getApods(count: countImages);
  }

  Future<void> refresh() async {
    await getApodData();
  }
}
