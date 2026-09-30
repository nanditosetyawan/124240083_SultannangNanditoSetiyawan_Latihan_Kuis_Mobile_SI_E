# PETA NAVIGASI KODE - CTRL+F CHEATSHEET

## 🗺️ RINGKASAN KE-6 FILE INDEPENDENT (SIAP KUIS):

| File di `lib/independent/` | Tujuan Visual & Fungsi | Tempat Memasang Kode |
|---|---|---|
| 📄 [`bottom_navigation.dart`](file:///d:/DITO/kuliah/Semester%205/prak%20mobile/lat_responsi/latres/lib/independent/bottom_navigation.dart) | Memasang Bottom Bar (Resto & Profil) | `root.dart` pada `bottomNavigationBar:` |
| 📄 [`header_beranda.dart`](file:///d:/DITO/kuliah/Semester%205/prak%20mobile/lat_responsi/latres/lib/independent/header_beranda.dart) | Memasang Header Resto (AppBar "NourishBowl") | `halaman_beranda.dart` pada `appBar:` |
| 📄 [`list_menu_resto.dart`](file:///d:/DITO/kuliah/Semester%205/prak%20mobile/lat_responsi/latres/lib/independent/list_menu_resto.dart) | Memasang Daftar Makanan ListView (Bisa di-scroll) | `halaman_beranda.dart` pada `body:` |
| 📄 [`header_profil.dart`](file:///d:/DITO/kuliah/Semester%205/prak%20mobile/lat_responsi/latres/lib/independent/header_profil.dart) | Memasang Header Profil (Foto Bulat + Nama + Email/NIM) | `halaman_profil.dart` pada `Column(children: [...])` bagian atas |
| 📄 [`tombol_menu_profil.dart`](file:///d:/DITO/kuliah/Semester%205/prak%20mobile/lat_responsi/latres/lib/independent/tombol_menu_profil.dart) | Memasang List Tombol Navigasi Profil (Resto, Keranjang, Logout) | `halaman_profil.dart` pada `Column(children: [...])` bagian bawah |
| 📄 [`detail_menu_hitung.dart`](file:///d:/DITO/kuliah/Semester%205/prak%20mobile/lat_responsi/latres/lib/independent/detail_menu_hitung.dart) | Memasang Halaman Detail Makanan + Form Input Porsi + Hitung Total Harga Realtime | Full 1 file `halaman_detail.dart` |

---

## Cara Pakai Saat Kuis:
1. Buka file yang dibutuhkan
2. Tekan `Ctrl + F`
3. Ketik tag dalam kurung siku `[...]` dari tabel di bawah
4. Copas dari tag `═══ [NAMA] ═══` sampai `═══ AKHIR [NAMA] ═══`

---

## 🏗️ ARSITEKTUR FILE

```
lib/
├── main.dart                 ← [ENTRY-POINT] titik mulai app
├── root.dart                 ← [BOTTOM-NAV] navigasi bawah
├── halaman_beranda.dart      ← [LIST-MENU] [KARTU-MENU] daftar menu
├── halaman_detail.dart       ← [GAMBAR-BESAR] [INPUT-PORSI] [HITUNG-TOTAL] detail item
├── halaman_profil.dart       ← [FOTO-PROFIL-BULAT] [NAMA-PROFIL] [KARTU-TOMBOL] profil
├── halaman_keranjang.dart    ← [LIST-PESANAN] [BOX-TOTAL] keranjang
├── independent/              ← FOLDER COMPONENT INDEPENDENT SIAP COPAS
│   ├── bottom_navigation.dart
│   ├── header_beranda.dart
│   ├── list_menu_resto.dart
│   ├── header_profil.dart
│   ├── tombol_menu_profil.dart
│   └── detail_menu_hitung.dart
└── models/
    └── food_item.dart        ← DATA ITEM (dari sekolah, jangan diubah strukturnya)
```

---

## 🔍 DAFTAR TAG PENCARIAN (Ctrl+F)

### root.dart
| Tag | Tampilan | Yang Dilihat di HP |
|-----|----------|--------------------|
| `[BOTTOM-NAV]` | Bar navigasi di BAWAH layar | Tab "Menu" dan "Profil" |

### halaman_beranda.dart
| Tag | Tampilan | Yang Dilihat di HP |
|-----|----------|--------------------|
| `[APPBAR]` | Bar oranye ATAS | Judul "Menu Resto" |
| `[LIST-MENU]` | Daftar scroll ke bawah | Semua kartu makanan |
| `[KARTU-MENU]` | 1 kotak putih = 1 menu | Gambar + nama + harga |
| `[GAMBAR-KECIL]` | Foto kecil 80x80 di kiri kartu | Thumbnail makanan |
| `[INFO-ITEM]` | Teks di kanan gambar | Nama, deskripsi, porsi, harga |

### halaman_detail.dart
| Tag | Tampilan | Yang Dilihat di HP |
|-----|----------|--------------------|
| `[APPBAR-DETAIL]` | Bar oranye atas + tombol back | Nama makanan |
| `[GAMBAR-BESAR]` | Foto besar lebar penuh | Gambar makanan besar |
| `[JUDUL-HARGA]` | Nama + harga satuan | "Nasi Goreng" + "Rp 15.000/porsi" |
| `[INPUT-PORSI]` | Kotak input angka | "Jumlah (porsi)" |
| `[HITUNG-TOTAL]` | Baris total harga | "Total    Rp 30.000" |
| `[TOMBOL-SIMPAN]` | Tombol oranye besar | "Simpan Pemesanan" |

### halaman_profil.dart
| Tag | Tampilan | Yang Dilihat di HP |
|-----|----------|--------------------|
| `[APPBAR-PROFIL]` | Bar oranye atas | Judul "Profil" |
| `[FOTO-PROFIL-BULAT]` | Lingkaran dengan ikon orang | Avatar bulat |
| `[NAMA-PROFIL]` | Nama besar + jabatan kecil | "Dito" + "BOS Hotel" |
| `[TOMBOL-MENU-RESTO]` | Kartu klik → pindah tab Menu | Ikon garpu + "Menu Resto" |
| `[TOMBOL-PEMESANAN]` | Kartu klik → buka keranjang | Ikon nota + "Pemesanan" |
| `[KARTU-TOMBOL]` | Widget kotak ikon+teks (reusable) | Dipakai oleh 2 tombol di atas |

### halaman_keranjang.dart
| Tag | Tampilan | Yang Dilihat di HP |
|-----|----------|--------------------|
| `[APPBAR-KERANJANG]` | Bar oranye + tombol back | "Keranjang Pesanan" |
| `[TAMPILAN-KOSONG]` | Ikon keranjang + teks | Saat belum ada pesanan |
| `[LIST-PESANAN]` | Daftar item yang dipesan | Kartu-kartu pesanan |
| `[BOX-TOTAL]` | Kotak putih bawah | Total harga + tombol "Pesan Sekarang" |

---

## 🏷️ DAFTAR VARIABEL (Yang Perlu Diganti Jika Ganti Tema)

### Di models/food_item.dart (DATA)
| Variabel | Isi Sekarang | Ganti Jadi (contoh tema Pakaian) |
|----------|-------------|----------------------------------|
| `name` | 'Nasi Goreng' | 'Kemeja Batik' |
| `description` | 'Nasi goreng spesial...' | 'Kemeja motif batik modern...' |
| `price` | 15000 | 150000 |
| `imageUrl` | URL gambar makanan | URL gambar pakaian |
| `quantity` | 0 | 0 |
| `daftarMakanan` | List 5 makanan | List item pakaian |
| `hargaFormatted` | 'Rp 15.000 / porsi' | Ganti '/ porsi' di getter |

### Di halaman_beranda.dart (LIST)
| Variabel | Isi Sekarang | Ganti Jadi |
|----------|-------------|------------|
| `_daftarMakanan` | FoodItem.daftarMakanan | FoodItem.daftarPakaian (ganti di model) |
| `'Menu Resto'` | Judul AppBar | 'Katalog Pakaian' |
| `'${makanan.quantity} porsi'` | Teks porsi | '${makanan.quantity} pcs' |

### Di halaman_detail.dart (DETAIL)
| Variabel | Isi Sekarang | Ganti Jadi |
|----------|-------------|------------|
| `_porsiSaatIni` | Jumlah porsi | Jumlah pcs |
| `_totalHarga` | porsi × harga | pcs × harga |
| `'Jumlah (porsi)'` | Label input | 'Jumlah (pcs)' |
| `'Simpan Pemesanan'` | Teks tombol | 'Tambah ke Keranjang' |

### Di halaman_profil.dart (PROFIL)
| Variabel | Isi Sekarang | Ganti Jadi |
|----------|-------------|------------|
| `'Dito'` | Nama user | Nama kamu |
| `'BOS Hotel'` | Jabatan | Peran baru |
| `'Menu Resto'` | Judul kartu | 'Katalog' |
| `'Pemesanan'` | Judul kartu | 'Keranjang' |

---

## 📋 CARA COPAS WIDGET

### Aturan Utama:
1. Cari tag `═══ [NAMA-TAG] ═══`
2. Copy dari tag itu sampai `═══ AKHIR [NAMA-TAG] ═══`
3. Baca keterangan "Syarat:" di bawah tag → ada file/variabel lain yang harus ikut

### Contoh: Mau copy AppBar
```
Ctrl+F → ketik [APPBAR]
Copy dari "appBar: AppBar(" sampai "// ═══ AKHIR [APPBAR]"
Paste di Scaffold halaman baru
Ganti teks dan warna sesuai kebutuhan
```

### Contoh: Mau copy input angka + hitung total
```
Ctrl+F → ketik [INPUT-PORSI]
Copy dari TextField sampai AKHIR [INPUT-PORSI]
Lalu Ctrl+F → [HITUNG-TOTAL]
Copy dari Row sampai AKHIR [HITUNG-TOTAL]
Paste kedua blok ke Column halaman baru
Tambahkan deklarasi _porsiSaatIni dan _kontrolerPorsi di class State
```

---

## 🔗 ALUR KONEKSI ANTAR FILE

```
main.dart
  └→ root.dart (home)
       ├→ [Tab 0] halaman_beranda.dart
       │    └→ klik kartu → Navigator.push → halaman_detail.dart
       │         └→ simpan → Navigator.pop(porsi) → kembali ke beranda
       └→ [Tab 1] halaman_profil.dart
            ├→ klik "Menu Resto" → pindah tab ke beranda (callback)
            └→ klik "Pemesanan" → Navigator.push → halaman_keranjang.dart
```

```
models/food_item.dart (DATA PUSAT)
  ↑ di-import oleh:
  ├── halaman_beranda.dart (baca daftarMakanan)
  ├── halaman_detail.dart  (baca 1 item, update quantity)
  └── halaman_keranjang.dart (filter quantity > 0)
```
