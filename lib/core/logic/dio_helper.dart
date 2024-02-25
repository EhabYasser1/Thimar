import 'package:dio/dio.dart';

class DioHelper {
  final dio = Dio(BaseOptions(
    baseUrl: "https://thimar.amr.aait-d.com/api/",
  ));

  Future<CustomResponse> sendData(String endPoint,
      {Map<String, dynamic>? data, bool haveToken = false}) async {
    print(endPoint);
    print(data);
    try {
      final response = await dio.post(endPoint, data: data, options: options);
      print(response.data);
      return CustomResponse(
          isSuccess: true,
          message: response.data["message"],
          response: response);
    } on DioException catch (ex) {
      //print(ex);
      print(ex);
      print(ex.message);
      print(ex.response);
      String msg;
      try {
        msg = ex.response?.data["message"] ?? "";
      } catch (ex) {
        msg = "";
      }
      return CustomResponse(
          message: msg, isSuccess: false, response: ex.response);
    }
  }

  get options => Options(headers: {
        "Accept": "application/json",
        "Authorization":
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvdGhpbWFyLmFtci5hYWl0LWQuY29tXC9hcGlcL2xvZ2luIiwiaWF0IjoxNzA2NjI5MzEyLCJleHAiOjE3MzgxNjUzMTIsIm5iZiI6MTcwNjYyOTMxMiwianRpIjoiamhCQWM1djFzSUZtSjduYyIsInN1YiI6MTEyNSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.u5iQt9q4XlALndm1oDsgYM13IL2yG4sXRZZMLpUEaf0'
      });


  Future<CustomResponse> getData(String endPoint,
      {Map<String, dynamic>? data}) async {
    try {
      final response = await dio.get(endPoint,
          queryParameters: data,
          options: options);
      print(response.data);
      return CustomResponse(
          isSuccess: true,
          message: response.data["message"],
          response: response);
    } on DioException catch (ex) {
      print(ex.response?.data.runtimeType);
      print(ex.response?.data);
      return CustomResponse(
          message: ex.response?.data is String
              ? "حدث خطاء"
              : ex.response?.data["message"] ?? "",
          isSuccess: false,
          response: ex.response);
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
