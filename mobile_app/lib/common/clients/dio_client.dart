// import 'package:dio/dio.dart';
// import 'package:mobile_app/common/exceptions/exceptions.dart';

// class DioClient {
//   final Dio _dio;

//   DioClient()
//       : _dio = Dio(
//           BaseOptions(
//             baseUrl: 'http://localhost:3000',
//             connectTimeout: const Duration(seconds: 5),
//             receiveTimeout: const Duration(seconds: 5),
//             headers: {
//               'Content-Type': 'application/json',
//             },
//           ),
//         ) {
//     _dio.interceptors.add(
//       InterceptorsWrapper(
//         onError: (DioException e, handler) {
//           if (e.response != null) {
//             print('[DioClient] API EXCEPTION: ${e}');
//             throw ApiException(
//               e.response?.data['message'] ?? 'Something went wrong.',
//             );
//           } else {
//             print('[DioClient] NETWORK EXCEPTION: ${e}');
//             throw NetworkException(
//               e.message ?? 'Please check your internet connection.',
//             );
//           }
//         },
//       ),
//     );
//   }

//   Dio get dio => _dio;
// }
import 'package:dio/dio.dart';
import 'package:mobile_app/common/exceptions/exceptions.dart';

class DioClient {
  final Dio _dio;

  DioClient()
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'http://localhost:3000',
            connectTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 5),
            headers: {
              'Content-Type': 'application/json',
            },
          ),
        ) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException e, handler) {
          if (e.response != null) {
            print('[DioClient] API EXCEPTION: ${e}');
            handler.reject(
              ApiException(
                e.response?.data['message'] ?? 'Something went wrong.',
              ),
            );
          } else {
            print('[DioClient] NETWORK EXCEPTION: ${e}');
            handler.reject(
              NetworkException(
                e.message ?? 'Please check your internet connection.',
              ),
            );
          }
        },
      ),
    );
  }

  Dio get dio => _dio;
}
