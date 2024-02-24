import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:yemek_sistemi/data/entity/yemek_cevap.dart';
import 'package:yemek_sistemi/data/entity/yemekler.dart';

class FoodRepository{

  List<Food> parseFood(String cevap){
    return YemekCEVAP.fromJson(json.decode(cevap)).foods;
  }
  Future<List<Food>> getAllFood() async{
    String url = "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php";

    var answer = await Dio().get(url);
    return parseFood(answer.data.toString());

  }
}