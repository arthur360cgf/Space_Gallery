import 'package:apod_app/models/apod_model.dart';
import 'package:dio/dio.dart';

class ApodService {
  final Dio _dio;
  ApodService(this._dio);
  Future<List<ApodModel>> getApods({int count = 20}) async {
    try {
      final response = await _dio.get(
        'https://api.nasa.gov/planetary/apod?api_key=ajwMbCAEsQhsnFJ6NNiNPR0VCyVPVpId9FWh7uJo',
        queryParameters: {
          'count': count,
        },
      );
      return (response.data as List)
          .map((item) => ApodModel.fromJson(item))
          .toList();
    } catch (e) {
      throw Exception('error get data!');
    }
  }
}
