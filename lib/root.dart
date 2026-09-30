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
  // Ini adalah SETTING PENENTU halaman apa yang sedang dibuka.
  // Jika nilainya 0 -> Buka index 0 di daftarHalaman
  // Jika nilainya 1 -> Buka index 1 di daftarHalaman
  int _indeksHalaman = 0; 

  // ── FUNGSI: Dipanggil dari HalamanProfil saat klik tombol "Menu Resto" ────
  void _pindahKeMenu() {
    setState(() { _indeksHalaman = 0; });
  }

  @override
  Widget build(BuildContext context) {

    // ── DAFTAR HALAMAN (HUBUNGAN TAB DENGAN FILE HALAMAN) ─────────────────────
    // ❓ TANYA: "Bagaimana tahu profil mengarah ke halaman_profil.dart?"
    // 💡 JAWAB: Di sinilah setting-nya! 
    // Kita mendaftarkan file yang sudah di-import di atas ke dalam sebuah List.
    // Urutannya (index) harus sama dengan urutan di BottomNavigationBarItem.
    final daftarHalaman = <Widget>[
      HalamanBeranda(),                             // Index 0: Akan tampil jika tab pertama diklik
      HalamanProfil(onPindahKeMenu: _pindahKeMenu), // Index 1: Akan tampil jika tab kedua diklik
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
        // 1. currentIndex membaca _indeksHalaman (0 atau 1)
        currentIndex: _indeksHalaman,              // ← angka tab yg aktif
        selectedItemColor: Color(0xFFE07B39),      // ← EDIT: warna tab aktif
        unselectedItemColor: Colors.grey,          // ← EDIT: warna tab nonaktif
        backgroundColor: Colors.white,

        // 2. onTap mengubah _indeksHalaman sesuai tombol yang diklik
        // Jika klik "Profil" (tombol ke-2), maka `indeks` bernilai 1.
        // setState mengubah _indeksHalaman jadi 1, layar di-refresh.
        // Scaffold body akan memanggil daftarHalaman[1] (HalamanProfil).
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
