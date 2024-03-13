import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_sistemi/ui/cubit/basket_page_cubit.dart';
import 'package:yemek_sistemi/ui/cubit/detail_page_cubit.dart';

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
        backgroundColor: Colors.orange[400],
        title: Text("Ürün Detayı",style: TextStyle(fontSize: 20,color: Colors.white),),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.clear)),
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
          Text("₺${widget.food.yemek_fiyat}",style: TextStyle(color: Colors.orange[400],fontSize: 25,fontWeight:FontWeight.w200),),
          Text("${widget.food.yemek_adi}",style: TextStyle(color: Colors.black,fontSize: 28,fontWeight: FontWeight.bold),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox( width: 75,height: 75,
                child: ElevatedButton(style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)))),onPressed: (){
                  //-
                  setState(() {
                    productAmount--;
                  });
                }, child: Icon(Icons.remove)),
              ),
              Text("$productAmount",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              SizedBox(width: 75,height: 75,
                child: ElevatedButton(style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)))),
                    onPressed: (){
                  //+
                      setState(() {
                        productAmount++;
                      });
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
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0,left: 5,right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Text("₺${ int.parse(widget.food.yemek_fiyat) * productAmount}",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color: Colors.orange[400]),)),
                Expanded(
                  child: TextButton(
                    onPressed: (){
                      //context.read<DetailPageCubit>().addBasket(widget.food.yemek_adi, widget.food.yemek_resim_adi, widget.food.yemek_fiyat, widget.food.yemek_id,productAmount.toString());
                    },
                    child: const Text("Sepete Ekle",style: TextStyle(color: Colors.white,fontSize: 20,shadows: [Shadow(color: Colors.black,blurRadius: 2,offset: Offset(0,1.5))]),),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.orange[400],

                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12)))
                    ),
                  )
                )
              ],
            ),
          )
        ],
        ),
      ),
    );
  }
}
