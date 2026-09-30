import 'package:flutter/material.dart';
import 'halaman_login.dart'; // ← Halaman login membuka RootHalaman setelah berhasil

void main() => runApp(const AplikasiResto());

class AplikasiResto extends StatelessWidget {
  const AplikasiResto({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Pemesanan Resto',     // ← VARIABEL: judul app
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFFE07B39),       // ← VARIABEL: warna tema utama
        ),
        useMaterial3: true,
      ),
      home: HalamanLogin(),                   // ← Ganti ke halaman login dulu
    );
  }
}
