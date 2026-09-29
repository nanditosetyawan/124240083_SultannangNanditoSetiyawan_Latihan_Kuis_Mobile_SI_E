// ============================================================
// FILE: food_item.dart
// Fungsi: Model data makanan (blueprint/cetakan objek makanan)
// Dipakai di: halaman_beranda.dart, halaman_detail.dart
// ============================================================

// ════════════════════════════════════════════════════════════════
// CLASS: FoodItem (Model Makanan)
// Fungsi: Menyimpan semua data satu makanan (nama, harga, porsi, dll)
// Cara pakai: FoodItem nasiGoreng = FoodItem(name: 'Nasi Goreng', ...)
// ════════════════════════════════════════════════════════════════
class FoodItem {
  // ─── DEKLARASI: Properti/atribut data makanan ─────────────
  final String name;        // ← nama makanan (tidak bisa diubah = final)
  final String description; // ← deskripsi makanan (tidak bisa diubah = final)
  final String imageUrl;    // ← URL gambar makanan (tidak bisa diubah = final)
  int quantity;             // ← jumlah porsi (BISA diubah, tidak pakai final)
  final int price;          // ← harga per porsi dalam rupiah (tidak bisa diubah = final)

  // ─── CONSTRUCTOR: Cara membuat objek FoodItem baru ────────
  FoodItem({
    required this.name,        // ← required = wajib diisi saat membuat objek
    required this.description,
    required this.imageUrl,
    required this.quantity,
    required this.price,
  });

  // ─── GETTER: Hitung total harga (quantity × price) ────────
  // Cara pakai: makanan.totalHarga  (hasilnya int)
  int get totalHarga => quantity * price;

  // ─── GETTER: Format harga per porsi jadi "Rp 15.000" ──────
  // Cara pakai: makanan.hargaFormatted  (hasilnya String)
  String get hargaFormatted => 'Rp ${formatHarga(price)} / porsi';

  // ─── GETTER: Format total harga jadi "Rp 30.000" ──────────
  // Cara pakai: makanan.totalFormatted  (hasilnya String)
  String get totalFormatted => 'Rp ${formatHarga(totalHarga)}';

  // ════════════════════════════════════════════════════════════
  // DATA CONTOH: Daftar makanan yang ditampilkan di app
  // EDIT DI SINI untuk ubah/tambah/hapus menu makanan
  // ════════════════════════════════════════════════════════════
  static final List<FoodItem> daftarMakanan = [
    // ─── ITEM 1 ───────────────────────────────────────────────
    FoodItem(
      name: 'Nasi Goreng',              // ← EDIT: nama makanan
      description: 'Nasi goreng spesial dengan telur, ayam, dan kerupuk.', // ← EDIT: deskripsi
      imageUrl:
          'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=800&q=80&auto=format&fit=crop', // ← EDIT: URL gambar
      quantity: 0,                      // ← porsi awal = 0
      price: 15000,                     // ← EDIT: harga dalam rupiah (tanpa titik)
    ),
    // ─── ITEM 2 ───────────────────────────────────────────────
    FoodItem(
      name: 'Mie Goreng',
      description: 'Mie goreng jawa dengan bumbu khas dan sayuran segar.',
      imageUrl:
          'https://images.unsplash.com/photo-1473093295043-cdd812d0e601?w=800&q=80&auto=format&fit=crop',
      quantity: 0,
      price: 12000,
    ),
    // ─── ITEM 3 ───────────────────────────────────────────────
    FoodItem(
      name: 'Ayam Bakar',
      description: 'Ayam bakar bumbu kecap disajikan dengan sambal dan lalapan.',
      imageUrl:
          'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=800&q=80&auto=format&fit=crop',
      quantity: 0,
      price: 25000,
    ),
    // ─── ITEM 4 ───────────────────────────────────────────────
    FoodItem(
      name: 'Es Teh',
      description: 'Teh manis dingin yang menyegarkan.',
      imageUrl:
          'https://images.unsplash.com/photo-1544787219-7f47ccb76574?w=800&q=80&auto=format&fit=crop',
      quantity: 0,
      price: 5000,
    ),
    // ─── ITEM 5 ───────────────────────────────────────────────
    FoodItem(
      name: 'Es Jeruk',
      description: 'Jeruk peras asli dingin dengan es batu.',
      imageUrl:
          'https://images.unsplash.com/photo-1600271886742-f049cd451bba?w=800&q=80&auto=format&fit=crop',
      quantity: 0,
      price: 6000,
    ),
    // ─── TAMBAH ITEM BARU: Copy blok di atas, paste di sini ──
  ];
}

// ─── FUNGSI HELPER: Format angka jadi harga dengan titik ──────
// Contoh: 15000 → "15.000"
// Cara pakai: formatHarga(15000) → hasilnya String "15.000"
String formatHarga(int nilai) {
  return nilai.toString().replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+$)'),
        (m) => '${m[1]}.',
      );
}