// ============================================================
// FILE: halaman_keranjang.dart
// Fungsi: Menampilkan semua makanan yang sudah dipesan (quantity > 0)
//         seperti halaman keranjang belanja
// Dipakai di: halaman_profil.dart (dibuka via Navigator.push saat klik Pemesanan)
//
// DATA DARI MANA?
//   → Data makanan diambil dari FoodItem.daftarMakanan (lib/models/food_item.dart)
//   → Hanya tampilkan item yang quantity-nya > 0 (sudah dipesan dari halaman detail)
// ============================================================

// ─── IMPORT WAJIB ─────────────────────────────────────────────
import 'package:flutter/material.dart';
import 'models/food_item.dart'; // ← ambil class FoodItem + daftarMakanan

// ════════════════════════════════════════════════════════════════
// CLASS: HalamanKeranjang
// Jenis: StatelessWidget — data sudah ada di FoodItem.daftarMakanan, tidak perlu state sendiri
// Fungsi: Tampilkan daftar pesanan (item yang quantity > 0) dan total keseluruhan
// ════════════════════════════════════════════════════════════════
class HalamanKeranjang extends StatelessWidget {
  const HalamanKeranjang({super.key});

  @override
  Widget build(BuildContext context) {
    // ─── AMBIL DATA PESANAN ────────────────────────────────────
    // Sumber: FoodItem.daftarMakanan (list statis di food_item.dart)
    // Filter: hanya item dengan quantity > 0 (yang sudah dipesan)
    final List<FoodItem> daftarPesanan = FoodItem.daftarMakanan
        .where((makanan) => makanan.quantity > 0)
        .toList();

    // ─── HITUNG TOTAL SEMUA PESANAN ────────────────────────────
    // Menjumlahkan totalHarga dari setiap item yang dipesan
    final int grandTotal = daftarPesanan.fold(
      0,
      (jumlah, makanan) => jumlah + makanan.totalHarga,
    );
    // ─── AKHIR Hitung Total ───────────────────────────────────

    return Scaffold(
      backgroundColor: Color(0xFFF9F4EE), // ← EDIT: warna background halaman

      // ══════════════════════════════════════════════════════════
      // WIDGET: AppBar
      // Fungsi: Bar judul di atas halaman + tombol kembali otomatis
      // CARA COPY: Salin seluruh blok appBar: AppBar(...), termasuk semua isi di dalamnya
      // ══════════════════════════════════════════════════════════
      appBar: AppBar(
        title: Text(
          'Keranjang Pesanan',           // ← EDIT: ganti judul
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFFE07B39), // ← EDIT: warna AppBar
        iconTheme: IconThemeData(color: Colors.white), // ← warna tombol back = putih
        centerTitle: true,
      ),
      // ── AKHIR AppBar ─────────────────────────────────────────

      // ══════════════════════════════════════════════════════════
      // BODY: Tampilkan kondisi kosong atau daftar pesanan
      // ══════════════════════════════════════════════════════════
      body: daftarPesanan.isEmpty
          // ─── KONDISI: Tidak ada pesanan ────────────────────────
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 80,
                    color: Colors.grey[400],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Belum ada pesanan',       // ← EDIT: pesan kosong
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Pesan makanan dari halaman Menu', // ← EDIT: petunjuk
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            )
          // ─── KONDISI: Ada pesanan → tampilkan daftar + total ───
          : Column(
              children: [
                // ──────────────────────────────────────────────────
                // BAGIAN 1: Daftar item pesanan (bisa di-scroll)
                // ──────────────────────────────────────────────────
                Expanded(
                  // Expanded = mengisi sisa tinggi layar (di atas bagian total)
                  child: ListView.builder(
                    padding: EdgeInsets.all(12),
                    itemCount: daftarPesanan.length,
                    itemBuilder: (context, indeks) {
                      final makanan = daftarPesanan[indeks]; // ← ambil item ke-indeks

                      // ══════════════════════════════════════════════
                      // WIDGET: Kartu satu item pesanan
                      // ──────────────────────────────────────────────
                      // CARA COPY WIDGET INI (1 kartu pesanan):
                      //   1. Salin blok Container di bawah ini sampai // ─ AKHIR Kartu Pesanan
                      //   2. Tidak ada kode di file lain yang perlu disalin untuk widget ini
                      //   3. Ganti 'makanan.xxx' dengan variabel FoodItem kamu
                      // ══════════════════════════════════════════════
                      return Container(
                        // [DEKLARASI STYLE KARTU - copy semua ini]
                        margin: EdgeInsets.only(bottom: 10), // ← jarak bawah antar kartu
                        padding: EdgeInsets.all(12),          // ← jarak dalam kartu
                        decoration: BoxDecoration(
                          color: Colors.white,                // ← EDIT: warna background kartu
                          borderRadius: BorderRadius.circular(12), // ← EDIT: sudut membulat kartu
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        // [DEKLARASI STYLE KARTU - sampai sini]

                        child: Row(
                          children: [
                            // ── Gambar makanan kecil ───────────────
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                makanan.imageUrl,
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, _) => Container(
                                  width: 60, height: 60,
                                  color: Colors.grey[200],
                                  child: Icon(Icons.restaurant, color: Colors.grey),
                                ),
                              ),
                            ),
                            // ── Akhir Gambar ───────────────────────

                            SizedBox(width: 12),

                            // ── Informasi item (nama, porsi, harga) ─
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // ── Nama makanan ────────────────────
                                  Text(
                                    makanan.name,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  // ── Jumlah porsi ────────────────────
                                  Text(
                                    '${makanan.quantity} porsi × ${makanan.hargaFormatted.split('/')[0].trim()}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // ── Akhir Informasi ─────────────────────

                            // ── Total harga per item ─────────────────
                            Text(
                              makanan.totalFormatted,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                            // ── Akhir Total Harga ────────────────────
                          ],
                        ),
                      );
                      // ── AKHIR Kartu Pesanan ─────────────────────
                    },
                  ),
                ),
                // ─── AKHIR Daftar Pesanan ─────────────────────────

                // ══════════════════════════════════════════════════
                // BAGIAN 2: Box total keseluruhan (di bawah, fixed)
                // ══════════════════════════════════════════════════
                // CARA COPY WIDGET INI (box total bawah):
                //   Salin blok Container di bawah ini sampai // ─ AKHIR Box Total
                //   Tidak ada kode tambahan di file lain yang perlu disalin
                Container(
                  // [DEKLARASI STYLE BOX TOTAL - copy semua ini]
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, -4),
                      ),
                    ],
                  ),
                  // [DEKLARASI STYLE BOX TOTAL - sampai sini]

                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // ── Baris "Total Pesanan" + angka total ─────
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Pesanan',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            'Rp ${formatHarga(grandTotal)}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFE07B39),
                            ),
                          ),
                        ],
                      ),
                      // ── Akhir Baris Total ───────────────────────

                      SizedBox(height: 12),

                      // ── Tombol Pesan Sekarang ──────────────────────
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // ← EDIT: aksi saat tombol ditekan (contoh: konfirmasi order)
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Pesanan dikonfirmasi! Total: Rp ${formatHarga(grandTotal)}'),
                                backgroundColor: Color(0xFFE07B39),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFE07B39),  // ← EDIT: warna tombol
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'Pesan Sekarang',                     // ← EDIT: teks tombol
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      // ── Akhir Tombol ─────────────────────────────
                    ],
                  ),
                ),
                // ─── AKHIR Box Total ──────────────────────────────
              ],
            ),
      // ─── AKHIR Body ───────────────────────────────────────────
    );
  }
}
