class ProductRate {

  late final List<DataRateModel> list;
  late final String status;
  late final String message;

  ProductRate.fromJson(Map<String, dynamic> json){
    list = List.from(json['data']??[]).map((e)=>DataRateModel.fromJson(e)).toList();

    status = json['status'];
    message = json['message'];
  }


}

class DataRateModel {

  late  double value;
  late final String comment;
  late final String clientName;
  late final String clientImage;

  DataRateModel.fromJson(Map<String, dynamic> json){
    value = json['value']*1.0??0;
    comment = json['comment']??"";
    clientName = json['client_name']??"";
    clientImage = json['client_image'];
  }


}



