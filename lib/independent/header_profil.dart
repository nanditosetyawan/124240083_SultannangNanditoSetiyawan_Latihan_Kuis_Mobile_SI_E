import 'package:flutter/material.dart';

// ═════════════════════════════════════════════════════════════════════════════
// FILE: lib/independent/header_profil.dart
// 📌 FUNGSI: Header Profil User (Foto Bulat Kosong + Nama + Email/NIM)
//
// 🎯 LOKASI TEMPEL DI FILE TUJUAN (`halaman_profil.dart`):
//    Di file `halaman_profil.dart` -> Di dalam `Column(children: [...])` bagian atas.
//
// ═════════════════════════════════════════════════════════════════════════════
// ❓ JAWABAN SINGKAT: APAKAH KATA 'return' DICOPAS?
// ❌ TIDAK! Kata 'return' TIDAK PERLU DICOPAS!
//    Cukup copas dari `Container(` sampai kurung tutup `)` saja.
//
// 📌 CONTOH TEMPEL DI `halaman_profil.dart`:
//    Column(
//      children: [
//        Container( ← TEMPEL DI SINI DI DALAM CHILDREN COLUMN
//          width: double.infinity,
//          child: Column( ... ),
//        ),
//        SizedBox(height: 16),
//      ],
//    )
// ═════════════════════════════════════════════════════════════════════════════
// 📋 2 CARA PAKAI SAAT KUIS:
//
// 🔹 CARA 1 (COPAS SELURUH FILE 100% - TANPA MEMUTUS KODE):
//    1. Buat file baru `lib/independent/header_profil.dart` di project kuis.
//    2. COPAS SELURUH ISI FILE INI DARI BARIS 1 SAMPAI BARIS TERAKHIR.
//    3. Di `halaman_profil.dart`, panggil:
//       HeaderProfilWidget(
//         namaUser: "Nandito Setyawan",
//         emailUser: "nandito@gmail.com",
//       ),
//
// 🔹 CARA 2 (JIKA TAMPILKAN LANGSUNG DI HALAMAN_PROFIL.DART TANPA BUAT FILE BARU):
//    Copas HANYA blok di bawah ini (Mulai dari `Container(` sampai `)`).
// ═════════════════════════════════════════════════════════════════════════════

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
    return 

    // ⬇️ ✂️ [MULAI COPAS CARA 2 - DARI SINI (KATA 'return' DI ATAS JANGAN DICOPAS)] ✂️ ⬇️
    Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.green.shade50, // ← EDIT: Warna latar profil
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          // 1. Foto Profil Bulat Kosong / Avatar
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
    // ⬆️ ✂️ [AKHIR COPAS CARA 2 - SAMPAI SINI] ⬆️
  }
}
