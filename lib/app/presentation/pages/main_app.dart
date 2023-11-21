import 'package:flutter/material.dart';
import 'package:micro_frontend_flutter/app/modules/post/lib/post.dart';
import 'package:micro_frontend_flutter/app/modules/product/lib/product.dart';
import 'package:micro_frontend_flutter/app/modules/profile/lib/profile.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;
  final List _pages = [
    PostApp.create(),
    ProductApp.create(),
    ProfileApp.create(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.message_rounded),
            label: 'Post',
            tooltip: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_rounded),
            label: 'Product',
            tooltip: 'Product',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Profile',
            tooltip: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
