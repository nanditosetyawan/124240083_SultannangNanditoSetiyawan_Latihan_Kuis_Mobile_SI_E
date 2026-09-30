import 'package:flutter/material.dart';

// ═════════════════════════════════════════════════════════════════════════════
// FILE: lib/independent/tombol_menu_profil.dart
// 📌 FUNGSI: List Tombol Navigasi Halaman Profil (Menu Resto, Keranjang, dll)
//
// 🎯 LOKASI PASANG DI FILE TUJUAN:
//    Dipasang di file `halaman_profil.dart` -> di bawah Header Profil pada `Column(children: [...])`.
//
// ═════════════════════════════════════════════════════════════════════════════
// ❓ JAWABAN SINGKAT: APAKAH COPAS SELURUH FILE ATAU KODENYA SAJA?
//
// 🔹 CARA 1 (COPAS SELURUH FILE 100% - TANPA ADA YANG DIBUANG):
//    1. Buat file baru `lib/independent/tombol_menu_profil.dart` di kuis besok.
//    2. COPAS SELURUH ISI FILE INI DARI BARIS 1 SAMPAI BARIS TERAKHIR.
//    3. Di `halaman_profil.dart`, panggil widget ini pada `Column`:
//       TombolMenuProfilWidget(
//         onKlikMenuResto: () => Navigator.push(...),
//         onKlikPemesanan: () => Navigator.push(...),
//       ),
//
// 🔹 CARA 2 (JIKA MALAS BUAT FILE BARU - COPAS POTONGAN KODENYA SAJA):
//    Copy HANYA blok di bawah ini (dari Column sampai kurung tutup)
//    dan tempel di dalam `children: [...]` pada `Column` di `halaman_profil.dart`.
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
    // ⬇️ ✂️ [POTONGAN KODE - JIKA CARA 2] ✂️ ⬇️
    return Column(
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
    // ⬆️ ✂️ [AKHIR POTONGAN KODE] ⬆️
  }
}
