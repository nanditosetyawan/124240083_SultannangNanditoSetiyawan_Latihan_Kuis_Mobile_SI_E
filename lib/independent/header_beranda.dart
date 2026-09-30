import 'package:flutter/material.dart';

// ═════════════════════════════════════════════════════════════════════════════
// FILE: lib/independent/header_beranda.dart
// 📌 FUNGSI: Header Resto / AppBar Beranda (Judul + Icon Keranjang & Logout)
//
// 🎯 LOKASI TEMPEL DI FILE TUJUAN (`halaman_beranda.dart`):
//    Di file `halaman_beranda.dart` -> Pada properti `appBar:` di Scaffold.
//
// ═════════════════════════════════════════════════════════════════════════════
// ❓ JAWABAN SINGKAT: APAKAH KATA 'return' DICOPAS?
// ❌ TIDAK! Kata 'return' TIDAK PERLU DICOPAS!
//    Cukup copas dari `AppBar(` sampai kurung tutup `)` saja.
//
// 📌 CONTOH TEMPEL DI `halaman_beranda.dart`:
//    Scaffold(
//      appBar: AppBar( ← TEMPEL DI SINI SEBELAH KANAN appBar:
//        title: Text("NourishBowl"),
//        backgroundColor: Colors.green,
//        actions: [ ... ],
//      ),
//      body: ...,
//    )
// ═════════════════════════════════════════════════════════════════════════════
// 📋 2 CARA PAKAI SAAT KUIS:
//
// 🔹 CARA 1 (COPAS SELURUH FILE 100% - TANPA MEMUTUS KODE):
//    1. Buat file baru `lib/independent/header_beranda.dart` di project kuis.
//    2. COPAS SELURUH ISI FILE INI DARI BARIS 1 SAMPAI BARIS TERAKHIR.
//    3. Di `halaman_beranda.dart`, panggil:
//       appBar: const HeaderBerandaWidget(judulResto: "NourishBowl"),
//
// 🔹 CARA 2 (JIKA TAMPILKAN LANGSUNG DI HALAMAN_BERANDA.DART TANPA BUAT FILE BARU):
//    Copas HANYA blok di bawah ini (Mulai dari `AppBar(` sampai `)`).
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
    return 

    // ⬇️ ✂️ [MULAI COPAS CARA 2 - DARI SINI (KATA 'return' DI ATAS JANGAN DICOPAS)] ✂️ ⬇️
    AppBar(
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
    // ⬆️ ✂️ [AKHIR COPAS CARA 2 - SAMPAI SINI] ⬆️
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
