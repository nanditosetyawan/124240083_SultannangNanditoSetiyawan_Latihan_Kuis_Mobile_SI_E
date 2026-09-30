import 'package:flutter/material.dart';

import 'models/food_item.dart';

import 'halaman_detail.dart';

class HalamanBeranda extends StatefulWidget {
  const HalamanBeranda({super.key});

  @override
  State<HalamanBeranda> createState() => _HalamanBerandaState();
}

class _HalamanBerandaState extends State<HalamanBeranda> {
  final List<FoodItem> _daftarMakanan = FoodItem.daftarMakanan;

  Future<void> _bukaHalamanDetail(FoodItem makanan) async {
    final porsiKembali = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HalamanDetail(makanan: makanan)),
    );

    if (porsiKembali != null) {
      setState(() {
        makanan.quantity = porsiKembali;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
      // ─── WIDGET: AppBar ───
      appBar: AppBar(
        title: const Text(
          'Menu Resto',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFFE07B39),
        centerTitle: true,
        elevation: 0,
      ),



      backgroundColor: Color(0xFFF9F4EE),



      // ─── WIDGET: Daftar Makanan ───
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        itemCount: _daftarMakanan.length,
        itemBuilder: (context, indeks) {
          final makanan = _daftarMakanan[indeks];


          // ─── WIDGET: Kartu Makanan Pembungkus ───
          return _KartuMakanan(
            makanan: makanan,
            onKlik: () => _bukaHalamanDetail(makanan),
          );
          
          
        },
      ),
    );
  }
}

class _KartuMakanan extends StatelessWidget {
  final FoodItem makanan;
  final VoidCallback onKlik;

  const _KartuMakanan({required this.makanan, required this.onKlik});

  @override
  Widget build(BuildContext context) {
    
    
    // ─── WIDGET: GestureDetector ───
    return GestureDetector(
      onTap: onKlik,


      // ─── WIDGET: Container Kartu ───
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),


        // ─── WIDGET: Row Konten Kartu ───
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            
            
            // ─── WIDGET: Gambar Makanan ───
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                makanan.imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 80,
                    height: 80,
                    color: Colors.grey[200],
                    child: Icon(Icons.restaurant, color: Colors.grey),
                  );
                },
              ),
            ),



            SizedBox(width: 12),



            // ─── WIDGET: Info Makanan ───
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  
                  
                  // ─── WIDGET: Nama Makanan ───
                  Text(
                    makanan.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),



                  SizedBox(height: 4),



                  // ─── WIDGET: Deskripsi Makanan ───
                  Text(
                    makanan.description,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),



                  SizedBox(height: 6),



                  // ─── WIDGET: Baris Porsi & Total ───
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      
                      
                      // ─── WIDGET: Teks Porsi ───
                      Text(
                        '${makanan.quantity} porsi',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,

                          color: makanan.quantity > 0
                              ? Color(0xFFE07B39)
                              : Colors.grey,
                        ),
                      ),



                      // ─── WIDGET: Teks Total Harga ───
                      Text(
                        makanan.quantity > 0 ? makanan.totalFormatted : 'Rp 0',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      
                      
                    ],
                  ),



                  SizedBox(height: 2),



                  // ─── WIDGET: Harga Satuan ───
                  Text(
                    makanan.hargaFormatted,
                    style: TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                  
                  
                ],
              ),
            ),
            
            
          ],
        ),
      ),
    );
  }
}
