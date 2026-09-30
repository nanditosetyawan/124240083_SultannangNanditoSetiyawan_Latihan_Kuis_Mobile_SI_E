import 'package:flutter/material.dart';

// ═════════════════════════════════════════════════════════════════════════════
// FILE: lib/independent/header_beranda.dart
// TAMPILAN: AppBar / Header Resto (Judul Resto + Tombol Keranjang & Logout)
// KETERKAITAN: Dipakai di `halaman_beranda.dart` pada properti `appBar:`
// METODE COPAS: Copas class `HeaderBerandaWidget` atau isi AppBar ke file baru.
// ═════════════════════════════════════════════════════════════════════════════
//
// ✏️ PETUNJUK EDIT BESOK SAAT KUIS:
// 1. Judul Resto      -> Ganti String "NourishBowl" di baris Text(...)
// 2. Warna Header     -> Ganti `Colors.green` pada `backgroundColor`
// 3. Tambah/Hapus Icon-> Edit list `actions: [...]` di bawah ini
// ═════════════════════════════════════════════════════════════════════════════

class HeaderBerandaWidget extends StatelessWidget implements PreferredSizeWidget {
  final String judulResto;
  final int jumlahKeranjang;
  final VoidCallback? onKlikKeranjang;
  final VoidCallback? onKlikLogout;

  const HeaderBerandaWidget({
    super.key,
    this.judulResto = "NourishBowl", // ← EDIT: Judul Resto default
    this.jumlahKeranjang = 0,         // ← EDIT: Angka badge keranjang
    this.onKlikKeranjang,
    this.onKlikLogout,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // 📌 Judul Resto / Nama Aplikasi
      title: Text(
        judulResto,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.green, // ← EDIT: Warna utama AppBar
      elevation: 2,
      centerTitle: false,

      // 📌 Tombol Aksi di Sebelah Kanan Header (Keranjang & Logout)
      actions: [
        // ── 1. TOMBOL KERANJANG (Dengan Badge Jumlah Item) ──
        Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: onKlikKeranjang ?? () {
                // Aksi saat icon keranjang diklik
              },
            ),
            if (jumlahKeranjang > 0)
              Positioned(
                right: 6,
                top: 6,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '$jumlahKeranjang',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),

        // ── 2. TOMBOL LOGOUT ──
        IconButton(
          icon: const Icon(Icons.logout, color: Colors.white),
          onPressed: onKlikLogout ?? () {
            // Aksi saat icon logout diklik
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
