// ============================================================
// FILE: halaman_beranda.dart
// Fungsi: Halaman utama - menampilkan DAFTAR MENU MAKANAN
//         dengan jumlah porsi dan total harga per item
// Dipakai di: root.dart (sebagai halaman index 0)
// ============================================================

// ─── IMPORT: Paket wajib Flutter ──────────────────────────────
import 'package:flutter/material.dart';

// ─── IMPORT: Model data makanan ───────────────────────────────
import 'models/food_item.dart'; // ← untuk pakai class FoodItem dan daftarMakanan
                               //   (sama seperti contoh/lib → import 'models/data.dart')

// ─── IMPORT: Halaman detail (tujuan navigasi saat klik makanan)
import 'halaman_detail.dart';

// ════════════════════════════════════════════════════════════════
// CLASS: HalamanBeranda
// Jenis: StatefulWidget (karena porsi & total harga bisa berubah → butuh setState)
// Fungsi: Menampilkan daftar menu dengan porsi dan harga yang bisa berubah
// ════════════════════════════════════════════════════════════════
class HalamanBeranda extends StatefulWidget {
  const HalamanBeranda({super.key});

  @override
  State<HalamanBeranda> createState() => _HalamanBerandaState();
}

class _HalamanBerandaState extends State<HalamanBeranda> {
  // ════════════════════════════════════════════════════════════
  // ⚠️ DEKLARASI STATE - data yang bisa berubah dan trigger rebuild UI
  // ════════════════════════════════════════════════════════════

  // ─── DEKLARASI: List makanan yang ditampilkan ─────────────
  // Diambil dari FoodItem.daftarMakanan (data statis di food_item.dart)
  // EDIT daftar makanan di food_item.dart → FoodItem.daftarMakanan
  final List<FoodItem> _daftarMakanan = FoodItem.daftarMakanan;

  // ─── FUNGSI: Navigasi ke halaman detail saat makanan diklik ─
  // Menerima kembali porsi terbaru dari halaman detail
  Future<void> _bukaHalamanDetail(FoodItem makanan) async {
    // await = tunggu sampai halaman detail ditutup
    // 'porsiKembali' = nilai yang dikirim balik dari HalamanDetail
    final porsiKembali = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HalamanDetail(makanan: makanan), // ← kirim data makanan
      ),
    );

    // Setelah kembali dari detail, update porsi jika ada perubahan
    if (porsiKembali != null) {
      setState(() {
        // ← setState = beritahu Flutter bahwa data berubah → refresh tampilan
        makanan.quantity = porsiKembali; // ← update porsi makanan dengan nilai baru
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ─── WIDGET: AppBar - bar judul atas ──────────────────
      // EDIT: ganti 'Menu Resto' untuk ubah judul
      appBar: AppBar(
        title: const Text(
          'Menu Resto',                    // ← EDIT: judul halaman beranda
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFFE07B39), // ← EDIT: warna AppBar (oranye)
        centerTitle: true,                  // ← judul di tengah
        elevation: 0,                       // ← tidak ada bayangan AppBar
      ),
      // ─── AKHIR AppBar ─────────────────────────────────────

      // ─── BACKGROUND HALAMAN ────────────────────────────────
      backgroundColor: Color(0xFFF9F4EE), // ← EDIT: warna background halaman

      // ─── WIDGET: ListView.builder - daftar makanan yang bisa di-scroll
      // Fungsi: Menampilkan kartu makanan sebanyak _daftarMakanan.length
      body: ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: 12, // ← EDIT: jarak kiri-kanan dari tepi layar
          vertical: 8,    // ← EDIT: jarak atas-bawah dari tepi layar
        ),
        itemCount: _daftarMakanan.length, // ← jumlah kartu = jumlah makanan
        itemBuilder: (context, indeks) {
          // ← 'indeks' mulai dari 0, naik 1 tiap item
          final makanan = _daftarMakanan[indeks]; // ← ambil makanan ke-indeks

          // ─── WIDGET: Setiap kartu makanan ─────────────────
          return _KartuMakanan(
            makanan: makanan,
            onKlik: () => _bukaHalamanDetail(makanan), // ← fungsi saat diklik
          );
          // ─── AKHIR Kartu Makanan ───────────────────────────
        },
      ),
      // ─── AKHIR ListView.builder ───────────────────────────
    );
  }
}

// ════════════════════════════════════════════════════════════════
// WIDGET TERPISAH: _KartuMakanan
// Fungsi: Widget kartu untuk satu item makanan di daftar beranda
// Jenis: StatelessWidget (data diterima dari luar, tidak perlu state sendiri)
// ════════════════════════════════════════════════════════════════
class _KartuMakanan extends StatelessWidget {
  // ─── DEKLARASI: Data yang diterima dari luar ──────────────
  final FoodItem makanan; // ← objek makanan yang akan ditampilkan
  final VoidCallback onKlik; // ← fungsi yang dipanggil saat kartu diklik

  const _KartuMakanan({
    required this.makanan,
    required this.onKlik,
  });

  @override
  Widget build(BuildContext context) {
    // ─── WIDGET: GestureDetector - bungkus agar kartu bisa diklik ──
    return GestureDetector(
      onTap: onKlik, // ← saat kartu disentuh, panggil fungsi onKlik

      // ─── WIDGET: Container - kotak kartu makanan ──────────────
      child: Container(
        margin: EdgeInsets.only(bottom: 10), // ← EDIT: jarak bawah antar kartu
        padding: EdgeInsets.all(12),         // ← EDIT: jarak dalam kartu
        decoration: BoxDecoration(
          color: Colors.white,               // ← EDIT: warna background kartu
          borderRadius: BorderRadius.circular(12), // ← EDIT: sudut membulat kartu
          boxShadow: [
            BoxShadow(
              color: Colors.black12,         // ← warna bayangan
              blurRadius: 4,                 // ← EDIT: keburaman bayangan
              offset: Offset(0, 2),          // ← arah bayangan (x, y)
            ),
          ],
        ),

        // ─── WIDGET: Row - isi kartu disusun horizontal ─────────
        // [Gambar] [Informasi makanan]
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start, // ← rata atas

          children: [
            // ─── WIDGET: Gambar makanan (sudut membulat) ────────
            // ⚠️ DEKLARASI ClipRRect diperlukan agar gambar bersudut bulat
            ClipRRect(
              borderRadius: BorderRadius.circular(8), // ← EDIT: sudut gambar
              child: Image.network(
                makanan.imageUrl,  // ← URL gambar dari objek makanan
                width: 80,         // ← EDIT: lebar gambar
                height: 80,        // ← EDIT: tinggi gambar
                fit: BoxFit.cover, // ← gambar mengisi seluruh area (dipotong jika perlu)
                errorBuilder: (context, error, stackTrace) {
                  // ← Tampil ikon ini jika gambar gagal dimuat
                  return Container(
                    width: 80,
                    height: 80,
                    color: Colors.grey[200],
                    child: Icon(Icons.restaurant, color: Colors.grey),
                  );
                },
              ),
            ),
            // ─── AKHIR Gambar ────────────────────────────────────

            SizedBox(width: 12), // ← jarak antara gambar dan teks

            // ─── WIDGET: Informasi makanan (nama, deskripsi, harga) ─
            // Expanded: mengisi sisa lebar yang tersedia
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // ← rata kiri

                children: [
                  // ─── NAMA MAKANAN ──────────────────────────────
                  Text(
                    makanan.name,    // ← nama makanan dari objek
                    style: TextStyle(
                      fontSize: 16,              // ← EDIT: ukuran font nama
                      fontWeight: FontWeight.bold, // ← tebal
                      color: Colors.black87,     // ← EDIT: warna teks nama
                    ),
                  ),

                  SizedBox(height: 4),

                  // ─── DESKRIPSI MAKANAN ────────────────────────────
                  Text(
                    makanan.description, // ← deskripsi dari objek
                    style: TextStyle(
                      fontSize: 12,        // ← EDIT: ukuran font deskripsi
                      color: Colors.grey,  // ← EDIT: warna teks deskripsi
                    ),
                    maxLines: 2,           // ← maksimal 2 baris (sisanya ...)
                    overflow: TextOverflow.ellipsis, // ← kelebihan teks jadi "..."
                  ),

                  SizedBox(height: 6),

                  // ─── WIDGET: Row - porsi dan total harga dalam 1 baris ──
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // ← kiri & kanan
                    children: [
                      // ─── JUMLAH PORSI ──────────────────────────────
                      Text(
                        '${makanan.quantity} porsi', // ← tampilkan jumlah porsi
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          // ← warna oranye jika ada porsi, abu kalau 0
                          color: makanan.quantity > 0
                              ? Color(0xFFE07B39)
                              : Colors.grey,
                        ),
                      ),

                      // ─── TOTAL HARGA ────────────────────────────────
                      Text(
                        makanan.quantity > 0
                            ? makanan.totalFormatted // ← tampil "Rp 30.000" jika ada porsi
                            : 'Rp 0',               // ← tampil "Rp 0" jika tidak ada porsi
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.green, // ← EDIT: warna teks total harga
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 2),

                  // ─── HARGA PER PORSI ────────────────────────────────
                  Text(
                    makanan.hargaFormatted, // ← "Rp 15.000 / porsi"
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            // ─── AKHIR Informasi Makanan ──────────────────────────
          ],
        ),
        // ─── AKHIR Row ────────────────────────────────────────────
      ),
      // ─── AKHIR Container ──────────────────────────────────────
    );
    // ─── AKHIR GestureDetector ────────────────────────────────
  }
}
