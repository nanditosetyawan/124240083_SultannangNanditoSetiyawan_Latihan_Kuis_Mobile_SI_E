// ══════════════════════════════════════════════════════════════════════════════
// FILE: root.dart
// FUNGSI: Pembungkus utama + Bottom Navigation Bar
// Import di: main.dart -> home: RootHalaman()
// ══════════════════════════════════════════════════════════════════════════════
//
// ❓ PANDUAN UNTUK KUIS BESOK (MULAI DARI FILE KOSONG TEMPLATE STATEFULWIDGET):
//
// Saat kuis nanti, VS Code beri template default seperti ini:
//
//   import 'package:flutter/material.dart';
//
//   class NamaHalaman extends StatefulWidget {
//     const NamaHalaman({super.key});
//     @override
//     State<NamaHalaman> createState() => _NamaHalamanState();
//   }
//
//   class _NamaHalamanState extends State<NamaHalaman> {
//     @override
//     Widget build(BuildContext context) {
//       return Scaffold(         ← DI DALAM return Scaffold( inilah semua widget ditempel
//
//       );                      ← Kurung tutup Scaffold
//     }
//   }
//
// CARA MEMAKAI FILE INI (root.dart) SEBAGAI REFERENSI:
//   1. Lihat kode di bawah ini.
//   2. Sesuaikan nama class, nama variabel, dan nama halaman.
//   3. Widget seperti BottomNavigationBar, body, dll ditempatkan DALAM Scaffold().
//
// ══════════════════════════════════════════════════════════════════════════════

import 'package:flutter/material.dart';
import 'halaman_beranda.dart';
import 'halaman_profil.dart';

class RootHalaman extends StatefulWidget {
  const RootHalaman({super.key});
  @override
  State<RootHalaman> createState() => _RootHalamanState();
}

class _RootHalamanState extends State<RootHalaman> {

  // ── VARIABEL: Tab mana yang aktif sekarang ────────────────────────────────
  int _indeksHalaman = 0; // 0 = Menu Resto, 1 = Profil

  // ── FUNGSI: Dipanggil dari HalamanProfil saat klik tombol "Menu Resto" ────
  void _pindahKeMenu() {
    setState(() { _indeksHalaman = 0; });
  }

  @override
  Widget build(BuildContext context) {

    // ── DAFTAR HALAMAN per Tab ────────────────────────────────────────────────
    final daftarHalaman = <Widget>[
      HalamanBeranda(),                             // index 0 = Tab Menu
      HalamanProfil(onPindahKeMenu: _pindahKeMenu), // index 1 = Tab Profil
    ];

    // ════════════════════════════════════════════════════════════════════════
    // TEMPLATE SCAFFOLD LENGKAP
    // Semua widget (body, bottomNavigationBar, appBar, dll)
    // ditempel SEBAGAI PROPERTI DI DALAM Scaffold( ... )
    // ════════════════════════════════════════════════════════════════════════
    return Scaffold(

      // ── body: Halaman yang tampil sesuai tab aktif ─────────────────────────
      body: daftarHalaman[_indeksHalaman],


      // ══════════════════════════════════════════════════════════════════════
      // bottomNavigationBar: Bar Navigasi Bawah
      //
      // ❓ CARA 2 - NEMPEL KODE BOTTOM NAV DI SINI (DARI INDEPENDENT/):
      //    Tempel MULAI DARI "BottomNavigationBar(" sampai kurung tutup "),"
      //    TEPAT DI SEBELAH KANAN "bottomNavigationBar:" seperti contoh berikut:
      //
      //    bottomNavigationBar: BottomNavigationBar(    ← tempel mulai dari sini
      //      currentIndex: _indeksHalaman,
      //      onTap: (indeks) {
      //        setState(() { _indeksHalaman = indeks; });
      //      },
      //      items: const [ ... ],
      //    ),                                           ← sampai tanda koma ini
      //
      // ══════════════════════════════════════════════════════════════════════
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indeksHalaman,              // ← angka tab yg aktif
        selectedItemColor: Color(0xFFE07B39),      // ← EDIT: warna tab aktif
        unselectedItemColor: Colors.grey,          // ← EDIT: warna tab nonaktif
        backgroundColor: Colors.white,
        onTap: (indeks) {
          setState(() { _indeksHalaman = indeks; }); // ← pindah tab
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),     // ← EDIT: ikon tab 1
            label: 'Menu',                         // ← EDIT: label tab 1
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),              // ← EDIT: ikon tab 2
            label: 'Profil',                       // ← EDIT: label tab 2
          ),
        ],
      ),

    ); // ← KURUNG TUTUP Scaffold
  }
}
