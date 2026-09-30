import 'package:flutter/material.dart';
import '../models/food_item.dart'; // ← Import model makanan

// ═════════════════════════════════════════════════════════════════════════════
// FILE: lib/independent/list_menu_resto.dart
// 📌 FUNGSI: List Makanan / Menu Resto yang Bisa Di-scroll Ke Bawah
//
// 🎯 LOKASI PASANG DI FILE TUJUAN:
//    Dipasang di file `halaman_beranda.dart` -> pada properti `body:` di Scaffold.
//
// ═════════════════════════════════════════════════════════════════════════════
// ❓ JAWABAN SINGKAT: APAKAH COPAS SELURUH FILE ATAU KODENYA SAJA?
//
// 🔹 CARA 1 (COPAS SELURUH FILE 100% - TANPA ADA YANG DIBUANG):
//    1. Buat file baru `lib/independent/list_menu_resto.dart` di kuis besok.
//    2. COPAS SELURUH ISI FILE INI DARI BARIS 1 SAMPAI BARIS TERAKHIR.
//    3. Di `halaman_beranda.dart`, panggil widget ini pada `Scaffold`:
//       body: ListMenuRestoWidget(
//         daftarMakanan: FoodItem.daftarMakanan,
//         onKlikItem: (item) {
//           Navigator.push(context, MaterialPageRoute(builder: (_) => HalamanDetail(item: item)));
//         },
//       ),
//
// 🔹 CARA 2 (JIKA MALAS BUAT FILE BARU - COPAS POTONGAN KODENYA SAJA):
//    Copy HANYA blok di bawah ini (dari ListView.builder sampai kurung tutup)
//    dan tempel di sebelah `body:` pada `halaman_beranda.dart`.
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
    // ⬇️ ✂️ [POTONGAN KODE - JIKA CARA 2] ✂️ ⬇️
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      itemCount: daftarMakanan.length, // ← Jumlah item makanan
      itemBuilder: (context, indeks) {
        final item = daftarMakanan[indeks];

        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              if (onKlikItem != null) {
                onKlikItem!(item);
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  // 1. Gambar Makanan
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      item.imageUrl, // ← EDIT: Field foto model
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

                  // 2. Nama, Deskripsi & Harga
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name, // ← EDIT: Field nama model
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item.description, // ← EDIT: Field deskripsi
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          item.hargaFormatted, // ← EDIT: Format harga
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // 3. Chevron Icon
                  const Icon(Icons.chevron_right, color: Colors.grey),
                ],
              ),
            ),
          ),
        );
      },
    );
    // ⬆️ ✂️ [AKHIR POTONGAN KODE] ⬆️
  }
}
