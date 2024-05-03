import 'package:yemek_sistemi/data/entity/yemekler.dart';
import 'package:yemek_sistemi/data/repository/veritabani_yardimcisi.dart';

class FoodFavoriteRepository
{
  Future<void> addFavori(String yemek_id,String yemek_adi, String yemek_resim_adi,String yemek_fiyat) async
  {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var info = Map<String,dynamic>();
    info["yemek_id"] = yemek_id;
    info["yemek_adi"] = yemek_adi;
    info["yemek_resim_adi"] = yemek_resim_adi;
    info["YemekFiyat"] = yemek_fiyat;
    await db.insert("Foods", info);
    print("succesful");
  }

  Future<void> deleteFavori(String yemek_id) async
  {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    
    await db.delete("Foods",where: "yemek_id" ,whereArgs: [yemek_id]);
  }

  Future<List<Food>> getAllFavorite() async
  {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM Foods");

    return List.generate(maps.length, (index) {
      var row = maps[index];
      return Food(yemek_id: row["yemek_id"], yemek_adi: row["yemek_adi"], yemek_resim_adi: row["yemek_resim_adi"], yemek_fiyat: row["yemek_fiyat"]);

    });
  }
}
