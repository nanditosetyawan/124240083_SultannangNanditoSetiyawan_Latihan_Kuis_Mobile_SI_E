import 'package:flutter/material.dart';

// ═════════════════════════════════════════════════════════════════════════════
// FILE: lib/independent/header_profil.dart
// 📌 FUNGSI: Header Profil User (Foto Bulat Kosong + Nama + Email/NIM)
//
// 🎯 LOKASI PASANG DI FILE TUJUAN:
//    Dipasang di file `halaman_profil.dart` -> di dalam `Column(children: [...])` bagian atas.
//
// ═════════════════════════════════════════════════════════════════════════════
// ❓ JAWABAN SINGKAT: APAKAH COPAS SELURUH FILE ATAU KODENYA SAJA?
//
// 🔹 CARA 1 (COPAS SELURUH FILE 100% - TANPA ADA YANG DIBUANG):
//    1. Buat file baru `lib/independent/header_profil.dart` di kuis besok.
//    2. COPAS SELURUH ISI FILE INI DARI BARIS 1 SAMPAI BARIS TERAKHIR.
//    3. Di `halaman_profil.dart`, panggil widget ini pada `Column`:
//       HeaderProfilWidget(
//         namaUser: "Nandito Setyawan",
//         emailUser: "nandito@gmail.com",
//       ),
//
// 🔹 CARA 2 (JIKA MALAS BUAT FILE BARU - COPAS POTONGAN KODENYA SAJA):
//    Copy HANYA blok di bawah ini (dari Container sampai kurung tutup)
//    dan tempel di dalam `children: [...]` pada `Column` di `halaman_profil.dart`.
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
    // ⬇️ ✂️ [POTONGAN KODE - JIKA CARA 2] ✂️ ⬇️
    return Container(
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
    // ⬆️ ✂️ [AKHIR POTONGAN KODE] ⬆️
  }
}
