// ═══════════════════════════════════════════════════════════
// FILE: halaman_profil.dart
// Fungsi: Halaman profil user (avatar, nama, tombol menu & pemesanan)
// Import di: root.dart → daftarHalaman[1]
// Parameter: onPindahKeMenu (fungsi dari root.dart untuk pindah tab)
// ═══════════════════════════════════════════════════════════
import 'package:flutter/material.dart';
import 'halaman_keranjang.dart';

class HalamanProfil extends StatelessWidget {
  final VoidCallback? onPindahKeMenu; // ← VARIABEL: fungsi pindah tab, dikirim dari root.dart

  const HalamanProfil({super.key, this.onPindahKeMenu});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F4EE),










      // ═══ [APPBAR-PROFIL] ═════════════════════════════════
      // Tampilan: Bar oranye atas bertuliskan "Profil"
      // ═════════════════════════════════════════════════════
      appBar: AppBar(
        title: Text('Profil',                  // ← VARIABEL: judul halaman
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Color(0xFFE07B39),
        centerTitle: true,
        automaticallyImplyLeading: false,       // ← hilangkan tombol back
      ),
      // ═══ AKHIR [APPBAR-PROFIL] ═══════════════════════════










      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),










            // ═══ [FOTO-PROFIL-BULAT] ═══════════════════════
            // Tampilan: Lingkaran oranye muda dengan ikon orang di tengah
            // Copas: Ambil dari CircleAvatar sampai AKHIR FOTO-PROFIL-BULAT
            // ════════════════════════════════════════════════
            CircleAvatar(
              radius: 60,                              // ← VARIABEL: ukuran lingkaran
              backgroundColor: Color(0xFFF5CBA7),      // ← VARIABEL: warna background lingkaran
              child: Icon(Icons.person, size: 70,       // ← VARIABEL: ikon profil
                color: Color(0xFFE07B39)),              // ← VARIABEL: warna ikon
            ),
            // ═══ AKHIR [FOTO-PROFIL-BULAT] ═════════════════










            SizedBox(height: 20),










            // ═══ [NAMA-PROFIL] ═════════════════════════════
            // Tampilan: Nama besar + jabatan kecil abu di bawahnya
            // Copas: Ambil dari Text nama sampai AKHIR NAMA-PROFIL
            // ════════════════════════════════════════════════
            Text('Dito',                               // ← VARIABEL: nama user
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87, letterSpacing: 1.2)),
            SizedBox(height: 6),
            Text('BOS Hotel',                          // ← VARIABEL: jabatan/peran
              style: TextStyle(fontSize: 14, color: Colors.grey)),
            // ═══ AKHIR [NAMA-PROFIL] ═══════════════════════










            SizedBox(height: 40),










            // ═══ [TOMBOL-MENU-RESTO] ═══════════════════════
            // Tampilan: Kartu putih ikon garpu + "Menu Resto"
            // Aksi saat diklik: Pindah ke tab Menu (index 0)
            // Copas: Ambil dari GestureDetector sampai AKHIR TOMBOL-MENU-RESTO
            // Syarat: Butuh parameter onPindahKeMenu dari root.dart
            // ════════════════════════════════════════════════
            GestureDetector(
              onTap: () { if (onPindahKeMenu != null) onPindahKeMenu!(); },
              child: _KartuTombol(
                ikon: Icons.restaurant,                // ← VARIABEL: ikon
                judul: 'Menu Resto',                   // ← VARIABEL: judul kartu
                deskripsi: 'Pesan makanan favorit Anda dengan mudah.', // ← VARIABEL: deskripsi
              ),
            ),
            // ═══ AKHIR [TOMBOL-MENU-RESTO] ═════════════════










            SizedBox(height: 12),










            // ═══ [TOMBOL-PEMESANAN] ════════════════════════
            // Tampilan: Kartu putih ikon nota + "Pemesanan"
            // Aksi saat diklik: Buka halaman keranjang (Navigator.push)
            // Copas: Ambil dari GestureDetector sampai AKHIR TOMBOL-PEMESANAN
            // Syarat: Butuh import halaman_keranjang.dart di atas file
            // ════════════════════════════════════════════════
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (_) => HalamanKeranjang()));
              },
              child: _KartuTombol(
                ikon: Icons.receipt_long,               // ← VARIABEL: ikon
                judul: 'Pemesanan',                     // ← VARIABEL: judul kartu
                deskripsi: 'Jumlah dan harga dihitung otomatis.', // ← VARIABEL: deskripsi
              ),
            ),
            // ═══ AKHIR [TOMBOL-PEMESANAN] ══════════════════










          ],
        ),
      ),
    );
  }
}










// ═══ [KARTU-TOMBOL] ════════════════════════════════════════
// Tampilan: Kotak putih dengan ikon oranye (kiri) + judul & deskripsi (kanan)
// Dipakai oleh: TOMBOL-MENU-RESTO dan TOMBOL-PEMESANAN di atas
// Copas: Ambil seluruh class _KartuTombol jika butuh kartu ikon+teks
// ════════════════════════════════════════════════════════════
class _KartuTombol extends StatelessWidget {
  final IconData ikon;     // ← data ikon dikirim saat memanggil
  final String judul;      // ← data judul dikirim saat memanggil
  final String deskripsi;  // ← data deskripsi dikirim saat memanggil

  const _KartuTombol({required this.ikon, required this.judul, required this.deskripsi});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFFF5CBA7),                // ← VARIABEL: warna bg ikon
              borderRadius: BorderRadius.circular(8)),
            child: Icon(ikon, color: Color(0xFFE07B39), size: 24),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(judul, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
                SizedBox(height: 4),
                Text(deskripsi, style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// ═══ AKHIR [KARTU-TOMBOL] ══════════════════════════════════
