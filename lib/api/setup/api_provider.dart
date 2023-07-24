import 'package:dio/dio.dart';

class ApiProvider {
  final Dio _dio = Dio();

  Future<void> downloadFile({required String url, required String path}) async {
    await _dio.download(url, path);
  }
}
