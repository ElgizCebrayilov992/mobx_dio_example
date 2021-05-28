import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobx_dio_example/core/exeption/env_not_found.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NetWorkManager {
  static NetWorkManager? _instate;
  static NetWorkManager get inistance {
    if (_instate != null) return _instate!;
    _instate = NetWorkManager._init();
    return _instate!;
  }

final String _baseUrl='BASE_URL';
late final Dio dio;
 
 
  NetWorkManager._init() {
    final url = dotenv.env[_baseUrl];
    if (url != null) {
      dio = Dio(
        BaseOptions(
          baseUrl: url,
        ),
      );
      dio.interceptors.add(PrettyDioLogger());
      
      dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
        options.path+='.json';
        handler.next(options);
      },));
    }else{
      throw EnvNotFound(_baseUrl);
    }
  }
}
