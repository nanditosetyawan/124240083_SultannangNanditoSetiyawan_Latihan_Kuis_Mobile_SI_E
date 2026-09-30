// ═══════════════════════════════════════════════════════════
// FILE: halaman_beranda.dart
// Fungsi: Halaman daftar menu makanan (bisa scroll)
// Import di: root.dart → daftarHalaman[0]
// Data dari: models/food_item.dart → FoodItem.daftarMakanan
// ═══════════════════════════════════════════════════════════
import 'package:flutter/material.dart';
import 'models/food_item.dart';
import 'halaman_detail.dart';

class HalamanBeranda extends StatefulWidget {
  const HalamanBeranda({super.key});
  @override
  State<HalamanBeranda> createState() => _HalamanBerandaState();
}

class _HalamanBerandaState extends State<HalamanBeranda> {
  // VARIABEL: _daftarMakanan → sumber data list, diambil dari food_item.dart
  final List<FoodItem> _daftarMakanan = FoodItem.daftarMakanan;

  // Fungsi navigasi: buka detail → terima porsi kembali → update tampilan
  Future<void> _bukaDetail(FoodItem makanan) async {
    final porsiKembali = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => HalamanDetail(makanan: makanan)),
    );
    if (porsiKembali != null) {
      setState(() { makanan.quantity = porsiKembali; });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F4EE), // ← VARIABEL: warna background










      // ═══ [APPBAR] ════════════════════════════════════════
      // Tampilan: Bar oranye di ATAS dengan judul "Menu Resto"
      // Copas: Ambil dari appBar sampai AKHIR APPBAR
      // ═════════════════════════════════════════════════════
      appBar: AppBar(
        title: Text(
          'Menu Resto',                       // ← VARIABEL: judul halaman
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFFE07B39),   // ← VARIABEL: warna AppBar
        centerTitle: true,
        elevation: 0,
      ),
      // ═══ AKHIR [APPBAR] ══════════════════════════════════










      // ═══ [LIST-MENU] ════════════════════════════════════
      // Tampilan: Daftar kartu makanan yang bisa di-scroll ke bawah
      // Copas: Ambil dari body sampai AKHIR LIST-MENU
      // Syarat: Butuh _daftarMakanan (List<FoodItem>) dari import food_item.dart
      //         Butuh class _KartuMakanan di bawah file ini
      // ════════════════════════════════════════════════════
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        itemCount: _daftarMakanan.length,
        itemBuilder: (context, indeks) {
          final makanan = _daftarMakanan[indeks];
          return _KartuMakanan(
            makanan: makanan,
            onKlik: () => _bukaDetail(makanan),
          );
        },
      ),
      // ═══ AKHIR [LIST-MENU] ═══════════════════════════════










    );
  }
}










// ═══ [KARTU-MENU] ══════════════════════════════════════════
// Tampilan: 1 kotak putih berisi gambar kiri + info kanan (nama, deskripsi, porsi, harga)
// Copas: Ambil seluruh class _KartuMakanan
// Syarat: Butuh import 'models/food_item.dart' di atas file
// VARIABEL yang bisa diganti:
//   makanan.name        → nama item
//   makanan.description → deskripsi
//   makanan.imageUrl    → gambar
//   makanan.quantity    → jumlah porsi
//   makanan.hargaFormatted → harga satuan
//   makanan.totalFormatted → total harga
// ════════════════════════════════════════════════════════════
class _KartuMakanan extends StatelessWidget {
  final FoodItem makanan;       // ← data makanan dari list
  final VoidCallback onKlik;    // ← fungsi saat kartu ditekan

  const _KartuMakanan({required this.makanan, required this.onKlik});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onKlik,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),   // ← VARIABEL: jarak antar kartu
        padding: EdgeInsets.all(12),            // ← VARIABEL: jarak dalam kartu
        decoration: BoxDecoration(
          color: Colors.white,                  // ← VARIABEL: warna kartu
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [










            // ═══ [GAMBAR-KECIL] ═══════════════════════════
            // Tampilan: Foto makanan kecil 80x80 di kiri kartu
            // ═══════════════════════════════════════════════
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                makanan.imageUrl,               // ← VARIABEL: URL gambar
                width: 80, height: 80,          // ← VARIABEL: ukuran gambar
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 80, height: 80,
                  color: Colors.grey[200],
                  child: Icon(Icons.restaurant, color: Colors.grey),
                ),
              ),
            ),
            // ═══ AKHIR [GAMBAR-KECIL] ═════════════════════










            SizedBox(width: 12),










            // ═══ [INFO-ITEM] ══════════════════════════════
            // Tampilan: Nama, deskripsi, porsi, harga di kanan gambar
            // ═══════════════════════════════════════════════
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(makanan.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
                  SizedBox(height: 4),
                  Text(makanan.description, style: TextStyle(fontSize: 12, color: Colors.grey), maxLines: 2, overflow: TextOverflow.ellipsis),
                  SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${makanan.quantity} porsi',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,
                          color: makanan.quantity > 0 ? Color(0xFFE07B39) : Colors.grey)),
                      Text(makanan.quantity > 0 ? makanan.totalFormatted : 'Rp 0',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green)),
                    ],
                  ),
                  SizedBox(height: 2),
                  Text(makanan.hargaFormatted, style: TextStyle(fontSize: 11, color: Colors.grey)),
                ],
              ),
            ),
            // ═══ AKHIR [INFO-ITEM] ════════════════════════










          ],
        ),
      ),
    );
  }
}
// ═══ AKHIR [KARTU-MENU] ════════════════════════════════════
