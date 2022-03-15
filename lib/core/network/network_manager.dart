import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NetworkManager {
  static NetworkManager? _instance;

  static NetworkManager get instance {
    if (_instance != null) return _instance!;

    _instance = NetworkManager._init();
    return _instance!;
  }

  final String _base_url = "https://jsonplaceholder.typicode.com";
  late final Dio dio;

  NetworkManager._init() {
    dio = Dio(BaseOptions(baseUrl: _base_url));
    //dio.interceptors.add(PrettyDioLogger());
  }
}
