
 class WalletData {
  late List<WalletModel> list;
  late bool status;
  late String message,wallet;

  WalletData.fromJson(Map<String,dynamic> json){
    list = List.from(json["data"]??[]).map((e) => WalletModel.fromJson(e)).toList();
  }
 }

 class WalletModel{
  late int id,modelId;
  late double amount,beforeCharge,afterCharge;
  late String date,statusTrans,status,transactionType,modelType,state;
  late List<ImageList>image;
  late bool isCharge;

  WalletModel.fromJson(Map<String,dynamic> json){
    id = json["id"]??0;
    modelId = json["model_id"]??0;
    amount = double.tryParse(json["amount"].toString())??0;
    beforeCharge = double.tryParse(json["before_charge"].toString())??0;
    afterCharge = double.tryParse(json["after_charge"].toString())??0;
    date = json["date"]??"";
    statusTrans = json["status_trans"]??"";
    status = json["status"]??"";
    transactionType = json["transaction_type"]??"";
    modelType = json["model_type"]??"";
    state = json["state"]??"";
    image = List.from(json["images"]??[]).map((e) => ImageList.fromJson(e)).toList();
    isCharge = transactionType == "charge";

  }


 }


 class ImageList{
  late String name,url;
  ImageList.fromJson(Map<String,dynamic> json){
    name = json["name"];
    url = json["url"];
  }
 }