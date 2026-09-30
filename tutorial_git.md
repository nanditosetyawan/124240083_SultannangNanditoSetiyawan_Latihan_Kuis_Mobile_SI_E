# Tutorial Mengupload Project Kuis Baru ke GitHub (Git Push)

Tutorial ini khusus jika besok kamu harus mengumpulkan hasil kuis dalam bentuk link GitHub. Lakukan langkah ini **setelah kodinganmu selesai dan berjalan dengan lancar**.

## Tahap 1: Buat Repository Baru di GitHub
1. Buka browser dan login ke [GitHub](https://github.com/).
2. Klik tombol **New** berwarna hijau (atau tombol `+` di pojok kanan atas > **New repository**).
3. Isi **Repository name** (misal: `Kuis_Mobile_NIM_Nama`).
4. Pastikan diset ke **Public** (agar dosen bisa lihat).
5. **JANGAN** centang "Add a README file" atau "Add .gitignore". Biarkan kosong.
6. Klik tombol hijau **Create repository**.
7. Kamu akan melihat halaman yang berisi banyak kode. **Cari bagian "…or push an existing repository from the command line"** dan copy baris perintah URL-nya.
   *(Bentuk linknya kira-kira seperti ini: `https://github.com/nanditosetyawan/nama_repo.git`)*

---

## Tahap 2: Buka Terminal di VS Code
1. Di VS Code project kuis barumu, buka Terminal (`Ctrl` + `~` atau menu `Terminal` > `New Terminal`).
2. Pastikan tulisan di sebelah kiri terminal sudah menunjuk ke folder project kuis yang benar.

---

## Tahap 3: Ketik Perintah Git (Satu per Satu)

Copy-paste atau ketik perintah ini satu per satu di terminal VS Code, lalu tekan **Enter**:

### 1. Inisialisasi Git
```bash
git init
```
*(Ini untuk menyalakan fitur git di folder tersebut)*

### 2. Memasukkan semua file ke keranjang
```bash
git add .
```
*(Perhatikan **ada spasi dan titik** di akhir. Ini artinya "tambahkan semua file")*

### 3. Memberi nama checkpoint (Commit)
```bash
git commit -m "Selesai kuis mobile"
```

### 4. Mengubah nama cabang utama menjadi 'main'
```bash
git branch -M main
```

### 5. Menghubungkan ke GitHub (PASTE LINK REPO KAMU DI SINI)
```bash
git remote add origin MASUKKAN_LINK_GITHUB_KAMU_DISINI
```
**Contoh:** `git remote add origin https://github.com/nanditosetyawan/Kuis_Mobile.git`

### 6. Mengupload file ke GitHub (Push)
```bash
git push -u origin main
```
*(Jika muncul popup login GitHub, silakan login/authorize)*

---

## Tahap 4: Cek Hasilnya
Buka kembali halaman GitHub yang tadi di browser, lalu **Refresh (F5)** halamannya.
Kalau berhasil, file-file Flutter kamu (`lib/`, `pubspec.yaml`, dll) akan muncul di sana. Tinggal copy link URL dari atas browser dan kumpulkan ke dosen! 🎉
