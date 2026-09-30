import 'package:flutter/material.dart';

// ═════════════════════════════════════════════════════════════════════════════
// FILE: lib/independent/tombol_menu_profil.dart
// 📌 FUNGSI: List Tombol Navigasi Halaman Profil (Menu Resto, Keranjang, dll)
//
// 🎯 LOKASI TEMPEL DI FILE TUJUAN (`halaman_profil.dart`):
//    Di file `halaman_profil.dart` -> Di bawah Header Profil pada `Column(children: [...])`.
//
// ═════════════════════════════════════════════════════════════════════════════
// ❓ JAWABAN SINGKAT: APAKAH KATA 'return' DICOPAS?
// ❌ TIDAK! Kata 'return' TIDAK PERLU DICOPAS!
//    Cukup copas dari `Column(` sampai kurung tutup `)` saja.
//
// 📌 CONTOH TEMPEL DI `halaman_profil.dart`:
//    Column(
//      children: [
//        HeaderProfilWidget(...),
//        SizedBox(height: 16),
//        Column( ← TEMPEL DI SINI DI DALAM CHILDREN COLUMN
//          children: [ Card(...), Card(...) ],
//        ),
//      ],
//    )
// ═════════════════════════════════════════════════════════════════════════════
// 📋 2 CARA PAKAI SAAT KUIS:
//
// 🔹 CARA 1 (COPAS SELURUH FILE 100% - TANPA MEMUTUS KODE):
//    1. Buat file baru `lib/independent/tombol_menu_profil.dart` di project kuis.
//    2. COPAS SELURUH ISI FILE INI DARI BARIS 1 SAMPAI BARIS TERAKHIR.
//    3. Di `halaman_profil.dart`, panggil:
//       TombolMenuProfilWidget(
//         onKlikMenuResto: () => Navigator.push(...),
//         onKlikPemesanan: () => Navigator.push(...),
//       ),
//
// 🔹 CARA 2 (JIKA TAMPILKAN LANGSUNG DI HALAMAN_PROFIL.DART TANPA BUAT FILE BARU):
//    Copas HANYA blok di bawah ini (Mulai dari `Column(` sampai `)`).
// ═════════════════════════════════════════════════════════════════════════════

class TombolMenuProfilWidget extends StatelessWidget {
  final VoidCallback onKlikMenuResto;
  final VoidCallback onKlikPemesanan;
  final VoidCallback? onKlikLogout;

  const TombolMenuProfilWidget({
    super.key,
    required this.onKlikMenuResto,
    required this.onKlikPemesanan,
    this.onKlikLogout,
  });

  @override
  Widget build(BuildContext context) {
    return 

    // ⬇️ ✂️ [MULAI COPAS CARA 2 - DARI SINI (KATA 'return' DI ATAS JANGAN DICOPAS)] ✂️ ⬇️
    Column(
      children: [
        // ── 1. TOMBOL MENU RESTO ──
        Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green.withAlpha(25),
              child: const Icon(Icons.restaurant_menu, color: Colors.green),
            ),
            title: const Text(
              'Menu Resto', // ← EDIT: Teks tombol 1
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: onKlikMenuResto,
          ),
        ),

        const SizedBox(height: 12),

        // ── 2. TOMBOL PEMESANAN / KERANJANG ──
        Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.orange.withAlpha(25),
              child: const Icon(Icons.shopping_cart, color: Colors.orange),
            ),
            title: const Text(
              'Keranjang Pemesanan', // ← EDIT: Teks tombol 2
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: onKlikPemesanan,
          ),
        ),

        const SizedBox(height: 12),

        // ── 3. TOMBOL LOGOUT ──
        Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.red.withAlpha(25),
              child: const Icon(Icons.logout, color: Colors.red),
            ),
            title: const Text(
              'Keluar Account', // ← EDIT: Teks tombol 3
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: onKlikLogout ?? () {},
          ),
        ),

        // 💡 JIKA KUIS BESOK MINTA TOMBOL KE-4 (MISAL RIWAYAT / PENGATURAN):
        // UNCOMMENT (BUKA KOMENTAR) KODE DI BAWAH INI:
        // const SizedBox(height: 12),
        // Card(
        //   elevation: 1,
        //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        //   child: ListTile(
        //     leading: CircleAvatar(
        //       backgroundColor: Colors.blue.withAlpha(25),
        //       child: const Icon(Icons.settings, color: Colors.blue),
        //     ),
        //     title: const Text('Pengaturan Aplikasi'),
        //     trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        //     onTap: () {},
        //   ),
        // ),
      ],
    );
    // ⬆️ ✂️ [AKHIR COPAS CARA 2 - SAMPAI SINI] ⬆️
  }
}
