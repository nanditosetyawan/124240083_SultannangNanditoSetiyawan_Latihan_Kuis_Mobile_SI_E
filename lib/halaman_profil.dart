// ============================================================
// FILE: halaman_profil.dart
// Fungsi: Menampilkan halaman profil pelanggan
//         Avatar, nama, dan kartu-kartu fitur yang bisa diklik
// Dipakai di: root.dart → daftarHalaman[1]
//             dipanggil: HalamanProfil(onPindahKeMenu: _pindahKeMenu)
//
// DATA DARI MANA?
//   → Tidak menerima data makanan (tidak butuh FoodItem)
//   → Menerima 1 parameter dari root.dart:
//       onPindahKeMenu = fungsi untuk pindah ke tab Menu
//   → Nama dan peran pelanggan diset langsung di file ini (lihat bagian EDIT)
// ============================================================

// ─── IMPORT WAJIB ─────────────────────────────────────────────
import 'package:flutter/material.dart';
import 'halaman_keranjang.dart'; // ← untuk buka halaman keranjang saat klik Pemesanan

// ════════════════════════════════════════════════════════════════
// CLASS: HalamanProfil
// Jenis: StatelessWidget — tampilan profil tidak berubah-ubah, tidak butuh state
// Fungsi: Menampilkan profil + 2 kartu fitur yang bisa diklik
//
// CARA COPY CLASS INI ke proyek baru:
//   File yang perlu disalin:
//     1. File ini (halaman_profil.dart) — salin seluruh isinya
//     2. halaman_keranjang.dart — karena di-import di sini
//   Dari file lain yang perlu diperhatikan:
//     3. Di root.dart, pastikan HalamanProfil dipanggil dengan:
//        HalamanProfil(onPindahKeMenu: _pindahKeMenu)
// ════════════════════════════════════════════════════════════════
class HalamanProfil extends StatelessWidget {
  // ════════════════════════════════════════════════════════════
  // ⚠️ DEKLARASI PARAMETER
  // Parameter di bawah ini DIKIRIM dari root.dart saat membuat HalamanProfil
  // Kalau kamu copy class ini, WAJIB juga salin parameter ini
  // ════════════════════════════════════════════════════════════

  // [DEKLARASI] Fungsi yang dikirim dari root.dart
  // Saat dipanggil → tab berpindah ke Menu (index 0)
  // onPindahKeMenu bersifat opsional (ada tanda ?, jadi boleh null)
  final VoidCallback? onPindahKeMenu;

  const HalamanProfil({super.key, this.onPindahKeMenu});

  // ════════════════════════════════════════════════════════════
  // EDIT DI SINI: Ganti nama dan peran pelanggan
  // ════════════════════════════════════════════════════════════
  static const String namaPelanggan = 'Dito';          // ← EDIT: nama kamu
  static const String peranPelanggan = 'BOS Hotel';    // ← EDIT: role/jabatan

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F4EE), // ← EDIT: warna background halaman

      // ══════════════════════════════════════════════════════════
      // WIDGET: AppBar
      // Fungsi: Bar judul di atas halaman
      // CARA COPY: Salin seluruh blok appBar: AppBar(...),
      //            tidak ada kode tambahan di file lain
      // ══════════════════════════════════════════════════════════
      appBar: AppBar(
        title: Text(
          'Profil',                          // ← EDIT: judul halaman
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFFE07B39), // ← EDIT: warna AppBar
        centerTitle: true,
        automaticallyImplyLeading: false,   // ← hilangkan tombol back (ini halaman tab)
      ),
      // ─── AKHIR AppBar ─────────────────────────────────────────

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // ← semua konten di tengah horizontal

          children: [
            SizedBox(height: 30),

            // ══════════════════════════════════════════════════════
            // WIDGET: CircleAvatar (foto profil bulat)
            // Fungsi: Menampilkan avatar/foto dalam bentuk lingkaran
            // ──────────────────────────────────────────────────────
            // CARA COPY WIDGET INI (avatar bulat):
            //   Salin blok CircleAvatar(...) di bawah ini
            //   Tidak ada kode di file lain yang perlu disalin
            // ══════════════════════════════════════════════════════
            CircleAvatar(
              radius: 60,                           // ← EDIT: ukuran lingkaran (makin besar = makin besar)
              backgroundColor: Color(0xFFF5CBA7),   // ← EDIT: warna background lingkaran
              child: Icon(
                Icons.person,                       // ← EDIT: ganti ikon (atau pakai Image.network)
                size: 70,                           // ← EDIT: ukuran ikon dalam lingkaran
                color: Color(0xFFE07B39),           // ← EDIT: warna ikon
              ),
            ),
            // ─── AKHIR CircleAvatar ───────────────────────────────

            SizedBox(height: 20),

            // ══════════════════════════════════════════════════════
            // WIDGET: Text nama pelanggan
            // DATA DARI MANA? → dari variabel static namaPelanggan di atas (baris 49)
            // CARA COPY: Salin blok Text(...) ini saja, tidak ada kode di file lain
            // ══════════════════════════════════════════════════════
            Text(
              namaPelanggan,                // ← tampilkan nama (EDIT: ubah di baris 49)
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                letterSpacing: 1.2,         // ← jarak antar huruf
              ),
            ),
            // ─── AKHIR Nama ───────────────────────────────────────

            SizedBox(height: 6),

            // ── Peran/jabatan pelanggan ────────────────────────────
            // DATA DARI MANA? → dari variabel static peranPelanggan di atas (baris 50)
            Text(
              peranPelanggan,               // ← tampilkan peran (EDIT: ubah di baris 50)
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            // ─── AKHIR Peran ──────────────────────────────────────

            SizedBox(height: 40),

            // ══════════════════════════════════════════════════════
            // WIDGET: Kartu "Menu Resto" yang BISA DIKLIK
            // Fungsi: Saat diklik → pindah ke tab Menu (index 0)
            // ──────────────────────────────────────────────────────
            // CARA COPY WIDGET INI (1 kartu yang bisa diklik):
            //   Salin seluruh blok GestureDetector di bawah ini
            //   sampai // ─── AKHIR Kartu Menu Resto
            //   Yang perlu dari file lain:
            //   → Fungsi onPindahKeMenu dari root.dart (sudah ada di parameter class ini)
            //   → Widget _KartuInfo di bawah (sudah ada di file ini, tidak perlu copy lagi)
            // ══════════════════════════════════════════════════════
            GestureDetector(
              // onTap dipanggil saat user menekan kartu ini
              onTap: () {
                // Panggil fungsi yang dikirim dari root.dart
                // Fungsi ini mengubah _indeksHalaman = 0 di root.dart → pindah ke tab Menu
                if (onPindahKeMenu != null) {
                  onPindahKeMenu!(); // ← ! = pastikan tidak null baru dipanggil
                }
              },
              // _KartuInfo adalah widget helper di bawah file ini
              // DATA DIKIRIM KE _KartuInfo: ikon, judul, deskripsi
              child: _KartuInfo(
                ikon: Icons.restaurant,               // ← EDIT: ikon kartu
                judul: 'Menu Resto',                  // ← EDIT: judul kartu
                deskripsi: 'Pesan makanan favorit Anda dengan mudah.', // ← EDIT: deskripsi
              ),
            ),
            // ─── AKHIR Kartu Menu Resto ───────────────────────────

            SizedBox(height: 12),

            // ══════════════════════════════════════════════════════
            // WIDGET: Kartu "Pemesanan" yang BISA DIKLIK
            // Fungsi: Saat diklik → buka halaman keranjang (HalamanKeranjang)
            // ──────────────────────────────────────────────────────
            // CARA COPY WIDGET INI (1 kartu yang bisa diklik buka halaman baru):
            //   Salin seluruh blok GestureDetector di bawah ini
            //   sampai // ─── AKHIR Kartu Pemesanan
            //   Yang perlu dari file lain:
            //   → Import halaman_keranjang.dart (sudah ada di import atas file ini)
            //   → Widget _KartuInfo di bawah (sudah ada di file ini)
            // ══════════════════════════════════════════════════════
            GestureDetector(
              onTap: () {
                // Navigator.push = buka halaman baru di atas halaman ini
                // User bisa kembali dengan tombol back
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HalamanKeranjang(), // ← EDIT: ganti halaman tujuan
                  ),
                );
              },
              child: _KartuInfo(
                ikon: Icons.receipt_long,             // ← EDIT: ikon kartu
                judul: 'Pemesanan',                   // ← EDIT: judul kartu
                deskripsi: 'Jumlah dan harga dihitung otomatis.', // ← EDIT: deskripsi
              ),
            ),
            // ─── AKHIR Kartu Pemesanan ────────────────────────────

            // ─── TAMBAH KARTU BARU: Copy salah satu blok GestureDetector di atas ─
          ],
        ),
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════════
// WIDGET HELPER: _KartuInfo
// Fungsi: Menampilkan satu kartu berisi ikon + judul + deskripsi
// Jenis: StatelessWidget — tidak ada state, hanya tampilan statis
//
// DATA DARI MANA?
//   → Dipanggil dari HalamanProfil (di atas, dalam Widget build)
//   → Contoh pemanggilan:
//       _KartuInfo(
//         ikon: Icons.restaurant,
//         judul: 'Menu Resto',
//         deskripsi: 'Pesan makanan favorit Anda dengan mudah.',
//       )
//   → Setiap properti (ikon, judul, deskripsi) diisi saat memanggil _KartuInfo
//   → _KartuInfo TIDAK mengambil data dari file lain atau dari database
//
// CARA COPY WIDGET INI (widget kartu info):
//   1. Salin seluruh class _KartuInfo {...} di bawah ini ke file tujuan
//   2. Tidak ada kode di file lain yang perlu disalin untuk widget ini
//   3. Untuk MEMANGGIL-nya, pakai: _KartuInfo(ikon: ..., judul: ..., deskripsi: ...)
// ════════════════════════════════════════════════════════════════
class _KartuInfo extends StatelessWidget {
  // ════════════════════════════════════════════════════════════
  // ⚠️ DEKLARASI PARAMETER _KartuInfo
  // Ketiga parameter ini WAJIB diisi saat memanggil _KartuInfo(...)
  // SUMBER DATA: diisi langsung saat pemanggilan di HalamanProfil
  // ════════════════════════════════════════════════════════════

  // [DEKLARASI] Ikon yang ditampilkan di kotak oranye kiri
  // Contoh: Icons.restaurant, Icons.person, Icons.receipt_long
  final IconData ikon;

  // [DEKLARASI] Teks judul besar di kartu
  final String judul;

  // [DEKLARASI] Teks deskripsi kecil di bawah judul
  final String deskripsi;

  // Constructor: cara membuat _KartuInfo dengan ketiga parameter wajib
  const _KartuInfo({
    required this.ikon,       // ← required = wajib diisi
    required this.judul,
    required this.deskripsi,
  });

  @override
  Widget build(BuildContext context) {
    // ══════════════════════════════════════════════════════════
    // WIDGET: Container (kotak kartu info)
    // ──────────────────────────────────────────────────────────
    // CARA COPY WIDGET INI (kotak kartu termasuk isi):
    //   Salin blok Container di bawah ini sampai // ─── AKHIR Container
    //   Yang perlu dari file lain:
    //   → TIDAK ADA — semua sudah ada di dalam blok ini
    //   → Data (ikon, judul, deskripsi) otomatis dari parameter di atas
    // ══════════════════════════════════════════════════════════
    return Container(
      // [STYLE KOTAK KARTU] ← salin bagian ini jika mau kotak serupa
      padding: EdgeInsets.all(16),              // ← EDIT: jarak dalam kartu
      decoration: BoxDecoration(
        color: Colors.white,                    // ← EDIT: warna background kartu
        borderRadius: BorderRadius.circular(12),// ← EDIT: sudut membulat kartu
        boxShadow: [
          BoxShadow(
            color: Colors.black12,              // ← warna bayangan (hitam transparan)
            blurRadius: 4,                      // ← EDIT: keburaman bayangan
            offset: Offset(0, 2),              // ← EDIT: arah bayangan (x=kanan, y=bawah)
          ),
        ],
      ),
      // [AKHIR STYLE KOTAK KARTU]

      // ── Isi kartu: Row berisi [kotak ikon] + [teks] ─────────
      // Row = susun widget ke samping (horizontal)
      child: Row(
        children: [
          // ══════════════════════════════════════════════════════
          // WIDGET: Kotak ikon oranye di kiri
          // DATA DARI MANA? → ikon diambil dari parameter 'ikon' di atas
          // CARA COPY: Salin blok Container ini sampai // ─ AKHIR Kotak Ikon
          // ══════════════════════════════════════════════════════
          Container(
            padding: EdgeInsets.all(10),          // ← EDIT: jarak dalam kotak ikon
            decoration: BoxDecoration(
              color: Color(0xFFF5CBA7),           // ← EDIT: warna background kotak ikon
              borderRadius: BorderRadius.circular(8), // ← EDIT: sudut kotak ikon
            ),
            child: Icon(
              ikon,                               // ← ikon dari parameter (tidak perlu edit)
              color: Color(0xFFE07B39),           // ← EDIT: warna ikon
              size: 24,                           // ← EDIT: ukuran ikon
            ),
          ),
          // ─── AKHIR Kotak Ikon ────────────────────────────────

          SizedBox(width: 16), // ← jarak antara ikon dan teks

          // ══════════════════════════════════════════════════════
          // WIDGET: Teks judul + deskripsi
          // DATA DARI MANA? → judul & deskripsi dari parameter di atas
          // CARA COPY: Salin blok Expanded ini sampai // ─ AKHIR Teks
          // ══════════════════════════════════════════════════════
          Expanded(
            // Expanded = mengisi sisa lebar yang tersedia di Row
            // Tanpa ini, teks bisa overflow ke luar layar
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // ← rata kiri
              children: [
                // ── Judul kartu ─────────────────────────────────
                Text(
                  judul,                          // ← dari parameter (tidak perlu edit)
                  style: TextStyle(
                    fontSize: 16,                 // ← EDIT: ukuran font judul
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,        // ← EDIT: warna judul
                  ),
                ),
                SizedBox(height: 4),
                // ── Deskripsi kartu ─────────────────────────────
                Text(
                  deskripsi,                      // ← dari parameter (tidak perlu edit)
                  style: TextStyle(
                    fontSize: 12,                 // ← EDIT: ukuran font deskripsi
                    color: Colors.grey,           // ← EDIT: warna deskripsi
                  ),
                ),
              ],
            ),
          ),
          // ─── AKHIR Teks ──────────────────────────────────────
        ],
      ),
    );
    // ─── AKHIR Container ──────────────────────────────────────
  }
}
