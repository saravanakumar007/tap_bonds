import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiClientService {
  ApiClientService() : dio = Dio();

  final Dio dio;
}
