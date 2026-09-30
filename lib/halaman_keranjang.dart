// ═══════════════════════════════════════════════════════════
// FILE: halaman_keranjang.dart
// Fungsi: Halaman keranjang (semua item yang quantity > 0)
// Dibuka dari: halaman_profil.dart → klik tombol "Pemesanan"
// Data dari: FoodItem.daftarMakanan (filter quantity > 0)
// ═══════════════════════════════════════════════════════════
import 'package:flutter/material.dart';
import 'models/food_item.dart';

class HalamanKeranjang extends StatelessWidget {
  const HalamanKeranjang({super.key});

  @override
  Widget build(BuildContext context) {
    // VARIABEL: daftarPesanan → hanya item yang sudah dipesan (quantity > 0)
    final daftarPesanan = FoodItem.daftarMakanan.where((m) => m.quantity > 0).toList();
    // VARIABEL: grandTotal → jumlah semua totalHarga
    final grandTotal = daftarPesanan.fold(0, (jml, m) => jml + m.totalHarga);

    return Scaffold(
      backgroundColor: Color(0xFFF9F4EE),










      // ═══ [APPBAR-KERANJANG] ══════════════════════════════
      // Tampilan: Bar oranye "Keranjang Pesanan" + tombol back
      // ═════════════════════════════════════════════════════
      appBar: AppBar(
        title: Text('Keranjang Pesanan',       // ← VARIABEL: judul halaman
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Color(0xFFE07B39),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      // ═══ AKHIR [APPBAR-KERANJANG] ════════════════════════










      // ═══ [BODY-KERANJANG] ════════════════════════════════
      // Tampilan: Jika kosong → ikon keranjang + teks "Belum ada pesanan"
      //           Jika ada   → list kartu + box total di bawah
      // ════════════════════════════════════════════════════
      body: daftarPesanan.isEmpty










          // ═══ [TAMPILAN-KOSONG] ═══════════════════════════
          // Tampilan: Ikon + teks saat belum ada pesanan
          // ════════════════════════════════════════════════
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey[400]),
                  SizedBox(height: 16),
                  Text('Belum ada pesanan',    // ← VARIABEL: teks kosong
                    style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.w500)),
                  SizedBox(height: 8),
                  Text('Pesan makanan dari halaman Menu',
                    style: TextStyle(fontSize: 13, color: Colors.grey[400])),
                ],
              ),
            )
          // ═══ AKHIR [TAMPILAN-KOSONG] ═════════════════════










          : Column(
              children: [










                // ═══ [LIST-PESANAN] ═══════════════════════════
                // Tampilan: Daftar kartu item yang sudah dipesan
                // Copas: Ambil Expanded+ListView sampai AKHIR LIST-PESANAN
                // ════════════════════════════════════════════════
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(12),
                    itemCount: daftarPesanan.length,
                    itemBuilder: (context, i) {
                      final m = daftarPesanan[i];
                      return Container(
                        margin: EdgeInsets.only(bottom: 10),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))],
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(m.imageUrl, width: 60, height: 60, fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) => Container(width: 60, height: 60,
                                  color: Colors.grey[200], child: Icon(Icons.restaurant, color: Colors.grey))),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(m.name, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black87)),
                                  SizedBox(height: 4),
                                  Text('${m.quantity} porsi × ${m.hargaFormatted.split('/')[0].trim()}',
                                    style: TextStyle(fontSize: 12, color: Colors.grey)),
                                ],
                              ),
                            ),
                            Text(m.totalFormatted, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green)),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                // ═══ AKHIR [LIST-PESANAN] ═════════════════════










                // ═══ [BOX-TOTAL] ═══════════════════════════════
                // Tampilan: Kotak putih di bawah layar berisi total harga + tombol pesan
                // Copas: Ambil Container sampai AKHIR BOX-TOTAL
                // ════════════════════════════════════════════════
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, -4))],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total Pesanan', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
                          Text('Rp ${formatHarga(grandTotal)}',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFE07B39))),
                        ],
                      ),
                      SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Pesanan dikonfirmasi! Total: Rp ${formatHarga(grandTotal)}'),
                              backgroundColor: Color(0xFFE07B39)));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFE07B39),
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          child: Text('Pesan Sekarang',  // ← VARIABEL: teks tombol
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
                // ═══ AKHIR [BOX-TOTAL] ═════════════════════════










              ],
            ),
      // ═══ AKHIR [BODY-KERANJANG] ══════════════════════════
    );
  }
}
