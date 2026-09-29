// ============================================================
// FILE: main.dart
// Fungsi: Titik awal (entry point) aplikasi Flutter
// Semua aplikasi Flutter WAJIB punya file ini
// ============================================================

// ─── IMPORT: Paket Flutter wajib untuk semua UI ──────────────
import 'package:flutter/material.dart';

// ─── IMPORT: Halaman root yang berisi navigasi bawah ──────────
import 'root.dart';

// ─── FUNGSI UTAMA: Dijalankan pertama kali saat aplikasi dibuka
void main() {
  runApp(const AplikasiResto()); // ← jalankan widget utama aplikasi
}

// ════════════════════════════════════════════════════════════════
// CLASS: AplikasiResto
// Jenis: StatelessWidget (tidak ada state yang berubah di sini)
// Fungsi: Konfigurasi utama aplikasi (tema, judul, halaman awal)
// ════════════════════════════════════════════════════════════════
class AplikasiResto extends StatelessWidget {
  const AplikasiResto({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ─── EDIT: judul aplikasi (muncul di task manager HP) ─────
      title: 'Aplikasi Pemesanan Resto',

      // ─── Sembunyikan banner "DEBUG" di pojok kanan atas ───────
      debugShowCheckedModeBanner: false,

      // ─── TEMA: konfigurasi warna utama aplikasi ────────────────
      theme: ThemeData(
        // ← EDIT: seedColor = warna utama tema, ganti warna di sini
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFFE07B39), // ← warna oranye sebagai warna utama
        ),
        useMaterial3: true,
      ),

      // ─── HALAMAN AWAL: yang pertama tampil saat buka app ───────
      // Langsung ke RootHalaman (berisi navigasi bawah)
      // EDIT: ganti RootHalaman() dengan halaman lain jika perlu login dulu
      home: RootHalaman(),
    );
  }
}
