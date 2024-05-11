import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_sistemi/ui/cubit/anasayfa_cubit.dart';
import 'package:yemek_sistemi/ui/views/basket_page.dart';
import 'package:yemek_sistemi/ui/views/favorite_page.dart';
import 'package:yemek_sistemi/ui/views/main_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {


int secilenIndex = 0;
var sayfalar = [const MainPage2(),const FavoritePage(),const BasketPage(),const MainPage2()];


@override
  void initState() {
    context.read<MainPageCubit>().getAllFood();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: sayfalar[secilenIndex],
      bottomNavigationBar: BottomNavigationBar(//null yapınca kayboluyor
        items: const [
          BottomNavigationBarItem( icon: Icon(Icons.house),label: "Anasayfa"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "Favori"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket_outlined),label: "Sepet"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_rounded),label: "hesap")
        ],

        selectedFontSize: 20,
        unselectedItemColor: Colors.grey[300],
        selectedItemColor: Colors.orange[200],
        currentIndex: secilenIndex,
        onTap: (index){
          setState(() {
            secilenIndex = index;
          });
        },

      ),
    );
  }
}
