class FagsData {

  late final List<FagsModel> list;


  FagsData.fromJson(Map<String, dynamic> json){
    list = List.from(json['data']??[]).map((e)=>FagsModel.fromJson(e)).toList();

  }

}

class FagsModel {

  late final int id;
  late final String question;
  late final String answer;

  FagsModel.fromJson(Map<String, dynamic> json){
    id = json['id']??0;
    question = json['question']??"";
    answer = json['answer']??"";
  }


}