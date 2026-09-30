import 'package:flutter/material.dart';

// ═════════════════════════════════════════════════════════════════════════════
// FILE: lib/independent/header_profil.dart
// 📌 FUNGSI: Header Profil User (Foto Bulat Kosong + Nama + Email/NIM)
//
// 🎯 LOKASI PASANG DI FILE TUJUAN:
//    Di file `halaman_profil.dart` -> Di dalam `Column(children: [...])` bagian atas
//
// ═════════════════════════════════════════════════════════════════════════════
// 📋 DUA CARA PAKAI / COPAS BESOK SAAT KUIS:
//
// ── CARA A (PALING MUDAH - IMPORT CLASS):
//    1. Di atas file `halaman_profil.dart`, tambahkan:
//       import 'independent/header_profil.dart';
//    2. Di dalam Column `halaman_profil.dart`, tulis:
//       HeaderProfilWidget(
//         namaUser: "Nandito Setyawan",
//         emailUser: "nandito@gmail.com",
//       ),
//
// ── CARA B (COPAS KODE LANGSUNG TANPA IMPORT CLASS):
//    Blok & Copy dari `Container(` sampai `)` di bawah ini,
//    lalu paste di dalam `children: [...]` pada `Column` di `halaman_profil.dart`.
// ═════════════════════════════════════════════════════════════════════════════

// ⬇️ ✂️ [MULAI COPAS CARA B - DARI SINI] ✂️ ⬇️
Widget buatHeaderProfil({
  String namaUser = "Nandito Setyawan",   // ← EDIT: Nama Anda / sesuai kuis
  String emailUser = "nandito@gmail.com", // ← EDIT: Email / NIM Anda
  String? urlFoto,
}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
    decoration: BoxDecoration(
      color: Colors.green.shade50, // ← EDIT: Warna latar belakang header profil
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      children: [
        // 1. Foto Profil Bulat Kosong / Avatar
        CircleAvatar(
          radius: 50, // ← EDIT: Ukuran bulat lingkaran foto
          backgroundColor: Colors.green, // ← EDIT: Warna latar foto kosong
          backgroundImage: (urlFoto != null && urlFoto.isNotEmpty)
              ? NetworkImage(urlFoto)
              : null,
          child: (urlFoto == null || urlFoto.isEmpty)
              ? const Icon(
                  Icons.person, // ← Icon default jika foto kosong
                  size: 60,
                  color: Colors.white,
                )
              : null,
        ),

        const SizedBox(height: 16),

        // 2. Nama User / Mahasiswa
        Text(
          namaUser,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),

        const SizedBox(height: 4),

        // 3. Email / Subtitle / NIM
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
// ⬆️ ✂️ [AKHIR COPAS CARA B - SAMPAI SINI] ⬆️


// ─────────────────────────────────────────────────────────────────────────────
// CLASS WIDGET (Bisa langsung dipakai jika menggunakan CARA A)
// ─────────────────────────────────────────────────────────────────────────────
class HeaderProfilWidget extends StatelessWidget {
  final String namaUser;
  final String emailUser;
  final String? urlFoto;

  const HeaderProfilWidget({
    super.key,
    this.namaUser = "Nandito Setyawan",
    this.emailUser = "nandito@gmail.com",
    this.urlFoto,
  });

  @override
  Widget build(BuildContext context) {
    return buatHeaderProfil(
      namaUser: namaUser,
      emailUser: emailUser,
      urlFoto: urlFoto,
    );
  }
}
