import 'package:yemek_sistemi/data/entity/yemek_sepet.dart';

class FoodBasketCevap{
  List<FoodBasket> foodBasket;
  int success;

  FoodBasketCevap({required this.foodBasket,required this.success});

  factory FoodBasketCevap.fromJson(Map<String,dynamic> json){
    var arrayList = json["sepet_yemekler"] as List;
    var foods = arrayList.map((e) => FoodBasket.fromJson(e)).toList();
    return FoodBasketCevap(foodBasket: foods, success: json["success"] as int);

  }
}