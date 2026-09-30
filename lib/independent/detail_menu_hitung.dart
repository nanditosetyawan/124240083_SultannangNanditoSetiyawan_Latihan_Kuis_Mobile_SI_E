import 'package:flutter/material.dart';
import '../models/food_item.dart'; // ← Import model makanan

// ═════════════════════════════════════════════════════════════════════════════
// FILE: lib/independent/detail_menu_hitung.dart
// TAMPILAN: Detail Makanan + Form Input Angka Porsi + HITUNG TOTAL HARGA
// KETERKAITAN: DIPANGGUL OLEH `list_menu_resto.dart` ATAU `halaman_beranda.dart`
//              saat 1 menu makanan dipencet (Navigator.push).
// METODE COPAS: Copas class `DetailMenuHitungWidget` ini ke halaman detail.
// ═════════════════════════════════════════════════════════════════════════════
//
// ✏️ PETUNJUK RUMUS HITUNG & EDIT BESOK SAAT KUIS:
// 1. Rumus Hitung Total -> `int total = _porsi * widget.item.price;`
//    - Jika ada Diskon 10%: `int total = (_porsi * widget.item.price * 0.9).toInt();`
//    - Jika ada Pajak 11% : `int total = (_porsi * widget.item.price * 1.11).toInt();`
// 2. Input Angka Porsi -> Menggunakan `TextField` dengan `keyboardType: TextInputType.number`
//    atau Tombol Plus Minus (+ / -).
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
    // Default jumlah porsi awal = 1 (atau sesuai item.quantity)
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── 1. GAMBAR BESAR MAKANAN ──
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
                  // ── 2. NAMA & HARGA SATUAN ──
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

                  // ── 3. DESKRIPSI MAKANAN ──
                  Text(
                    widget.item.description,
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),

                  const Divider(height: 32),

                  // ── 4. FIELD FORM / INPUT ANGKA JUMLAH PORSI ──
                  const Text(
                    'Jumlah Porsi:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),

                  Row(
                    children: [
                      // Tombol Kurang (-)
                      IconButton.outlined(
                        icon: const Icon(Icons.remove),
                        onPressed: _jumlahPorsi > 1
                            ? () {
                                setState(() {
                                  _jumlahPorsi--;
                                });
                              }
                            : null,
                      ),

                      // Teks/Form Angka Jumlah Porsi
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

                      // Tombol Tambah (+)
                      IconButton.outlined(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            _jumlahPorsi++;
                          });
                        },
                      ),
                    ],
                  ),

                  const Divider(height: 32),

                  // ── 5. HASIL HITUNG TOTAL HARGA REALTIME ──
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

                  // ── 6. TOMBOL SIMPAN / MESAN ──
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
    );
  }
}
