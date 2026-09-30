import 'package:flutter/material.dart';

// ═════════════════════════════════════════════════════════════════════════════
// FILE: lib/independent/bottom_navigation.dart
// TAMPILAN: Bottom Navigation Bar (Menu Resto & Profil)
// KETERKAITAN: Dipakai di `root.dart` pada properti `bottomNavigationBar:`
// METODE COPAS: Copas widget `BottomNavigationBar` atau class `BottomNavWidget`
// ═════════════════════════════════════════════════════════════════════════════
//
// ✏️ PETUNJUK EDIT BESOK SAAT KUIS:
// 1. Indeks Terpilih  -> Controlled by `currentIndex` (0 = Menu, 1 = Profil)
// 2. Warna Aktif      -> `selectedItemColor: Colors.green`
// 3. Tambah Tab Ke-3  -> Tambahkan item baru di dalam list `items: [...]` di bawah
// ═════════════════════════════════════════════════════════════════════════════

class BottomNavWidget extends StatelessWidget {
  final int indeksAktif;
  final Function(int) onPindahTab;

  const BottomNavWidget({
    super.key,
    required this.indeksAktif,
    required this.onPindahTab,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: indeksAktif, // ← Indeks tab yang sedang aktif
      onTap: onPindahTab,         // ← Callback saat tab diklik (pindah halaman)
      selectedItemColor: Colors.green, // ← EDIT: Warna tab saat aktif
      unselectedItemColor: Colors.grey, // ← EDIT: Warna tab saat tidak aktif
      type: BottomNavigationBarType.fixed,
      items: const [
        // ── TAB 1: MENU RESTO ──
        BottomNavigationBarItem(
          icon: Icon(Icons.restaurant_menu),
          label: 'Menu Resto', // ← EDIT: Label tab 1
        ),

        // ── TAB 2: PROFIL USER ──
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profil', // ← EDIT: Label tab 2
        ),

        // 💡 JIKA KUIS BESOK MINTA TAB KE-3 (CONTOH KERANJANG/PESANAN):
        // UNCOMMENT (BUKA KOMENTAR) KODE DI BAWAH INI:
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.shopping_bag),
        //   label: 'Pesanan',
        // ),
      ],
    );
  }
}
