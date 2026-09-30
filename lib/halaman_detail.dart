// ═══════════════════════════════════════════════════════════
// FILE: halaman_detail.dart
// Fungsi: Halaman detail saat klik 1 item dari list
//         Menampilkan foto besar, harga, input porsi, hitung total
// Dibuka dari: halaman_beranda.dart → Navigator.push
// Data dari: FoodItem (dikirim via parameter 'makanan')
// ═══════════════════════════════════════════════════════════
import 'package:flutter/material.dart';
import 'models/food_item.dart';

class HalamanDetail extends StatefulWidget {
  final FoodItem makanan; // ← VARIABEL: data item yang dikirim dari beranda

  const HalamanDetail({super.key, required this.makanan});
  @override
  State<HalamanDetail> createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {
  // VARIABEL: _porsiSaatIni → jumlah porsi yang diinput user
  late int _porsiSaatIni;
  // VARIABEL: _kontrolerPorsi → mengontrol isi TextField angka
  late TextEditingController _kontrolerPorsi;

  @override
  void initState() {
    super.initState();
    _porsiSaatIni = widget.makanan.quantity;
    _kontrolerPorsi = TextEditingController(
      text: _porsiSaatIni == 0 ? '' : _porsiSaatIni.toString(),
    );
  }

  @override
  void dispose() {
    _kontrolerPorsi.dispose();
    super.dispose();
  }

  // VARIABEL: _totalHarga → otomatis dihitung dari porsi × harga satuan
  int get _totalHarga => _porsiSaatIni * widget.makanan.price;

  // Fungsi simpan: validasi → snackbar → kirim porsi kembali ke beranda
  void _simpanPemesanan() {
    if (_porsiSaatIni <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Masukkan jumlah porsi minimal 1!'), backgroundColor: Colors.red),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Pemesanan ${widget.makanan.name} disimpan!'), backgroundColor: Color(0xFFE07B39)),
    );
    Navigator.pop(context, _porsiSaatIni); // ← kirim porsi kembali ke halaman sebelumnya
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F4EE),










      // ═══ [APPBAR-DETAIL] ═════════════════════════════════
      // Tampilan: Bar oranye atas dengan nama item + tombol back
      // Copas: Ambil dari appBar sampai AKHIR APPBAR-DETAIL
      // ═════════════════════════════════════════════════════
      appBar: AppBar(
        title: Text(widget.makanan.name,       // ← VARIABEL: judul = nama item
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Color(0xFFE07B39),    // ← VARIABEL: warna AppBar
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      // ═══ AKHIR [APPBAR-DETAIL] ═══════════════════════════










      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [










            // ═══ [GAMBAR-BESAR] ════════════════════════════
            // Tampilan: Foto item besar lebar penuh di atas halaman detail
            // Copas: Ambil dari ClipRRect sampai AKHIR GAMBAR-BESAR
            // VARIABEL: widget.makanan.imageUrl → URL gambar
            // ════════════════════════════════════════════════
            ClipRRect(
              borderRadius: BorderRadius.circular(16), // ← VARIABEL: sudut gambar
              child: Image.network(
                widget.makanan.imageUrl,                // ← VARIABEL: URL gambar
                width: double.infinity,
                height: 220,                           // ← VARIABEL: tinggi gambar
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: double.infinity, height: 220,
                  color: Colors.grey[200],
                  child: Icon(Icons.restaurant, size: 80, color: Colors.grey),
                ),
              ),
            ),
            // ═══ AKHIR [GAMBAR-BESAR] ══════════════════════










            SizedBox(height: 20),










            // ═══ [JUDUL-HARGA] ═════════════════════════════
            // Tampilan: Nama item besar + harga satuan oranye
            // Copas: Ambil dari Text nama sampai AKHIR JUDUL-HARGA
            // ════════════════════════════════════════════════
            Text(widget.makanan.name,          // ← VARIABEL: nama item
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87)),
            SizedBox(height: 4),
            Text(widget.makanan.hargaFormatted, // ← VARIABEL: harga satuan formatted
              style: TextStyle(fontSize: 16, color: Color(0xFFE07B39), fontWeight: FontWeight.w600)),
            SizedBox(height: 12),
            Text(widget.makanan.description,   // ← VARIABEL: deskripsi item
              style: TextStyle(fontSize: 14, color: Colors.grey[700], height: 1.5)),
            // ═══ AKHIR [JUDUL-HARGA] ═══════════════════════










            SizedBox(height: 24),










            // ═══ [INPUT-PORSI] ═════════════════════════════
            // Tampilan: Kotak input angka "Jumlah (porsi)"
            // Copas: Ambil dari TextField sampai AKHIR INPUT-PORSI
            // Syarat: Butuh _kontrolerPorsi (TextEditingController)
            //         Butuh _porsiSaatIni (int) + setState
            // ════════════════════════════════════════════════
            TextField(
              controller: _kontrolerPorsi,      // ← VARIABEL: controller input
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Jumlah (porsi)',     // ← VARIABEL: placeholder
                labelStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.format_list_bulleted, color: Color(0xFFE07B39)),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xFFE07B39), width: 2),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              onChanged: (nilai) {
                setState(() {
                  _porsiSaatIni = int.tryParse(nilai) ?? 0;
                  // ↑ saat user ketik angka → _porsiSaatIni berubah
                  //   → _totalHarga otomatis ikut berubah (karena getter)
                  //   → setState membuat tampilan rebuild
                });
              },
            ),
            // ═══ AKHIR [INPUT-PORSI] ═══════════════════════










            SizedBox(height: 20),










            // ═══ [HITUNG-TOTAL] ════════════════════════════
            // Tampilan: Baris "Total" di kiri + "Rp xx.xxx" di kanan
            // Copas: Ambil dari Row sampai AKHIR HITUNG-TOTAL
            // Proses hitung: _totalHarga = _porsiSaatIni × widget.makanan.price
            //   (didefinisikan di getter _totalHarga di atas class ini)
            // ════════════════════════════════════════════════
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
                Text(
                  _porsiSaatIni > 0 ? 'Rp ${formatHarga(_totalHarga)}' : 'Rp 0',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
                ),
              ],
            ),
            // ═══ AKHIR [HITUNG-TOTAL] ══════════════════════










            SizedBox(height: 30),










            // ═══ [TOMBOL-SIMPAN] ═══════════════════════════
            // Tampilan: Tombol oranye penuh "Simpan Pemesanan"
            // Copas: Ambil dari SizedBox sampai AKHIR TOMBOL-SIMPAN
            // Aksi: Validasi → SnackBar → Navigator.pop (kirim data balik)
            // ════════════════════════════════════════════════
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _simpanPemesanan,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFE07B39), // ← VARIABEL: warna tombol
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_cart),          // ← VARIABEL: ikon tombol
                    SizedBox(width: 8),
                    Text('Simpan Pemesanan',            // ← VARIABEL: teks tombol
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            // ═══ AKHIR [TOMBOL-SIMPAN] ═════════════════════










          ],
        ),
      ),
    );
  }
}
