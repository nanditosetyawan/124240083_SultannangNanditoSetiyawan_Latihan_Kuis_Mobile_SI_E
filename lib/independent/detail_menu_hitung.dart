import 'package:flutter/material.dart';
import '../models/food_item.dart'; // ← Import model makanan

// ═════════════════════════════════════════════════════════════════════════════
// FILE: lib/independent/detail_menu_hitung.dart
// 📌 FUNGSI: Detail Makanan + Input Porsi + PROSES HITUNG TOTAL HARGA REALTIME
//
// 🎯 LOKASI TEMPEL DI FILE TUJUAN (`halaman_detail.dart`):
//    Dipanggil oleh `list_menu_resto.dart` saat 1 item makanan diklik (`Navigator.push`).
//
// ═════════════════════════════════════════════════════════════════════════════
// ❓ JAWABAN SINGKAT: APAKAH KATA 'return' DICOPAS?
//    Untuk file detail ini, REKOMENDASI UTAMA adalah COPAS SELURUH FILE 100% (CARA 1).
//
// 📌 CARA PANGGUL / BUKA HALAMAN DETAIL:
//    Navigator.push(context, MaterialPageRoute(
//      builder: (_) => DetailMenuHitungWidget(item: item),
//    ));
// ═════════════════════════════════════════════════════════════════════════════
// 📋 2 CARA PAKAI SAAT KUIS:
//
// 🔹 CARA 1 (COPAS SELURUH FILE 100% - REKOMENDASI UTAMA):
//    1. Buat file baru `lib/independent/detail_menu_hitung.dart` di project kuis.
//    2. COPAS SELURUH ISI FILE INI DARI BARIS 1 SAMPAI BARIS TERAKHIR.
//
// 🔹 CARA 2 (JIKA MALAS BUAT FILE BARU):
//    Copas bagian `SingleChildScrollView(...)` di bawah ke `body:` `halaman_detail.dart`.
// ═════════════════════════════════════════════════════════════════════════════

class DetailMenuHitungWidget extends StatefulWidget {
  final FoodItem item;
  final Function(int porsiTotal)? onSimpanPesanan;

  const DetailMenuHitungWidget({
    super.key,
    required this.item,
    this.onSimpanPesanan,
  });

  @override
  State<DetailMenuHitungWidget> createState() => _DetailMenuHitungWidgetState();
}

class _DetailMenuHitungWidgetState extends State<DetailMenuHitungWidget> {
  late int _jumlahPorsi;

  @override
  void initState() {
    super.initState();
    _jumlahPorsi = widget.item.quantity > 0 ? widget.item.quantity : 1;
  }

  // 📌 RUMUS HITUNG TOTAL HARGA REALTIME
  int get _hitungTotalHarga {
    return _jumlahPorsi * widget.item.price; // ← EDIT: Rumus hitung total
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.name),
        backgroundColor: Colors.green,
      ),
      body: 

      // ⬇️ ✂️ [MULAI COPAS CARA 2 - DARI SINI (KATA 'body:' DI ATAS JANGAN DICOPAS)] ✂️ ⬇️
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Gambar Besar Makanan
            Image.network(
              widget.item.imageUrl, // ← EDIT: Field foto model
              width: double.infinity,
              height: 240,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 240,
                color: Colors.grey[300],
                child: const Icon(Icons.fastfood, size: 80, color: Colors.grey),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 2. Nama & Harga Satuan
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.item.name,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        'Rp ${formatHarga(widget.item.price)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // 3. Deskripsi Makanan
                  Text(
                    widget.item.description,
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),

                  const Divider(height: 32),

                  // 4. Input Angka Jumlah Porsi (+ / -)
                  const Text(
                    'Jumlah Porsi:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),

                  Row(
                    children: [
                      IconButton.outlined(
                        icon: const Icon(Icons.remove),
                        onPressed: _jumlahPorsi > 1
                            ? () => setState(() => _jumlahPorsi--)
                            : null,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 8),
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '$_jumlahPorsi',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton.outlined(
                        icon: const Icon(Icons.add),
                        onPressed: () => setState(() => _jumlahPorsi++),
                      ),
                    ],
                  ),

                  const Divider(height: 32),

                  // 5. Hasil Hitung Total Harga Realtime
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.green.shade200),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total Harga:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Rp ${formatHarga(_hitungTotalHarga)}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // 6. Tombol Simpan / Pesan
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        widget.item.quantity = _jumlahPorsi;
                        if (widget.onSimpanPesanan != null) {
                          widget.onSimpanPesanan!(_jumlahPorsi);
                        }
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Simpan Pesanan',
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
          ],
        ),
      ),
      // ⬆️ ✂️ [AKHIR COPAS CARA 2 - SAMPAI SINI] ⬆️
    );
  }
}
