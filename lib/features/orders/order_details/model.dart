class OrderDetailsData {
  late final String status;
  late final String message;
  late final OrderDetailsModel list;

  OrderDetailsData.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    list = OrderDetailsModel.fromJson(json['data']);
  }
}

class OrderDetailsModel {
  late final int id;
  late final String status;
  late final String date;
  late final String time;
  late final int orderPrice;
  late final int deliveryPrice;
  late final int totalPrice;
  late final String clientName;
  late final String phone;
  late final Address address;
  late final List<Products> products;
  late final String payType;
  late final String note;
  late final String deliveryPayer;
  late final int isVip;
  late final double vipDiscount;
  late final double priceBeforeDiscount;
  late final double discount;
  late bool buttonType;

  OrderDetailsModel.fromJson(Map<String, dynamic> json){
    id = json['id']??0;
    status = json['status']??"";
    date = json['date']??"";
    time = json['time']??"";
    orderPrice = int.tryParse(json['order_price'].toString())??0;
    deliveryPrice = int.tryParse(json['delivery_price'].toString())??0;
    totalPrice = int.tryParse(json['total_price'].toString())??0;
    clientName = json['client_name']??"";
    phone = json['phone']??"";
    address = Address.fromJson(json['address']);
    products = List.from(json['products']??[]).map((e)=>Products.fromJson(e)).toList();
    payType = json['pay_type']??"";
    note = json['note']??"";
    deliveryPayer = json['delivery_payer']??"";
    isVip =int.tryParse(json['is_vip'].toString())??0;
    vipDiscount =double.tryParse(json['vip_discount'].toString())??0;
    priceBeforeDiscount = double.tryParse(json['price_before_discount'].toString())??0;
    discount = double.tryParse(json['discount'].toString())??0;
    buttonType=status=="canceled";
  }
}

class Address {
  late final int id;
  late final String type;
  late final double lat;
  late final double lng;
  late final String location;
  late final String description;
  late final bool isDefault;
  late final String phone;

  Address.fromJson(Map<String, dynamic> json){
    id = json['id']??0;
    type = json['type']??"";
    lat =double.tryParse(json['lat'].toString())??0 ;
    lng = double.tryParse(json['lng'].toString())??0 ;
    location = json['location']??"";
    description = json['description']??"";
    isDefault = json['is_default'];
    phone = json['phone']??"";
  }
}

class Products {
  late final String name;
  late final String url;

  Products.fromJson(Map<String, dynamic> json){
    name = json['name']??"";
    url = json['url']??"";
  }

}