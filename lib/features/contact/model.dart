class ContactData {

  late final ContactModel data;


  ContactData.fromJson(Map<String, dynamic> json){
    data = ContactModel.fromJson(json['data']);

  }

}

class ContactModel {

  late final String phone;
  late final String email;
  late final String whatsapp;
  late final Social social;
  late final double lat;
  late final double lng;
  late final String location;

  ContactModel.fromJson(Map<String, dynamic> json){
    phone = json['phone']??"";
    email = json['email']??"";
    whatsapp = json['whatsapp']??"";
    social = Social.fromJson(json['social']);
    lat =double.tryParse(json['lat'].toString())??0 ;
    lng = double.tryParse(json['lng'].toString())??0 ;
    location = json['location']??"";
  }

}

class Social {
  late final String facebook;
  late final String twitter;
  late final String instagram;

  Social.fromJson(Map<String, dynamic> json){
    facebook = json['facebook']??"";
    twitter = json['twitter']??"";
    instagram = json['instagram']??"";
  }

}