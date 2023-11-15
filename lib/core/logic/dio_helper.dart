import 'package:dio/dio.dart';

class DioHelper {
  final dio = Dio(BaseOptions( headers: {
    "Authorization":'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvdGhpbWFyLmFtci5hYWl0LWQuY29tXC9hcGlcL2xvZ2luIiwiaWF0IjoxNjk5NTE5NjM2LCJleHAiOjE3MzEwNTU2MzYsIm5iZiI6MTY5OTUxOTYzNiwianRpIjoiRm1reVhnOE1Mbjc2WUFMbCIsInN1YiI6MTEyNSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.M1jcYgTL8XX7Sf0vMw4_PXMg8ID5Wf6pHuH7cn6ndLo'

  },
      contentType: "application/json",baseUrl: "https://thimar.amr.aait-d.com/api/",));

  Future<CustomResponse?> sendData(String endPoint,
      {Map<String, dynamic>? data, bool haveToken=false}) async {
    print(endPoint);
    print(data);
    try {
      final response = await dio.post(endPoint, data: data,options: Options(headers: haveToken?
      {
        "Authorization": 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvdGhpbWFyLmFtci5hYWl0LWQuY29tXC9hcGlcL2xvZ2luIiwiaWF0IjoxNjk5NTM1NTAxLCJleHAiOjE3MzEwNzE1MDEsIm5iZiI6MTY5OTUzNTUwMSwianRpIjoiWVlLeTd0SVNWcEthdlYyayIsInN1YiI6MTEyNSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.LWib9k1HcQEvQjMVM-fLZ8YPmy4LSxQWB_N7dFHP_KU'
      }:null
      ));
      print(response.data);
      return CustomResponse(
          isSuccess: true,
          message: response.data["message"],
          response: response);
    } on DioException catch (ex) {
     //print(ex);
      print(ex);
      String msg;
      try{
         msg =  ex.response?.data["message"]??"";

      }catch (ex)
    {
      msg="";
    }
      return
        CustomResponse(
        message:msg,
        isSuccess: false,
        response: ex.response
      );
    }
  }
  Future<CustomResponse?> updateData(String endPoint,
      {Map<String, dynamic>? data, bool haveToken=false}) async {
    try {
      final response = await dio.put(endPoint, data: data,options: Options(headers: haveToken?
      {
        "Authorization": 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvdGhpbWFyLmFtci5hYWl0LWQuY29tXC9hcGlcL2xvZ2luIiwiaWF0IjoxNjk5NTM1NTAxLCJleHAiOjE3MzEwNzE1MDEsIm5iZiI6MTY5OTUzNTUwMSwianRpIjoiWVlLeTd0SVNWcEthdlYyayIsInN1YiI6MTEyNSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.LWib9k1HcQEvQjMVM-fLZ8YPmy4LSxQWB_N7dFHP_KU'
      }:null
      ));
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
      {Map<String, dynamic>? data,bool haveToken=false}) async {
    try {
      final response = await dio.get(endPoint, queryParameters: data,options: Options(
        headers:haveToken? {
          "Authorization": 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvdGhpbWFyLmFtci5hYWl0LWQuY29tXC9hcGlcL2xvZ2luIiwiaWF0IjoxNjk5NTM1NTAxLCJleHAiOjE3MzEwNzE1MDEsIm5iZiI6MTY5OTUzNTUwMSwianRpIjoiWVlLeTd0SVNWcEthdlYyayIsInN1YiI6MTEyNSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.LWib9k1HcQEvQjMVM-fLZ8YPmy4LSxQWB_N7dFHP_KU'
        }:null

      ));
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




  Future<CustomResponse> deleteData(String endPoint,
      {Map<String, dynamic>? data,bool haveToken=false}) async {
    try {
      final response = await dio.delete(endPoint, queryParameters: data,options: Options(
          headers:haveToken? {
            "Authorization": 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvdGhpbWFyLmFtci5hYWl0LWQuY29tXC9hcGlcL2xvZ2luIiwiaWF0IjoxNjk5NTM1NTAxLCJleHAiOjE3MzEwNzE1MDEsIm5iZiI6MTY5OTUzNTUwMSwianRpIjoiWVlLeTd0SVNWcEthdlYyayIsInN1YiI6MTEyNSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.LWib9k1HcQEvQjMVM-fLZ8YPmy4LSxQWB_N7dFHP_KU'
          }:null

      ));
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
