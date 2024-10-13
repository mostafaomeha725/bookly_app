import 'package:dio/dio.dart';

class ApiServices {
  final baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio dio;
  ApiServices(this.dio);

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await dio.get('$baseUrl$endpoint');
    return response.data;
  }
}
