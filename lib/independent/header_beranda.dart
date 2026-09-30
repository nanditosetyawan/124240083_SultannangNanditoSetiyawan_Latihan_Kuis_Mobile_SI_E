import 'package:flutter/material.dart';

// ═════════════════════════════════════════════════════════════════════════════
// FILE: lib/independent/header_beranda.dart
// 📌 FUNGSI: Header Resto / AppBar Beranda (Judul + Icon Keranjang & Logout)
//
// 🎯 LOKASI PASANG DI FILE TUJUAN:
//    Dipasang di file `halaman_beranda.dart` -> pada properti `appBar:` di Scaffold.
//
// ═════════════════════════════════════════════════════════════════════════════
// ❓ JAWABAN SINGKAT: APAKAH COPAS SELURUH FILE ATAU KODENYA SAJA?
//
// 🔹 CARA 1 (COPAS SELURUH FILE 100% - TANPA ADA YANG DIBUANG):
//    1. Buat file baru `lib/independent/header_beranda.dart` di kuis besok.
//    2. COPAS SELURUH ISI FILE INI DARI BARIS 1 SAMPAI BARIS TERAKHIR.
//    3. Di `halaman_beranda.dart`, panggil widget ini pada `Scaffold`:
//       appBar: const HeaderBerandaWidget(judulResto: "NourishBowl"),
//
// 🔹 CARA 2 (JIKA MALAS BUAT FILE BARU - COPAS POTONGAN KODENYA SAJA):
//    Copy HANYA blok di bawah ini (dari AppBar sampai kurung tutup)
//    dan tempel di sebelah `appBar:` pada `halaman_beranda.dart`.
// ═════════════════════════════════════════════════════════════════════════════

class HeaderBerandaWidget extends StatelessWidget implements PreferredSizeWidget {
  final String judulResto;
  final int jumlahKeranjang;
  final VoidCallback? onKlikKeranjang;
  final VoidCallback? onKlikLogout;

  const HeaderBerandaWidget({
    super.key,
    this.judulResto = "NourishBowl",
    this.jumlahKeranjang = 0,
    this.onKlikKeranjang,
    this.onKlikLogout,
  });

  @override
  Widget build(BuildContext context) {
    // ⬇️ ✂️ [POTONGAN KODE - JIKA CARA 2] ✂️ ⬇️
    return AppBar(
      title: Text(
        judulResto, // ← EDIT: Judul Resto
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.green, // ← EDIT: Warna utama AppBar
      elevation: 2,
      centerTitle: false,
      actions: [
        // 1. Icon Keranjang + Badge Angka
        Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: onKlikKeranjang,
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

        // 2. Icon Logout
        IconButton(
          icon: const Icon(Icons.logout, color: Colors.white),
          onPressed: onKlikLogout,
        ),
      ],
    );
    // ⬆️ ✂️ [AKHIR POTONGAN KODE] ⬆️
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
