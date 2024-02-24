import 'package:yemek_sistemi/data/entity/yemekler.dart';

class YemekCEVAP{
  int success;
  List<Food> foods;

  YemekCEVAP({required this.success,required this.foods});

  factory YemekCEVAP.fromJson(Map<String,dynamic> json){
    var jsonArray = json["yemekler"] as List;
    var foods = jsonArray.map((e) => Food.fromJson(e)).toList();
    return YemekCEVAP(success: json["success"] as int ,
         foods: foods);
  }
}