import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_sistemi/data/entity/yemekler.dart';
import 'package:yemek_sistemi/data/repository/food_repo.dart';

class DetailPageCubit extends Cubit<void>
{
  DetailPageCubit():super(0);

  var frepo = FoodRepository();
  Future<void> addBasket(String yemek_adi,String sepet_resim_adi,String yemek_fiyat,String kullanici_adi,String yemek_siparis_adet) async{
     await frepo.addBasket(yemek_adi, sepet_resim_adi, yemek_fiyat, kullanici_adi, yemek_siparis_adet);
  }

}