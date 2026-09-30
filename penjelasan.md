# Panduan Mengerjakan Kuis Mobile (Copas Mode)

Langkah yang kamu rencanakan sudah **sangat tepat dan cerdas**. Karena pola soal kuis mobile biasanya mirip (hanya ganti tema dari Makanan ke Mobil/Buku/Laptop/Film), meniru struktur file dan copas dari repo ini adalah cara tercepat.

Agar besok kuisnya lancar tanpa *error* merah-merah yang bikin panik, ini **3 Hal Utama yang Harus Disiapkan & Diperhatikan:**

## 1. 🗂️ Persiapan File & Jendela VS Code
* **Buka 2 VS Code Berdampingan:** Besok saat kuis, buka project kosong dari dosen di layar kiri, dan buka repo `bahan/latres` (repo ini) di layar kanan.
* **Buat File Kosong Terlebih Dahulu:** Begitu dapat project dari dosen, langsung buat file kosong dengan nama yang sama persis seperti yang kita buat:
  * `halaman_login.dart`
  * `root.dart`
  * `halaman_beranda.dart`
  * `halaman_detail.dart`
  * `halaman_profil.dart`
  * *(Folder `models/` biasanya sudah dikasih dosen, kalau belum bikin aja folder `models/` lalu buat file modelnya).*

## 2. 🕵️ Analisa File Model dari Dosen (KUNCI UTAMA)
Sebelum mulai copas halaman manapun, **buka dulu file model dari dosen** (misal namanya `buku.dart` atau `laptop.dart`). Catat di kertas atau ingat-ingat 3 hal ini:

* **Nama Class-nya apa?** (Misal: `class Buku { ... }`). Besok kamu harus mengganti semua kata `FoodItem` di kodingan kita menjadi `Buku`.
* **Variabelnya apa saja?** (Misal dosen pakai `String judul; int hargaBuku; String coverUrl;`). Besok kamu harus mengganti pemanggilan di kodingan kita:
  * `makanan.name` ➔ ganti jadi `buku.judul`
  * `makanan.price` ➔ ganti jadi `buku.hargaBuku`
  * `makanan.imageUrl` ➔ ganti jadi `buku.coverUrl`
* **Nama List Data Dummy-nya apa?** (Misal: `List<Buku> daftarBuku = [...]`). Di kodingan kita pakai `FoodItem.daftarMakanan`. Besok kamu harus ganti jadi `Buku.daftarBuku`.

## 3. 📝 Urutan Copas & Edit Besok (Ikuti Urutan Ini!)
**Jangan copas acak.** Ikuti urutan ini agar *error* tidak menumpuk:

### A. `main.dart` & `halaman_login.dart` (Selesaikan yang gampang dulu)
* Copas full.
* Di `halaman_login.dart`, cari tulisan `// ← EDIT: Ganti username`. Sesuaikan string `admin` dan `123` dengan permintaan soal.

### B. `root.dart` & `halaman_profil.dart` (Selesaikan Navigasi & Tampilan Statis)
* Copas full keduanya.
* Di `halaman_profil.dart`, ganti nama "Dito" dan "BOS Hotel" dengan nama dan NIM kamu/sesuai soal.
* Di `root.dart`, pastikan nama Tab bawah (misal "Menu Resto") diganti jadi tema soal (misal "Daftar Buku").

### C. `halaman_beranda.dart` (Masuk ke Data Dinamis)
* Copas full.
* Ganti import di atas dari `import 'models/food_item.dart';` jadi file model dosen.
* Ubah semua kata `FoodItem` jadi nama Class dosen (CTRL+F sangat membantu).
* Perbaiki area `// ✂️ MULAI COPAS CLASS _KartuMakanan`. Sesuaikan `makanan.name`, `makanan.description`, dll dengan variabel milik dosen.

### D. `halaman_detail.dart` (Halaman Terakhir & Tersulit)
* Copas full.
* Ubah import model dan kata `FoodItem` jadi nama Class dosen.
* **Lihat Soal:** Apakah dosen minta fitur input angka dan hitung total (seperti porsi × harga)?
  * **Jika YA:** Biarkan kodingan kita apa adanya, tinggal sesuaikan nama variabel harga seperti `widget.makanan.price`.
  * **Jika TIDAK (cuma nampilin detail aja):** Hapus bagian blok `// ✂️ MULAI COPAS FIELD INPUT PORSI` dan `// ✂️ MULAI COPAS BARIS HITUNG TOTAL`.

---

**💡 Tips Pamungkas:**
Setiap kali selesai copas 1 file, baca sebentar file tersebut dan cari tanda `// ← VARIABEL:` atau `// ← EDIT:`. Itu adalah "rambu-rambu" yang sengaja aku pasang agar besok mata kamu langsung tertuju ke teks/variabel yang WAJIB diganti sesuai soal. Makin teliti membaca komentar ini, makin cepat selesai!
