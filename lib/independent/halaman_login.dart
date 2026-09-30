import 'package:flutter/material.dart';

// ══════════════════════════════════════════════════════════════════════════════
// FILE: lib/independent/halaman_login.dart
// 📌 FUNGSI: Halaman Login (Username + Password + Tombol Masuk)
// USERNAME HARDCODE : admin
// PASSWORD  HARDCODE : 123
//
// ══════════════════════════════════════════════════════════════════════════════
// 📋 CARA PAKAI SAAT KUIS:
//
// 🔹 CARA 1 (COPAS SELURUH FILE 100% - DIREKOMENDASIKAN):
//    1. Buat file baru `lib/halaman_login.dart` di project kuis.
//    2. COPAS SELURUH ISI FILE INI DARI BARIS 1 SAMPAI BARIS TERAKHIR.
//    3. Edit baris import di atas sesuai nama class halaman utama Anda:
//       import 'nama_halaman_utama.dart';
//    4. Di `main.dart`, ganti `home:` menjadi:
//       home: HalamanLogin(),
//
// ══════════════════════════════════════════════════════════════════════════════
// ❓ CARA PASANG DI main.dart (TEMPLATE STATELESSWIDGET KOSONG):
//
//  Saat kuis template main.dart kosong seperti ini:
//
//  class AplikasiKu extends StatelessWidget {
//    @override
//    Widget build(BuildContext context) {
//      return MaterialApp(
//        home: HalamanLogin(), ← GANTI BARIS INI dengan HalamanLogin()
//      );
//    }
//  }
//
// ══════════════════════════════════════════════════════════════════════════════
// ✏️ PETUNJUK EDIT SAAT KUIS:
//    _usernameBenar  → Ganti string 'admin' dengan username soal kuis
//    _passwordBenar  → Ganti string '123' dengan password soal kuis
//    Navigasi setelah login → Ganti `RootHalaman()` dengan nama halaman utama kuis
// ══════════════════════════════════════════════════════════════════════════════

// ⚠️ PENTING: Ganti import di bawah ini dengan nama file halaman utama project kuis!
// import '../root.dart'; // ← EDIT: ganti sesuai nama halaman utama kuis

class HalamanLogin extends StatefulWidget {
  const HalamanLogin({super.key});

  @override
  State<HalamanLogin> createState() => _HalamanLoginState();
}

class _HalamanLoginState extends State<HalamanLogin> {

  // ── VARIABEL ──────────────────────────────────────────────────────────────
  final _kontrolerUsername = TextEditingController(); // ← Ambil teks dari field username
  final _kontrolerPassword = TextEditingController(); // ← Ambil teks dari field password
  bool _passwordTersembunyi = true;                   // ← Toggle tampil/sembunyikan password
  String _pesanError = '';                            // ← Pesan error jika login gagal

  // ── HARDCODE USERNAME & PASSWORD ──────────────────────────────────────────
  final String _usernameBenar = 'admin'; // ← EDIT: Ganti username
  final String _passwordBenar = '123';   // ← EDIT: Ganti password

  // ── FUNGSI TOMBOL LOGIN ───────────────────────────────────────────────────
  void _prosesLogin() {
    final username = _kontrolerUsername.text.trim();
    final password = _kontrolerPassword.text.trim();

    if (username == _usernameBenar && password == _passwordBenar) {
      // ✅ Login berhasil → Buka halaman utama (pushReplacement = tidak bisa back)
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (_) => RootHalaman()), // ← EDIT: nama halaman utama
      // );
    } else {
      // ❌ Login gagal → Tampilkan pesan error
      setState(() {
        _pesanError = 'Username atau password salah!';
      });
    }
  }

  @override
  void dispose() {
    _kontrolerUsername.dispose();
    _kontrolerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // ── 1. ICON / LOGO ATAS ──────────────────────────────────────
              const Icon(
                Icons.restaurant,       // ← EDIT: Ganti icon logo
                size: 80,
                color: Colors.green,    // ← EDIT: Ganti warna logo
              ),
              const SizedBox(height: 16),

              // ── 2. JUDUL APLIKASI ────────────────────────────────────────
              const Text(
                'NourishBowl',          // ← EDIT: Ganti nama aplikasi
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const Text(
                'Silakan masuk untuk melanjutkan',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 40),

              // ── 3. FIELD INPUT USERNAME ──────────────────────────────────
              TextField(
                controller: _kontrolerUsername,
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'Masukkan username',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // ── 4. FIELD INPUT PASSWORD ──────────────────────────────────
              TextField(
                controller: _kontrolerPassword,
                obscureText: _passwordTersembunyi, // ← true = disembunyikan
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Masukkan password',
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordTersembunyi
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordTersembunyi = !_passwordTersembunyi;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 8),

              // ── 5. PESAN ERROR (muncul jika login gagal) ─────────────────
              if (_pesanError.isNotEmpty)
                Text(
                  _pesanError,
                  style: const TextStyle(color: Colors.red, fontSize: 13),
                ),
              const SizedBox(height: 24),

              // ── 6. TOMBOL MASUK / LOGIN ──────────────────────────────────
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // ← EDIT: Warna tombol login
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _prosesLogin, // ← Panggil fungsi login
                  child: const Text(
                    'Masuk',              // ← EDIT: Teks tombol
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
