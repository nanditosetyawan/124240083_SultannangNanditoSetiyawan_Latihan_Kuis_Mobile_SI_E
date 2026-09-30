import 'package:flutter/material.dart';
import '../models/food_item.dart'; // ← Import model makanan

// ═════════════════════════════════════════════════════════════════════════════
// FILE: lib/independent/list_menu_resto.dart
// TAMPILAN: Daftar Makanan / List Menu Resto yang Bisa Di-scroll (ListView)
// KETERKAITAN: Dipakai di `halaman_beranda.dart` sebagai isi `body: ListMenuRestoWidget(...)`
//              Menautkan klik item ke Halaman Detail (`halaman_detail.dart`)
// METODE COPAS: Copas `ListView.builder` atau class `ListMenuRestoWidget` ini.
// ═════════════════════════════════════════════════════════════════════════════
//
// ✏️ PETUNJUK EDIT BESOK SAAT KUIS:
// 1. Jika nama Model besok lain (misal `Product` / `Menu`):
//    -> Ganti `FoodItem` dengan nama class model baru besok.
// 2. Jika nama variabel di model beda:
//    -> `item.name`        ganti -> `item.judul` / `item.nama`
//    -> `item.description` ganti -> `item.deskripsi` / `item.detail`
//    -> `item.imageUrl`    ganti -> `item.foto` / `item.image`
//    -> `item.price`       ganti -> `item.harga`
// 3. Menautkan ke Halaman Detail:
//    -> Pada `onTap: () { Navigator.push(...); }` passing objek `item`
// ═════════════════════════════════════════════════════════════════════════════

class ListMenuRestoWidget extends StatelessWidget {
  final List<FoodItem> daftarMakanan;
  final Function(FoodItem)? onKlikItem;

  const ListMenuRestoWidget({
    super.key,
    required this.daftarMakanan,
    this.onKlikItem,
  });

  @override
  Widget build(BuildContext context) {
    // 📌 List Makanan yang Bisa Di-scroll Ke Bawah
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      itemCount: daftarMakanan.length, // ← Jumlah item sesuai data
      itemBuilder: (context, indeks) {
        final item = daftarMakanan[indeks]; // ← Ambil 1 data makanan

        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            // 📌 AKSI KLIK: Berpindah ke Halaman Detail Makanan
            onTap: () {
              if (onKlikItem != null) {
                onKlikItem!(item);
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  // ── 1. GAMBAR MAKANAN ──
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      item.imageUrl, // ← EDIT: Nama field foto di model
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 80,
                        height: 80,
                        color: Colors.grey[300],
                        child: const Icon(Icons.fastfood, color: Colors.grey),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  // ── 2. NAMA, DESKRIPSI & HARGA MAKANAN ──
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Nama Makanan
                        Text(
                          item.name, // ← EDIT: Nama field nama di model
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),

                        // Deskripsi Singkat
                        Text(
                          item.description, // ← EDIT: Nama field deskripsi
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 6),

                        // Harga Makanan
                        Text(
                          item.hargaFormatted, // ← EDIT: Teks format harga
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ── 3. ICON PANAH KANAN / DETAIL ──
                  const Icon(
                    Icons.chevron_right,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
