import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: BottomNavigationBar(
        selectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 35,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),

          const BottomNavigationBarItem(icon: Icon(Icons.search,color: Colors.black,),label: 'search'),

          BottomNavigationBarItem(icon: Image.asset('assets/images/instagram-reels.png',width: 25,),label: ''),

          const BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined,color: Colors.black,),label: ''),

          const BottomNavigationBarItem(icon: CircleAvatar(backgroundImage: AssetImage('assets/images/img3.jpg'),
          ),label: 'user'),


        ],

      ),
    );
  }
}
