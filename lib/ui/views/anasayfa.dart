import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_sistemi/data/entity/yemekler.dart';
import 'package:yemek_sistemi/ui/cubit/anasayfa_cubit.dart';
import 'package:yemek_sistemi/ui/cubit/detail_page_cubit.dart';
import 'package:yemek_sistemi/ui/views/detail_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

var tfSearch = TextEditingController();


@override
  void initState() {
    context.read<MainPageCubit>().getAllFood();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Merhaba"),
        actions: [
          SizedBox(width:200, child: TextField(controller: tfSearch,decoration: InputDecoration(hintText: "ara"),)),
          IconButton(onPressed: (){}, icon: Icon(Icons.search))
        ],
      ),
      body: Center(
        child: Column(
          children: [

            BlocBuilder<MainPageCubit,List<Food>>(builder:
                (context,foodList) {
              if(foodList.isNotEmpty){
                return Expanded(
                  child: GridView.builder(
                      itemCount: foodList.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  
                      crossAxisCount: 2,childAspectRatio: 1 / 2
                  ), itemBuilder: (context,index){
                      var food = foodList[index];
                      return
                         Padding(
                           padding: const EdgeInsets.all(10.0),
                           child: GestureDetector(
                             onLongPress: (){
                               Navigator.push(context, MaterialPageRoute(builder: (context)=>DeatilPage(food: food))).then((v) {
                                 context.read<MainPageCubit>().getAllFood();
                               });
                             },
                             child: Card(



                             
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IconButton(onPressed: (){
                             
                                  }, icon:Icon(Icons.favorite_border_sharp,size: 28,) ),
                                  Image.network("http://kasimadalan.pe.hu/yemekler/resimler/${food.yemek_resim_adi}"),
                                  Center(child: Text("${food.yemek_adi}",style: TextStyle(fontSize: 20),)),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                    Icon(Icons.motorcycle),
                                    Text("ücretsiz gönderim")
                                  ],),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text("${food.yemek_fiyat} "),
                                      ElevatedButton(onPressed: (){
                                        //sepete Ekleme
                                      }, child: Icon(Icons.add)
                                      ,style: ButtonStyle(
                                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)))
                                        ),)
                                    ],),
                                  )
                             
                                ],
                              ),
                             
                                                   ),
                           ),
                         );
                  }),
                );
              }
              else{
                return Center(
                  child: Text("yk"),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
