import 'package:flutter/material.dart';

// ═════════════════════════════════════════════════════════════════════════════
// FILE: lib/independent/header_profil.dart
// TAMPILAN: Header Profil User (Foto Profil Bulat Kosong + Nama + Email/NIM)
// KETERKAITAN: Dipakai di `halaman_profil.dart` pada bagian atas layar.
// METODE COPAS: Copas class `HeaderProfilWidget` ini ke halaman profil baru.
// ═════════════════════════════════════════════════════════════════════════════
//
// ✏️ PETUNJUK EDIT BESOK SAAT KUIS:
// 1. Nama User        -> Edit String `namaUser` (default: "Nandito Setyawan")
// 2. Email / Subtitle -> Edit String `emailUser` (default: "nandito@gmail.com")
// 3. Ukuran Avatar    -> Edit `radius: 50` di `CircleAvatar`
// 4. Warna Avatar     -> Edit `backgroundColor: Colors.green`
// ═════════════════════════════════════════════════════════════════════════════

class HeaderProfilWidget extends StatelessWidget {
  final String namaUser;
  final String emailUser;
  final String? urlFoto;

  const HeaderProfilWidget({
    super.key,
    this.namaUser = "Nandito Setyawan",   // ← EDIT: Nama Anda / sesuai kuis
    this.emailUser = "nandito@gmail.com", // ← EDIT: Email / NIM Anda
    this.urlFoto,                         // ← Null jika foto kosong bulat
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.green.shade50, // ← EDIT: Warna latar belakang header profil
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          // ── 1. FOTO PROFIL BULAT KOSONG / AVATAR ──
          CircleAvatar(
            radius: 50, // ← EDIT: Ukuran bulat lingkaran foto
            backgroundColor: Colors.green, // ← EDIT: Warna latar foto kosong
            backgroundImage: (urlFoto != null && urlFoto!.isNotEmpty)
                ? NetworkImage(urlFoto!)
                : null,
            child: (urlFoto == null || urlFoto!.isEmpty)
                ? const Icon(
                    Icons.person, // ← Icon default jika foto kosong
                    size: 60,
                    color: Colors.white,
                  )
                : null,
          ),

          const SizedBox(height: 16),

          // ── 2. NAMA USER / MAHASISWA ──
          Text(
            namaUser,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 4),

          // ── 3. EMAIL / SUBTITLE / NIM ──
          Text(
            emailUser,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}
