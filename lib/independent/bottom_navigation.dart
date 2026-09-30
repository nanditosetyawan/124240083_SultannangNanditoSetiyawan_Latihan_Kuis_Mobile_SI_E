import 'package:flutter/material.dart';

// ══════════════════════════════════════════════════════════════════════════════
// FILE: lib/independent/bottom_navigation.dart
// 📌 FUNGSI: Bottom Navigation Bar (Tab Menu Resto & Tab Profil)
//
// ══════════════════════════════════════════════════════════════════════════════
// 📋 2 CARA PAKAI SAAT KUIS:
//
// 🔹 CARA 1 (COPAS SELURUH FILE 100%):
//    1. Buat file baru `lib/independent/bottom_navigation.dart` di project kuis.
//    2. COPAS SELURUH ISI FILE INI DARI BARIS 1 SAMPAI BARIS TERAKHIR.
//    3. Di `root.dart`, tambah import dan panggil:
//
//       import 'independent/bottom_navigation.dart';
//       ...
//       bottomNavigationBar: BottomNavWidget(
//         indeksAktif: _indeksHalaman,
//         onPindahTab: (indeks) => setState(() => _indeksHalaman = indeks),
//       ),
//
// ══════════════════════════════════════════════════════════════════════════════
// 🔹 CARA 2 (COPAS POTONGAN KODE LANGSUNG KE root.dart TANPA BUAT FILE BARU):
//
//  Saat kuis, template StatefulWidget kosong yang dibuat VS Code seperti ini:
//
//  class _RootHalamanState extends State<RootHalaman> {
//    int _indeksHalaman = 0;  ← WAJIB ADA variabel ini
//
//    @override
//    Widget build(BuildContext context) {
//      return Scaffold(
//
//        body: ...,             ← isi layar utama
//
//        bottomNavigationBar:   ← TEMPEL KODE DI SEBELAH KANAN TITIK DUA INI!
//          BottomNavigationBar( ← ✂️ MULAI COPAS DARI SINI
//            ...
//          ),                   ← ✂️ SAMPAI TANDA KOMA INI
//
//      );
//    }
//  }
//
//  JADI: Kata "bottomNavigationBar:" SUDAH ADA DI root.dart.
//        Yang Anda copas dari file ini HANYA: BottomNavigationBar( ... ),
//        tanpa kata "return" dan tanpa kata "bottomNavigationBar:".
// ══════════════════════════════════════════════════════════════════════════════

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

    // ✂️ MULAI COPAS CARA 2 DARI SINI (tanpa kata 'return' di atas)
    BottomNavigationBar(
      currentIndex: indeksAktif,          // ← Angka tab yang aktif
      onTap: onPindahTab,                  // ← Callback pindah tab
      selectedItemColor: Colors.green,    // ← EDIT: Warna tab aktif
      unselectedItemColor: Colors.grey,   // ← EDIT: Warna tab nonaktif
      type: BottomNavigationBarType.fixed,
      items: const [

        // ── TAB 1 ──
        BottomNavigationBarItem(
          icon: Icon(Icons.restaurant_menu),
          label: 'Menu Resto',            // ← EDIT: Label tab 1
        ),

        // ── TAB 2 ──
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profil',               // ← EDIT: Label tab 2
        ),

        // 💡 TAB KE-3 (jika kuis butuh): Buka komentar di bawah ini
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.shopping_bag),
        //   label: 'Pesanan',
        // ),

      ],
    );
    // ✂️ AKHIR COPAS CARA 2 SAMPAI SINI
  }
}
