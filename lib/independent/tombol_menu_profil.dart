import 'package:flutter/material.dart';

// ═════════════════════════════════════════════════════════════════════════════
// FILE: lib/independent/tombol_menu_profil.dart
// TAMPILAN: List Tombol Navigasi Halaman Profil (Menu Resto, Keranjang, dll)
// KETERKAITAN: Dipakai di `halaman_profil.dart` di bawah Header Profil.
// METODE COPAS: Copas class `TombolMenuProfilWidget` ini ke halaman profil.
// ═════════════════════════════════════════════════════════════════════════════
//
// ✏️ PETUNJUK CARA MENAMBAH TOMBOL BARU SAAT KUIS (MISAL ADA 3 / 4 TOMBOL):
// Tinggal copas blok `_buildKartuTombol(...)` di dalam list `children: [...]`
// Contoh:
//   _buildKartuTombol(
//     icon: Icons.history,
//     judul: "Riwayat Transaksi", // ← Teks tombol baru
//     onTap: () { ... },          // ← Aksi saat diklik
//   ),
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
    return Column(
      children: [
        // ── 1. TOMBOL MENU RESTO ──
        _buildKartuTombol(
          icon: Icons.restaurant_menu,
          judul: 'Menu Resto', // ← EDIT: Teks tombol 1
          warnaIcon: Colors.green,
          onTap: onKlikMenuResto, // ← Aksi menuju Halaman Menu Resto
        ),

        const SizedBox(height: 12),

        // ── 2. TOMBOL PEMESANAN / KERANJANG ──
        _buildKartuTombol(
          icon: Icons.shopping_cart,
          judul: 'Keranjang Pemesanan', // ← EDIT: Teks tombol 2
          warnaIcon: Colors.orange,
          onTap: onKlikPemesanan, // ← Aksi menuju Halaman Keranjang
        ),

        const SizedBox(height: 12),

        // ── 3. TOMBOL LOGOUT (OPSIONAL) ──
        _buildKartuTombol(
          icon: Icons.logout,
          judul: 'Keluar Account', // ← EDIT: Teks tombol 3
          warnaIcon: Colors.red,
          onTap: onKlikLogout ?? () {},
        ),

        // 💡 JIKA KUIS BESOK MINTA TOMBOL KE-4 (MISAL RIWAYAT / PENGATURAN):
        // CUKUP UNCOMMENT (BUKA KOMENTAR) KODE DI BAWAH INI:
        // const SizedBox(height: 12),
        // _buildKartuTombol(
        //   icon: Icons.settings,
        //   judul: 'Pengaturan Aplikasi',
        //   warnaIcon: Colors.blue,
        //   onTap: () {},
        // ),
      ],
    );
  }

  // 📌 Helper Method Pembentuk 1 Tombol Kartu Mandiri
  Widget _buildKartuTombol({
    required IconData icon,
    required String judul,
    required Color warnaIcon,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: warnaIcon.withAlpha(25),
          child: Icon(icon, color: warnaIcon),
        ),
        title: Text(
          judul,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
