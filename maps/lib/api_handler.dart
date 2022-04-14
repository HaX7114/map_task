import 'package:dio/dio.dart';

class APIHandler {
  static Dio? dio;

  static Map<String, dynamic> headers = {
    APIHandler.contentTypeKey: APIHandler.contentTypeValue
  };

  //Method
  static String method = 'lutangar/cities.json/master/cities.json';

  //Url & Methods
  static String baseURL = 'https://raw.githubusercontent.com/';
  //Header Keys
  static String contentTypeKey = 'Content-Type';
  //Header Values
  static String contentTypeValue = 'application/json';

  static initializeAPI() {
    dio = Dio(BaseOptions(
      baseUrl: baseURL,
      headers: headers,
      receiveDataWhenStatusError: true,
    ));
    print('API Initialized');
  }
}
