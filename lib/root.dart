// ============================================================
// FILE: root.dart
// Fungsi: Halaman "pembungkus" yang berisi BottomNavigationBar
//         Mengatur perpindahan tab Menu ↔ Profil
// Dipakai di: main.dart (sebagai home: RootHalaman())
//
// ALUR DATA DI FILE INI:
//   RootHalaman menyimpan _indeksHalaman
//   → Saat user tekan tab, _indeksHalaman berubah → tampilan berganti
//   → Fungsi _pindahKeMenu() dikirim ke HalamanProfil
//     agar kartu "Menu Resto" di profil bisa pindah ke tab Menu
// ============================================================

// ─── IMPORT WAJIB ─────────────────────────────────────────────
import 'package:flutter/material.dart';
import 'halaman_beranda.dart'; // ← halaman tab pertama (Menu)
import 'halaman_profil.dart';  // ← halaman tab kedua (Profil)

// ════════════════════════════════════════════════════════════════
// CLASS: RootHalaman
// Jenis: StatefulWidget — karena _indeksHalaman bisa berubah
// Fungsi: Container utama yang menampilkan halaman sesuai tab aktif
// ════════════════════════════════════════════════════════════════
class RootHalaman extends StatefulWidget {
  const RootHalaman({super.key});

  @override
  State<RootHalaman> createState() => _RootHalamanState();
}

class _RootHalamanState extends State<RootHalaman> {
  // ════════════════════════════════════════════════════════════
  // ⚠️ DEKLARASI STATE
  // Variabel di sini WAJIB disalin jika kamu copy class ini ke proyek baru
  // ════════════════════════════════════════════════════════════

  // [DEKLARASI] Menyimpan tab/halaman mana yang aktif (0 = Menu, 1 = Profil)
  // Saat nilai ini berubah via setState → Flutter otomatis rebuild tampilan
  int _indeksHalaman = 0;

  // ─── FUNGSI: Pindah ke tab Menu (index 0) ─────────────────────
  // Fungsi ini DIKIRIM ke HalamanProfil sebagai parameter onPindahKeMenu
  // Sehingga saat user klik kartu "Menu Resto" di profil,
  // fungsi ini dipanggil dan tab berpindah ke Menu
  void _pindahKeMenu() {
    setState(() {
      _indeksHalaman = 0; // ← ganti ke index 0 = tab Menu
    });
  }

  @override
  Widget build(BuildContext context) {
    // ─── DEKLARASI: Daftar halaman per tab ────────────────────
    // ⚠️ PERHATIAN saat copy:
    //   Jumlah item di sini HARUS SAMA dengan jumlah items: di BottomNavigationBar bawah
    //   Index 0 = tab pertama, index 1 = tab kedua, dst.
    final List<Widget> daftarHalaman = [
      // [index 0] Halaman tab Menu
      HalamanBeranda(),

      // [index 1] Halaman tab Profil
      // onPindahKeMenu: kirim fungsi _pindahKeMenu ke HalamanProfil
      // agar kartu "Menu Resto" di profil bisa pindah ke sini
      HalamanProfil(onPindahKeMenu: _pindahKeMenu),

      // ← TAMBAH HALAMAN BARU DI SINI jika menambah tab
    ];

    return Scaffold(
      // ─── Tampilkan halaman sesuai tab aktif ───────────────────
      body: daftarHalaman[_indeksHalaman],

      // ══════════════════════════════════════════════════════════
      // WIDGET: BottomNavigationBar
      // Fungsi: Bar navigasi di BAWAH layar
      // ──────────────────────────────────────────────────────────
      // CARA COPY WIDGET INI (nav bar bawah):
      //   1. Salin seluruh blok bottomNavigationBar: BottomNavigationBar(...),
      //      sampai tanda koma penutup di akhir blok
      //   2. Pastikan kamu juga menyalin:
      //      - Deklarasi [int _indeksHalaman = 0;] di atas (di dalam class State)
      //      - List daftarHalaman di dalam build()
      //   3. Keduanya WAJIB ada agar nav bar berfungsi
      // ──────────────────────────────────────────────────────────
      // CARA TAMBAH TAB BARU:
      //   1. Tambah halaman baru di daftarHalaman atas
      //   2. Tambah BottomNavigationBarItem baru di items: bawah
      //   3. Pastikan jumlahnya SAMA
      // CARA EDIT TULISAN TAB: ubah label: 'Menu'
      // CARA EDIT IKON TAB: ubah Icon(Icons.restaurant_menu)
      // ══════════════════════════════════════════════════════════
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indeksHalaman,         // ← tab mana yang aktif sekarang
        selectedItemColor: Color(0xFFE07B39), // ← EDIT: warna tab AKTIF
        unselectedItemColor: Colors.grey,     // ← EDIT: warna tab TIDAK AKTIF
        backgroundColor: Colors.white,        // ← EDIT: warna background bar
        onTap: (indeks) {
          // ← dipanggil saat user tekan salah satu tab
          setState(() {
            _indeksHalaman = indeks; // ← update → tampilan berganti
          });
        },
        // ─── DAFTAR TAB ──────────────────────────────────────────
        items: const [
          // ─── TAB 1: Menu ───────────────────────────────────────
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu), // ← EDIT: ikon
            label: 'Menu',                     // ← EDIT: tulisan tab
          ),
          // ─── TAB 2: Profil ─────────────────────────────────────
          BottomNavigationBarItem(
            icon: Icon(Icons.person),          // ← EDIT: ikon
            label: 'Profil',                   // ← EDIT: tulisan tab
          ),
          // ─── CONTOH TAMBAH TAB KE-3 (hapus // untuk aktifkan): ─
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.history),
          //   label: 'Riwayat',
          // ),
        ],
        // ─── AKHIR DAFTAR TAB ────────────────────────────────────
      ),
      // ─── AKHIR BottomNavigationBar ───────────────────────────
    );
  }
}
