class TermsData {
  late final TermModel data;


  TermsData.fromJson(Map<String, dynamic> json){
    data = TermModel.fromJson(json['data']);
  }
}

class TermModel {
  late final String terms;
  TermModel.fromJson(Map<String, dynamic> json){
    terms = json['terms']??"";
  }

}