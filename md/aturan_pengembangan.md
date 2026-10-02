# Aturan & Standar Pengodingan Flutter

Dokumen ini adalah acuan utama dalam membangun aplikasi Flutter. Kodingan harus sederhana, singkat, dan mudah dipahami sesuai level dasar.

## 1. Aturan Umum Kodingan
- **Gaya Koding Dasar**: Gunakan gaya penulisan Flutter standar. Dilarang menggunakan *shortcut* atau teknik kodingan tingkat lanjut yang membingungkan. 
- **Singkat & Jelas**: Maksimal **150 baris** per file. Dilarang menggunakan kodingan AI *slop* (panjang, tidak relevan, bertele-tele).
- **Bahasa Indonesia**: Penamaan folder, file, variabel, dan fungsi wajib menggunakan bahasa Indonesia yang jelas (misal: `hitungTotal`, `jumlahBarang`).

## 2. Struktur Folder `lib/`
Folder dibagi berdasarkan apa yang dilihat user (per menu/fitur). **Jangan membuat folder berlebihan.**
Setiap menu hanya memiliki dua sub-folder utama:

```text
lib/
 ┣ menu_utama/
 ┃ ┣ tampilan/   (Isi: File UI visual, tata letak, tombol)
 ┃ ┗ logika/     (Isi: File fungsi, controller, validasi)
 ┣ menu_profil/
 ┃ ┣ tampilan/
 ┃ ┗ logika/
 ┗ main.dart     (Titik awal aplikasi berjalan)
```

## 3. Pembagian Tugas File
- **Folder `tampilan`**: 
  Fokus pada gambar, teks, dan desain visual (Scaffold, AppBar, dll). Hindari menaruh banyak logika (if-else hitungan) di sini.
- **Folder `logika`**: 
  Tempat menaruh fungsi, `TextEditingController`, *error handling* (penanganan error tipe input, validasi panjang string, angka maksimal), dan hitung-hitungan.

## 4. Standar Komentar
Komentar harus ada namun **singkat dan sederhana**. Tidak boleh brutal/berlebihan.
Tandai fungsi inti di bagian *backend/logika* dengan format seperti ini:

```dart
// Deklarasi controller untuk nama user
final TextEditingController namaController = TextEditingController();

void prosesHitung(String nilai) {
  // INTI LOGIKA: Cek apakah input berupa angka valid
  int? angka = int.tryParse(nilai);
  
  if (angka == null) {
    // Error jika bukan angka
    cetakError('Input harus angka!');
  } else if (angka > 50) {
    // Error jika melebihi max input
    cetakError('Maksimal input adalah 50!');
  } else {
    // Simpan data
  }
}
```
