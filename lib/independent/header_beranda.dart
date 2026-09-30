import 'package:flutter/material.dart';

// ═════════════════════════════════════════════════════════════════════════════
// FILE: lib/independent/header_beranda.dart
// 📌 FUNGSI: Header Resto / AppBar Beranda (Judul + Icon Keranjang & Logout)
//
// 🎯 LOKASI PASANG DI FILE TUJUAN:
//    Di file `halaman_beranda.dart` -> Pada properti `appBar:` di dalam `Scaffold(...)`
//
// ═════════════════════════════════════════════════════════════════════════════
// 📋 DUA CARA PAKAI / COPAS BESOK SAAT KUIS:
//
// ── CARA A (PALING MUDAH - IMPORT CLASS):
//    1. Di atas file `halaman_beranda.dart`, tambahkan:
//       import 'independent/header_beranda.dart';
//    2. Di dalam Scaffold `halaman_beranda.dart`, tulis:
//       appBar: const HeaderBerandaWidget(judulResto: "NourishBowl"),
//
// ── CARA B (COPAS KODE LANGSUNG TANPA IMPORT):
//    Blok & Copy dari `AppBar(` sampai kurung tutup `),` di bawah ini,
//    lalu paste di sebelah `appBar:` pada `Scaffold(...)` di `halaman_beranda.dart`.
// ═════════════════════════════════════════════════════════════════════════════

// ⬇️ ✂️ [MULAI COPAS CARA B - DARI SINI] ✂️ ⬇️
PreferredSizeWidget buatAppBarHeaderBeranda({
  String judulResto = "NourishBowl",
  int jumlahKeranjang = 0,
  VoidCallback? onKlikKeranjang,
  VoidCallback? onKlikLogout,
}) {
  return AppBar(
    // 📌 Judul Resto / Nama Aplikasi
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

    // 📌 Icon Keranjang & Logout di Sebelah Kanan
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
}
// ⬆️ ✂️ [AKHIR COPAS CARA B - SAMPAI SINI] ⬆️


// ─────────────────────────────────────────────────────────────────────────────
// CLASS WIDGET (Bisa langsung dipakai jika menggunakan CARA A)
// ─────────────────────────────────────────────────────────────────────────────
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
    return buatAppBarHeaderBeranda(
      judulResto: judulResto,
      jumlahKeranjang: jumlahKeranjang,
      onKlikKeranjang: onKlikKeranjang,
      onKlikLogout: onKlikLogout,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
