import 'package:dio/dio.dart';

extension DioResponseExtensions on Response {
  Map<String, dynamic> get json {
    if (data is Map<String, dynamic>) {
      return data;
    } else {
      return {};
    }
  }
}
