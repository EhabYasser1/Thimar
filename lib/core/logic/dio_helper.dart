import 'package:dio/dio.dart';

class DioHelper {
  final dio = Dio(BaseOptions(
      contentType: "application/json",baseUrl: "https://thimar.amr.aait-d.com/api/"));

  Future<CustomResponse?> sendData(String endPoint,
      {Map<String, dynamic>? data}) async {
    try {
      final response = await dio.post(endPoint, data: data);
      print(response.data);
      return CustomResponse(
          isSuccess: true,
          message: response.data["message"],
          response: response);
    } on DioException catch (ex) {
     //print(ex);
      return
        CustomResponse(
        message: ex.response?.data["message"]??"",
        isSuccess: false,
        response: ex.response
      );
    }
  }

  Future<CustomResponse> getData(String endPoint,
      {Map<String, dynamic>? data}) async {
    try {
      final response = await dio.get(endPoint, queryParameters: data);
      print(response.data);
      return CustomResponse(
          isSuccess: true,
          message: response.data["message"],
          response: response);
    } on DioException catch (ex) {
      print(ex.response?.data.runtimeType);
      print(ex.response?.data);
      return
        CustomResponse(
            message:ex.response?.data is String?"حدث خطاء": ex.response?.data["message"]??"",
            isSuccess: false,
            response: ex.response
        );
    }
  }
}

class CustomResponse {
  late final String message;
  late final bool isSuccess;
  late final Response? response;

  CustomResponse(
      {required this.message, required this.isSuccess, this.response});
}
