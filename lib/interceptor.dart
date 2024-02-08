// import 'package:dio/dio.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// class CustomInterceptors extends Interceptor {
//   final storage = FlutterSecureStorage();

//   @override
//   void onRequest(
//       RequestOptions options, RequestInterceptorHandler handler) async {
//     String? token = await storage.read(key: 'token');
//     options.headers.addAll({'Authoriztion': 'Bearer $token'});
//     handler.next(options);
//   }

//   @override
//   void onError(DioError err, ErrorInterceptorHandler handler) async {
//     if (err.response?.statusCode == 401) {
//       Dio dio = Dio();
//       String? refreshToken = await storage.read(key: 'refreshToken');
//       dio.options.headers['Authorization'] = 'Bearer $refreshToken';

//       try {
//         final response = await dio.post('http://10.0.2.2:8000/refresh-token/');
//         await storage.write(key: 'token', value: response.data['token']);
//         // Repeat the failed request with the new token
//         handler.resolve(await dio.fetch(err.requestOptions));
//       } catch (refreshError) {
//         // Handle refresh error, you may want to log or handle it accordingly
//         if (refreshError is DioError) {
//           handler.reject(refreshError);
//         } else {
//           // Handle other types of errors
//           handler.reject(DioError(
//               requestOptions: err.requestOptions,
//               error: refreshError.toString()));
//         }
//       }
//     } else {
//       handler.next(err);
//     }
//   }
// }
