import 'package:flutter/material.dart';
import 'halaman_beranda.dart';
import 'halaman_profil.dart';

class RootHalaman extends StatefulWidget {
  const RootHalaman({super.key});

  @override
  State<RootHalaman> createState() => _RootHalamanState();
}

class _RootHalamanState extends State<RootHalaman> {
  int _indeksHalaman = 0;

  void _pindahKeMenu() {
    setState(() {
      _indeksHalaman = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> daftarHalaman = [
      HalamanBeranda(),

      HalamanProfil(onPindahKeMenu: _pindahKeMenu),
    ];

    return Scaffold(
      body: daftarHalaman[_indeksHalaman],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indeksHalaman,
        selectedItemColor: Color(0xFFE07B39),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        onTap: (indeks) {
          setState(() {
            _indeksHalaman = indeks;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: 'Menu',
          ),

          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}
