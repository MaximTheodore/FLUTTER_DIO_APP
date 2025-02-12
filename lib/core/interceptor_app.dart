import 'package:dio/dio.dart';

class InterceptorApp extends QueuedInterceptor {
  
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler){
    options.headers['X-Api-Key'] = "P7B8eujDmpIVYcRaynIKJQ==gS06HvvVucIu6XOT";
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler){
    print(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler){
    super.onError(err, handler);
  }
  
}
