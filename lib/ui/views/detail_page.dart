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
        backgroundColor: Colors.blueAccent[200],
        title: Text("Ürün Detayı",style: TextStyle(fontSize: 20),),
        leading: Icon(Icons.clear),
        actions: [IconButton(onPressed: (){
          //favori add
        }, icon: Icon(Icons.favorite_border_sharp))],

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network("http://kasimadalan.pe.hu/yemekler/resimler/${widget.food.yemek_resim_adi}"),
          Text("₺${widget.food.yemek_fiyat}",style: TextStyle(color: Colors.cyanAccent,fontSize: 25,fontWeight:FontWeight.w200),),
          Text("${widget.food.yemek_adi}",style: TextStyle(color: Colors.black,fontSize: 28,fontWeight: FontWeight.bold),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox( width: 75,height: 75,
                child: ElevatedButton(style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)))),onPressed: (){
                  //-
                }, child: Icon(Icons.remove)),
              ),
              Text("$productAmount",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              SizedBox(width: 75,height: 75,
                child: ElevatedButton(style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)))),
                    onPressed: (){
                  //+
                }, child: Icon(Icons.add)),
              )
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
