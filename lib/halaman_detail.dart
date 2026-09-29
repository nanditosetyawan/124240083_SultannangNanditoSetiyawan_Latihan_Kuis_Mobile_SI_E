// ============================================================
// FILE: halaman_detail.dart
// Fungsi: Halaman detail makanan - pengguna bisa ubah jumlah porsi
//         dan menyimpan pemesanan (simpan ke SQLite)
// Dipakai di: halaman_beranda.dart (dibuka via Navigator.push)
// ============================================================

// ─── IMPORT: Paket wajib Flutter ──────────────────────────────
import 'package:flutter/material.dart';

// ─── IMPORT: Model data makanan ───────────────────────────────
import 'models/food_item.dart'; // ← untuk pakai class FoodItem
                               //   (sama seperti contoh/lib → import 'models/data.dart')

// ─── IMPORT: Database helper (untuk simpan ke SQLite) ─────────
// Aktifkan baris ini jika sudah menambahkan sqflite ke pubspec.yaml
// import 'database_helper.dart';

// ════════════════════════════════════════════════════════════════
// CLASS: HalamanDetail
// Jenis: StatefulWidget (porsi & total harga bisa berubah → butuh setState)
// Fungsi: Menampilkan detail makanan + input porsi + tombol simpan
// ════════════════════════════════════════════════════════════════
class HalamanDetail extends StatefulWidget {
  // ════════════════════════════════════════════════════════════
  // ⚠️ DEKLARASI: Variabel penerima data dari halaman beranda
  // Wajib ada di sini agar halaman ini bisa menerima objek makanan
  // ════════════════════════════════════════════════════════════
  final FoodItem makanan; // ← menerima objek makanan yang diklik di beranda

  const HalamanDetail({super.key, required this.makanan}); // ← required = wajib dikirim

  @override
  State<HalamanDetail> createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {
  // ════════════════════════════════════════════════════════════
  // ⚠️ DEKLARASI STATE - data yang bisa berubah di halaman ini
  // ════════════════════════════════════════════════════════════

  // ─── DEKLARASI: Controller untuk TextField input porsi ───────
  // ⚠️ Controller WAJIB dideklarasikan di sini (di dalam State)
  // Controller adalah "penghubung" antara kode dan TextField di UI
  late TextEditingController _kontrolerPorsi;

  // ─── DEKLARASI: Menyimpan jumlah porsi saat ini ────────────
  late int _porsiSaatIni;

  @override
  void initState() {
    // ← initState: dipanggil SEKALI saat halaman pertama dibuka
    super.initState();
    _porsiSaatIni = widget.makanan.quantity; // ← ambil porsi dari data makanan

    // ─── Inisialisasi controller dengan porsi saat ini ────────
    // Teks di TextField langsung terisi dengan jumlah porsi sekarang
    _kontrolerPorsi = TextEditingController(
      text: _porsiSaatIni == 0 ? '' : _porsiSaatIni.toString(),
    );
  }

  @override
  void dispose() {
    // ← dispose: dipanggil saat halaman ditutup
    // WAJIB dispose controller agar tidak bocor memori
    _kontrolerPorsi.dispose();
    super.dispose();
  }

  // ─── GETTER: Hitung total harga berdasarkan _porsiSaatIni ────
  int get _totalHarga => _porsiSaatIni * widget.makanan.price;

  // ─── FUNGSI: Simpan pemesanan (kirim data balik ke beranda) ──
  Future<void> _simpanPemesanan() async {
    if (_porsiSaatIni <= 0) {
      // ← Jika porsi 0 atau kurang, tampilkan peringatan
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Masukkan jumlah porsi minimal 1!'), // ← EDIT: pesan error
          backgroundColor: Colors.red,
        ),
      );
      return; // ← keluar dari fungsi, tidak lanjut simpan
    }

    // ─── SIMPAN KE SQLITE (aktifkan jika pakai database) ──────
    // Uncomment kode di bawah jika sudah setup DatabaseHelper:
    //
    // await DatabaseHelper.simpanPemesanan({
    //   'namaMakanan': widget.makanan.name,
    //   'jumlahPorsi': _porsiSaatIni,
    //   'totalHarga': _totalHarga,
    // });

    // ─── Tampilkan pesan berhasil ──────────────────────────────
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Pemesanan ${widget.makanan.name} disimpan!'), // ← EDIT: pesan sukses
        backgroundColor: Color(0xFFE07B39), // ← EDIT: warna snackbar
      ),
    );

    // ─── KIRIM DATA KEMBALI ke halaman beranda ─────────────────
    // Navigator.pop = tutup halaman detail
    // Argumen ke-2 = data yang dikirim balik ke halaman pengirim (beranda)
    // Di beranda, ini ditangkap dengan: final porsiKembali = await Navigator.push(...)
    Navigator.pop(context, _porsiSaatIni); // ← kirim porsi terbaru ke beranda
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ─── BACKGROUND HALAMAN ──────────────────────────────────
      backgroundColor: Color(0xFFF9F4EE), // ← EDIT: warna background halaman

      // ─── WIDGET: AppBar - bar judul dengan tombol kembali ────
      appBar: AppBar(
        title: Text(
          widget.makanan.name,             // ← judul = nama makanan yang diklik
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFFE07B39), // ← EDIT: warna AppBar
        iconTheme: IconThemeData(color: Colors.white), // ← warna ikon back = putih
        centerTitle: true,
      ),
      // ─── AKHIR AppBar ────────────────────────────────────────

      // ─── WIDGET: SingleChildScrollView - bisa di-scroll ───────
      // Mencegah overflow ketika keyboard muncul
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16), // ← EDIT: jarak dari tepi layar

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // ← rata kiri

          children: [
            // ════════════════════════════════════════════════════
            // BAGIAN 1: Gambar makanan besar di atas
            // ════════════════════════════════════════════════════

            // ─── WIDGET: ClipRRect - gambar dengan sudut bulat ──
            ClipRRect(
              borderRadius: BorderRadius.circular(16), // ← EDIT: sudut gambar
              child: Image.network(
                widget.makanan.imageUrl, // ← URL gambar makanan
                width: double.infinity,  // ← lebar penuh layar
                height: 220,             // ← EDIT: tinggi gambar
                fit: BoxFit.cover,       // ← gambar mengisi penuh (dipotong jika perlu)
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: 220,
                    color: Colors.grey[200],
                    child: Icon(Icons.restaurant, size: 80, color: Colors.grey),
                  );
                },
              ),
            ),
            // ─── AKHIR Gambar ────────────────────────────────────

            SizedBox(height: 20),

            // ════════════════════════════════════════════════════
            // BAGIAN 2: Informasi makanan (nama, harga, deskripsi)
            // ════════════════════════════════════════════════════

            // ─── NAMA MAKANAN ──────────────────────────────────────
            Text(
              widget.makanan.name, // ← nama makanan
              style: TextStyle(
                fontSize: 24,               // ← EDIT: ukuran font nama
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            SizedBox(height: 4),

            // ─── HARGA PER PORSI ───────────────────────────────────
            Text(
              widget.makanan.hargaFormatted, // ← "Rp 15.000 / porsi"
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFFE07B39),   // ← EDIT: warna harga (oranye)
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: 12),

            // ─── DESKRIPSI MAKANAN ─────────────────────────────────
            Text(
              widget.makanan.description, // ← deskripsi makanan
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],    // ← EDIT: warna deskripsi
                height: 1.5,               // ← jarak antar baris teks
              ),
            ),

            SizedBox(height: 24),

            // ════════════════════════════════════════════════════
            // BAGIAN 3: Input jumlah porsi
            // ════════════════════════════════════════════════════

            // ─── WIDGET: TextField - input jumlah porsi ───────────
            // ⚠️ Controller _kontrolerPorsi WAJIB sudah dideklarasikan di atas
            TextField(
              controller: _kontrolerPorsi,          // ← pasang controller
              keyboardType: TextInputType.number,   // ← keyboard angka saja
              decoration: InputDecoration(
                labelText: 'Jumlah (porsi)',         // ← EDIT: label input
                labelStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(
                  Icons.format_list_bulleted,        // ← EDIT: ikon di kiri input
                  color: Color(0xFFE07B39),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8), // ← EDIT: sudut border
                ),
                // ← border saat TextField aktif/diklik
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Color(0xFFE07B39), // ← EDIT: warna border aktif
                    width: 2,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,      // ← EDIT: warna background input
              ),
              onChanged: (nilai) {
                // ← Dipanggil setiap kali isi TextField berubah
                setState(() {
                  // ← update state → tampilan total harga otomatis berubah
                  _porsiSaatIni = int.tryParse(nilai) ?? 0;
                  // int.tryParse = konversi String ke int, jika gagal hasilnya null
                  // ?? 0 = kalau null, pakai 0 sebagai default
                });
              },
            ),
            // ─── AKHIR TextField ──────────────────────────────────

            SizedBox(height: 20),

            // ════════════════════════════════════════════════════
            // BAGIAN 4: Tampil total harga
            // ════════════════════════════════════════════════════

            // ─── WIDGET: Row - label "Total" dan harga total ──────
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // ← kiri & kanan
              children: [
                Text(
                  'Total',                             // ← EDIT: label total
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                // ─── TOTAL HARGA (otomatis berubah saat porsi berubah) ───
                Text(
                  _porsiSaatIni > 0
                      ? 'Rp ${formatHarga(_totalHarga)}' // ← tampil total jika ada porsi
                      : 'Rp 0',                          // ← tampil 0 jika tidak ada
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green, // ← EDIT: warna total harga
                  ),
                ),
              ],
            ),
            // ─── AKHIR Total Harga ────────────────────────────────

            SizedBox(height: 30),

            // ════════════════════════════════════════════════════
            // BAGIAN 5: Tombol simpan pemesanan
            // ════════════════════════════════════════════════════

            // ─── WIDGET: ElevatedButton - tombol simpan ───────────
            SizedBox(
              width: double.infinity, // ← lebar tombol penuh layar
              child: ElevatedButton(
                onPressed: _simpanPemesanan, // ← panggil fungsi simpan
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFE07B39), // ← EDIT: warna tombol
                  foregroundColor: Colors.white,      // ← warna teks & ikon tombol
                  padding: EdgeInsets.symmetric(vertical: 16), // ← EDIT: tinggi tombol
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // ← EDIT: sudut tombol
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_cart),  // ← EDIT: ikon tombol
                    SizedBox(width: 8),
                    Text(
                      'Simpan Pemesanan',       // ← EDIT: teks tombol
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // ─── AKHIR Tombol ──────────────────────────────────────
          ],
        ),
      ),
      // ─── AKHIR SingleChildScrollView ──────────────────────────
    );
  }
}
