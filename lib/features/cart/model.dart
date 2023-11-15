class CartData {

  late final List<CartModel> list;
  late final num totalPriceBeforeDiscount;
  late final num totalDiscount;
  late final num totalPriceWithVat;
  late final num deliveryCost;
  late final num freeDeliveryPrice;
  late final double vat;
  late final num isVip;
  late final num vipDiscountPercentage;
  late final num minVipPrice;
  late final String vipMessage;
  late final String status;
  late final String message;

  CartData.fromJson(Map<String, dynamic> json){
    list = List.from(json['data']).map((e)=>CartModel.fromJson(e)).toList();
    totalPriceBeforeDiscount = json['total_price_before_discount'];
    totalDiscount = json['total_discount'];
    totalPriceWithVat = json['total_price_with_vat'];
    deliveryCost = json['delivery_cost'];
    freeDeliveryPrice = json['free_delivery_price'];
    vat = json['vat'];
    isVip = json['is_vip'];
    vipDiscountPercentage = json['vip_discount_percentage'];
    minVipPrice = json['min_vip_price'];
    vipMessage = json['vip_message'];
    status = json['status'];
    message = json['message'];
  }


}

class CartModel {

  late final int id;
  late final String title;
  late final String image;
  late  int amount;
  late final int count;
  late final num priceBeforeDiscount;
  late final num discount;
  late final num price;
  late final num remainingAmount;

  CartModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    image = json['image'];
    amount = json['amount'];
    priceBeforeDiscount = json['price_before_discount'];
    discount = json['discount'];
    price = json['price'];
    remainingAmount = json['remaining_amount'];
  }


}