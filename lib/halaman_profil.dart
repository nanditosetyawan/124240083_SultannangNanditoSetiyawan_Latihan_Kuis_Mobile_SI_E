import 'package:flutter/material.dart';
import 'halaman_keranjang.dart';

class HalamanProfil extends StatelessWidget {
  final VoidCallback? onPindahKeMenu;

  const HalamanProfil({super.key, this.onPindahKeMenu});

  static const String namaPelanggan = 'Dito';
  static const String peranPelanggan = 'BOS Hotel';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F4EE),

      appBar: AppBar(
        title: Text(
          'Profil',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFFE07B39),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            SizedBox(height: 30),

            CircleAvatar(
              radius: 60,
              backgroundColor: Color(0xFFF5CBA7),
              child: Icon(Icons.person, size: 70, color: Color(0xFFE07B39)),
            ),

            SizedBox(height: 20),

            Text(
              namaPelanggan,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                letterSpacing: 1.2,
              ),
            ),

            SizedBox(height: 6),

            Text(
              peranPelanggan,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),

            SizedBox(height: 40),

            GestureDetector(
              onTap: () {
                if (onPindahKeMenu != null) {
                  onPindahKeMenu!();
                }
              },

              child: _KartuInfo(
                ikon: Icons.restaurant,
                judul: 'Menu Resto',
                deskripsi: 'Pesan makanan favorit Anda dengan mudah.',
              ),
            ),

            SizedBox(height: 12),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HalamanKeranjang()),
                );
              },
              child: _KartuInfo(
                ikon: Icons.receipt_long,
                judul: 'Pemesanan',
                deskripsi: 'Jumlah dan harga dihitung otomatis.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _KartuInfo extends StatelessWidget {
  final IconData ikon;

  final String judul;

  final String deskripsi;

  const _KartuInfo({
    required this.ikon,
    required this.judul,
    required this.deskripsi,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),

      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFFF5CBA7),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(ikon, color: Color(0xFFE07B39), size: 24),
          ),

          SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  judul,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 4),

                Text(
                  deskripsi,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
