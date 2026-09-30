// ═══════════════════════════════════════════════════════════
// FILE: root.dart
// Fungsi: Pembungkus utama + Bottom Navigation Bar
// Import di: main.dart (home: RootHalaman())
// ═══════════════════════════════════════════════════════════
import 'package:flutter/material.dart';
import 'halaman_beranda.dart';
import 'halaman_profil.dart';

class RootHalaman extends StatefulWidget {
  const RootHalaman({super.key});
  @override
  State<RootHalaman> createState() => _RootHalamanState();
}

class _RootHalamanState extends State<RootHalaman> {
  int _indeksHalaman = 0; // ← VARIABEL: tab mana yang aktif (0=Menu, 1=Profil)

  void _pindahKeMenu() {
    setState(() { _indeksHalaman = 0; });
  }

  @override
  Widget build(BuildContext context) {
    // Daftar halaman sesuai urutan tab
    final daftarHalaman = <Widget>[
      HalamanBeranda(),                                    // index 0 = tab Menu
      HalamanProfil(onPindahKeMenu: _pindahKeMenu),        // index 1 = tab Profil
    ];

    return Scaffold(
      body: daftarHalaman[_indeksHalaman],










      // ═══ [BOTTOM-NAV] ════════════════════════════════════
      // Tampilan: Bar navigasi di BAWAH layar (Menu | Profil)
      // Copas: Ambil dari bottomNavigationBar sampai AKHIR BOTTOM-NAV
      // Syarat: Butuh variabel _indeksHalaman (int) + daftarHalaman (List)
      // ═════════════════════════════════════════════════════
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indeksHalaman,
        selectedItemColor: Color(0xFFE07B39),  // ← VARIABEL: warna tab aktif
        unselectedItemColor: Colors.grey,      // ← VARIABEL: warna tab tidak aktif
        backgroundColor: Colors.white,
        onTap: (indeks) {
          setState(() { _indeksHalaman = indeks; });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu), // ← VARIABEL: ikon tab 1
            label: 'Menu',                     // ← VARIABEL: nama tab 1
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),          // ← VARIABEL: ikon tab 2
            label: 'Profil',                   // ← VARIABEL: nama tab 2
          ),
        ],
      ),
      // ═══ AKHIR [BOTTOM-NAV] ══════════════════════════════










    );
  }
}
