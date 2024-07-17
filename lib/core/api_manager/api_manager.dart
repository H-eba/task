import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../constants/constants.dart';
@singleton
class ApiManager{
  static late Dio dio;
  static void init() {
    dio = Dio(
        BaseOptions(
          baseUrl: Constants.baseUrl,
          validateStatus: (status) {
            if(status!<500){
              return true;
            }else{
              return false;
            }
          },
        ));
  }
  Future<Response> getRequest(
      {required String endPoint, Map<String, dynamic>? queryParameters,Map<String, dynamic>? headers}) async {
    var response = await dio.get(endPoint, queryParameters: queryParameters,
        options: Options(
            headers:headers
        )
    );
    return response;
  }
}