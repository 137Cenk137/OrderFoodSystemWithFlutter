import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:yemek_sistemi/data/entity/yemek_cevap.dart';
import 'package:yemek_sistemi/data/entity/yemek_sepet.dart';
import 'package:yemek_sistemi/data/entity/yemek_sepet_cevap.dart';
import 'package:yemek_sistemi/data/entity/yemekler.dart';

class FoodRepository {

  List<Food> parseFood(String cevap) {
    return YemekCEVAP
        .fromJson(json.decode(cevap))
        .foods;
  }
  List<FoodBasket> parseFoodBasket(String cevap){
    return FoodBasketCevap.fromJson(json.decode(cevap)).foodBasket;
  }

  Future<List<Food>> getAllFood() async {
    String url = "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php";

    var answer = await Dio().get(url);
    return parseFood(answer.data.toString());
  }

  Future<List<FoodBasket>> getAllFromBasket() async {
    var url = "http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php";
    var veri = {"kullanici_adi":"batu"};
    var cevap = await Dio().post(url,data:veri );
    return parseFoodBasket(cevap.data.toString());
  }
}