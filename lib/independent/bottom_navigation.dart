import 'package:flutter/material.dart';

// ═════════════════════════════════════════════════════════════════════════════
// FILE: lib/independent/bottom_navigation.dart
// 📌 FUNGSI: Bottom Navigation Bar (Tab Menu Resto & Tab Profil)
//
// 🎯 LOKASI TEMPEL DI FILE TUJUAN (`root.dart`):
//    Di file `root.dart` -> Pada properti `bottomNavigationBar:` di Scaffold.
//
// ═════════════════════════════════════════════════════════════════════════════
// ❓ JAWABAN SINGKAT: APAKAH KATA 'return' DICOPAS?
// ❌ TIDAK! Kata 'return' TIDAK PERLU DICOPAS!
//    Cukup copas dari `BottomNavigationBar(` sampai kurung tutup `)` saja.
//
// 📌 CONTOH TEMPEL DI `root.dart`:
//    Scaffold(
//      body: ...,
//      bottomNavigationBar: BottomNavigationBar( ← TEMPEL DI SINI
//        currentIndex: _indeksBottomNav,
//        onTap: (indeks) => setState(() => _indeksBottomNav = indeks),
//        items: const [ ... ],
//      ),
//    )
// ═════════════════════════════════════════════════════════════════════════════
// 📋 2 CARA PAKAI SAAT KUIS:
//
// 🔹 CARA 1 (COPAS SELURUH FILE 100% - TANPA MEMUTUS KODE):
//    1. Buat file baru `lib/independent/bottom_navigation.dart` di project kuis.
//    2. COPAS SELURUH ISI FILE INI DARI BARIS 1 SAMPAI BARIS TERAKHIR.
//    3. Di `root.dart`, panggil:
//       bottomNavigationBar: BottomNavWidget(
//         indeksAktif: _indeksBottomNav,
//         onPindahTab: (indeks) => setState(() => _indeksBottomNav = indeks),
//       ),
//
// 🔹 CARA 2 (JIKA TAMPILKAN LANGSUNG DI ROOT.DART TANPA BUAT FILE BARU):
//    Copas HANYA blok di bawah ini (Mulai dari `BottomNavigationBar(` sampai `)`).
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
    return 
    
    // ⬇️ ✂️ [MULAI COPAS CARA 2 - DARI SINI (KATA 'return' DI ATAS JANGAN DICOPAS)] ✂️ ⬇️
    BottomNavigationBar(
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
    // ⬆️ ✂️ [AKHIR COPAS CARA 2 - SAMPAI SINI] ⬆️
  }
}
