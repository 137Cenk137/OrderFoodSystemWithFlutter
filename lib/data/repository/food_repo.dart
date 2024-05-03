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
    var veri = {"kullanici_adi":"cenk"};
    var cevap = await Dio().post(url,data:FormData.fromMap(veri) );
    print(cevap.data);
    return  parseFoodBasket(cevap.data.toString());
  }

  Future<void> addBasket(String yemek_adi,String sepet_resim_adi,String yemek_fiyat,String kullanici_adi,String yemek_siparis_adet) async{
    var url = "http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php";
    var veri = {
      "yemek_adi" :yemek_adi,
      "yemek_resim_adi" :sepet_resim_adi,
      "yemek_fiyat" : yemek_fiyat,
      "yemek_siparis_adet" : yemek_siparis_adet,
      "kullanici_adi": "cenk"
    };
    var cevap  = await Dio().post(url,data: FormData.fromMap(veri));
  }

  Future<void> deleteFromBasket(String sepet_yemek_id)async{
    String url = "http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php";
    var veri = {
      "sepet_yemek_id":sepet_yemek_id,
      "kullanici_adi": "cenk"
    };
    var cevap = await Dio().post(url,data: FormData.fromMap(veri));
    print(cevap);
  }

}