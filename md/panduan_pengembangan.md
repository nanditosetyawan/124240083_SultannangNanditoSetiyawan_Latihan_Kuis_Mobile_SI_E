# Panduan Pengembangan Flutter (Versi Dasar & Sederhana)

Dokumen ini adalah aturan wajib dalam mengembangkan aplikasi Flutter kita. Kodingan harus sesingkat dan sesederhana mungkin.

## 1. Aturan Dasar Kodingan
- **Gaya Koding**: Gunakan kodingan Flutter tingkat dasar (variabel biasa, `Navigator.push` biasa). **DILARANG** menggunakan *shortcut* atau penulisan kode tingkat lanjut yang membingungkan.
- **Batas Maksimal**: Setiap file maksimal berisi **150 baris** kode. Dilarang panjang bertele-tele (*no AI slop*).
- **Bahasa Indonesia**: Nama variabel, nama fungsi, dan nama folder menu **wajib** menggunakan Bahasa Indonesia.

## 2. Struktur Folder `lib/` (Berbasis Menu)
Folder dibuat berdasarkan apa yang dilihat oleh user (tiap menu/layar). Jangan membuat terlalu banyak folder.
Di dalam folder tiap menu, **hanya boleh ada 2 sub-folder**: `ui` dan `backend`.

**Contoh Struktur:**
```text
lib/
 ┣ menu_beranda/
 ┃ ┣ ui/         (Isi: File desain tampilan, Scaffold, tombol)
 ┃ ┗ backend/    (Isi: Fungsi, controller, error handling)
 ┣ menu_profil/
 ┃ ┣ ui/
 ┃ ┗ backend/
 ┗ main.dart     (Titik awal aplikasi)
```

## 3. Pembagian File: UI vs Backend
- **`ui/` (Tampilan)**:
  Berisi kode yang murni mengatur tampilan layar. Tidak boleh ada logika validasi yang panjang di sini.
- **`backend/` (Logika & Kontroler)**:
  Berisi `TextEditingController` dan fungsi untuk mengecek *error handling* (contoh: batas maksimum input angka, atau memastikan input berupa angka dan bukan huruf).

## 4. Aturan Komentar (Singkat & Jelas)
Berikan komentar singkat di setiap kode untuk menjelaskan fungsinya.
Pada bagian **backend**, tandai bagian *inti logikanya* dengan komentar sederhana (tidak boleh brutal/kepanjangan).

**Contoh Gaya Koding & Komentar Backend:**
```dart
// Controller untuk mengambil nama dari input
final TextEditingController namaController = TextEditingController();

// Fungsi untuk mengecek batasan input
void cekInput(String nilai) {
  // INTI FUNGSI: Mencegah error huruf dan batasan nilai maksimal
  int? angka = int.tryParse(nilai);
  
  if (angka == null) {
    // Tampilkan pesan error jika bukan angka
    print('Harus berupa angka!');
  } else if (angka > 100) {
    // Tampilkan pesan error jika angka lebih dari batas
    print('Maksimal input 100!');
  } else {
    // Proses berhasil
  }
}
```
