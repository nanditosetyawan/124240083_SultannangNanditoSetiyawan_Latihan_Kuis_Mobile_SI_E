import 'package:flutter/material.dart';

// ═════════════════════════════════════════════════════════════════════════════
// FILE: lib/independent/bottom_navigation.dart
// 📌 FUNGSI: Bottom Navigation Bar (Tab Menu Resto & Tab Profil)
//
// 🎯 LOKASI PASANG DI FILE TUJUAN:
//    Dipasang di file `root.dart` -> pada properti `bottomNavigationBar:` di Scaffold.
//
// ═════════════════════════════════════════════════════════════════════════════
// ❓ JAWABAN SINGKAT: APAKAH COPAS SELURUH FILE ATAU KODENYA SAJA?
//
// 🔹 CARA 1 (COPAS SELURUH FILE 100% - TANPA ADA YANG DIBUANG):
//    1. Buat file baru `lib/independent/bottom_navigation.dart` di kuis besok.
//    2. COPAS SELURUH ISI FILE INI DARI BARIS 1 SAMPAI BARIS TERAKHIR.
//    3. Di `root.dart`, panggil widget ini pada `Scaffold`:
//       bottomNavigationBar: BottomNavWidget(
//         indeksAktif: _indeksBottomNav,
//         onPindahTab: (indeks) => setState(() => _indeksBottomNav = indeks),
//       ),
//
// 🔹 CARA 2 (JIKA MALAS BUAT FILE BARU - COPAS POTONGAN KODENYA SAJA):
//    Copy HANYA blok di bawah ini (dari BottomNavigationBar sampai kurung tutup)
//    dan tempel di sebelah `bottomNavigationBar:` pada `root.dart`.
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
    // ⬇️ ✂️ [POTONGAN KODE - JIKA CARA 2] ✂️ ⬇️
    return BottomNavigationBar(
      currentIndex: indeksAktif, // ← Indeks tab aktif (0 = Menu, 1 = Profil)
      onTap: onPindahTab,         // ← Callback saat tab diklik untuk pindah layar
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
    // ⬆️ ✂️ [AKHIR POTONGAN KODE] ⬆️
  }
}
