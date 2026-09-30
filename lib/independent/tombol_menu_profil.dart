import 'package:flutter/material.dart';

// ═════════════════════════════════════════════════════════════════════════════
// FILE: lib/independent/tombol_menu_profil.dart
// 📌 FUNGSI: List Tombol Navigasi Halaman Profil (Menu Resto, Keranjang, dll)
//
// 🎯 LOKASI PASANG DI FILE TUJUAN:
//    Di file `halaman_profil.dart` -> Di bawah Header Profil pada `Column(children: [...])`
//
// ═════════════════════════════════════════════════════════════════════════════
// 📋 DUA CARA PAKAI / COPAS BESOK SAAT KUIS:
//
// ── CARA A (PALING MUDAH - IMPORT CLASS):
//    1. Di atas file `halaman_profil.dart`, tambahkan:
//       import 'independent/tombol_menu_profil.dart';
//    2. Di dalam Column `halaman_profil.dart`, tulis:
//       TombolMenuProfilWidget(
//         onKlikMenuResto: () => Navigator.push(...),
//         onKlikPemesanan: () => Navigator.push(...),
//       ),
//
// ── CARA B (COPAS KODE LANGSUNG TANPA IMPORT CLASS):
//    Blok & Copy dari `Column(` sampai `)` di bawah ini,
//    lalu paste di dalam `children: [...]` pada `Column` di `halaman_profil.dart`.
// ═════════════════════════════════════════════════════════════════════════════

// ⬇️ ✂️ [MULAI COPAS CARA B - DARI SINI] ✂️ ⬇️
Widget buatTombolMenuProfil({
  required VoidCallback onKlikMenuResto,
  required VoidCallback onKlikPemesanan,
  VoidCallback? onKlikLogout,
}) {
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
      //     title: const Text('Pengaturan Application'),
      //     trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      //     onTap: () {},
      //   ),
      // ),
    ],
  );
}
// ⬆️ ✂️ [AKHIR COPAS CARA B - SAMPAI SINI] ⬆️


// ─────────────────────────────────────────────────────────────────────────────
// CLASS WIDGET (Bisa langsung dipakai jika menggunakan CARA A)
// ─────────────────────────────────────────────────────────────────────────────
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
    return buatTombolMenuProfil(
      onKlikMenuResto: onKlikMenuResto,
      onKlikPemesanan: onKlikPemesanan,
      onKlikLogout: onKlikLogout,
    );
  }
}
