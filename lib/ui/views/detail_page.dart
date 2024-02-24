import 'package:flutter/material.dart';

import '../../data/entity/yemekler.dart';

class DeatilPage extends StatefulWidget {
  Food food;
  DeatilPage({super.key,required this.food});


  @override
  State<DeatilPage> createState() => _DeatilPageState();
}

class _DeatilPageState extends State<DeatilPage> {
  int productAmount = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ürün Detayı",style: TextStyle(fontSize: 20),),
        leading: Icon(Icons.clear),

      ),
      body: Center(
        child: Column(
        children: [
          Image.network("http://kasimadalan.pe.hu/yemekler/resimler/${widget.food.yemek_resim_adi}"),
          Text("₺${widget.food.yemek_fiyat}"),
          Text("${widget.food.yemek_adi}"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: (){
                
              }, child: Icon(Icons.remove)),
              Text("$productAmount",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              ElevatedButton(onPressed: (){}, child: Icon(Icons.add))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(onPressed: (){} , child: Text("25-30")),
              TextButton(onPressed: (){} , child: Text("Ücretsiz gönderim")),
              TextButton(onPressed: (){} , child: Text("indirim %10")),
            ],
          ),
          Row(
            children: [
              Text("₺${widget.food.yemek_fiyat*productAmount}"),
              ElevatedButton(onPressed: (){
                // sepete Ekle
              }, child: Text("Sepete Ekle"))
            ],
          )
        ],
        ),
      ),
    );
  }
}
