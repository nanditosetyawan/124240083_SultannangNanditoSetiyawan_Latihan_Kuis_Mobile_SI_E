import 'package:flutter/material.dart';

// ═════════════════════════════════════════════════════════════════════════════
// FILE: lib/independent/bottom_navigation.dart
// 📌 FUNGSI: Bottom Navigation Bar (Tab Menu Resto & Tab Profil)
//
// 🎯 LOKASI PASANG DI FILE TUJUAN:
//    Di file `root.dart` -> Pada properti `bottomNavigationBar:` di dalam `Scaffold(...)`
//
// ═════════════════════════════════════════════════════════════════════════════
// 📋 DUA CARA PAKAI / COPAS BESOK SAAT KUIS:
//
// ── CARA A (PALING MUDAH - IMPORT CLASS):
//    1. Di atas file `root.dart`, tambahkan:
//       import 'independent/bottom_navigation.dart';
//    2. Di dalam Scaffold `root.dart`, tulis:
//       bottomNavigationBar: BottomNavWidget(
//         indeksAktif: _indeksBottomNav,
//         onPindahTab: (indeks) => setState(() => _indeksBottomNav = indeks),
//       ),
//
// ── CARA B (COPAS KODE LANGSUNG TANPA IMPORT CLASS):
//    TIDAK PERLU copas seluruh file atau class `@override`!
//    CUKUP BLOK & COPY dari `BottomNavigationBar(` sampai `),` di bawah ini,
//    lalu PASTE tepat di sebelah `bottomNavigationBar:` pada `Scaffold(...)` di `root.dart`.
// ═════════════════════════════════════════════════════════════════════════════

// ⬇️ ✂️ [MULAI COPAS CARA B - DARI SINI] ✂️ ⬇️
Widget buatBottomNavigationBar({
  required int indeksAktif,
  required Function(int) onPindahTab,
}) {
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
}
// ⬆️ ✂️ [AKHIR COPAS CARA B - SAMPAI SINI] ⬆️


// ─────────────────────────────────────────────────────────────────────────────
// CLASS WIDGET (Bisa langsung dipakai jika menggunakan CARA A)
// ─────────────────────────────────────────────────────────────────────────────
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
    return buatBottomNavigationBar(
      indeksAktif: indeksAktif,
      onPindahTab: onPindahTab,
    );
  }
}
