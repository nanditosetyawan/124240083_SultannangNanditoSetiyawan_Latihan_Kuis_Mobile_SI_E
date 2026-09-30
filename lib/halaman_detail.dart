import 'package:flutter/material.dart';

import 'models/food_item.dart';

class HalamanDetail extends StatefulWidget {
  final FoodItem makanan;

  const HalamanDetail({super.key, required this.makanan});

  @override
  State<HalamanDetail> createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {
  late TextEditingController _kontrolerPorsi;

  late int _porsiSaatIni;

  @override
  void initState() {
    super.initState();
    _porsiSaatIni = widget.makanan.quantity;

    _kontrolerPorsi = TextEditingController(
      text: _porsiSaatIni == 0 ? '' : _porsiSaatIni.toString(),
    );
  }

  @override
  void dispose() {
    _kontrolerPorsi.dispose();
    super.dispose();
  }

  int get _totalHarga => _porsiSaatIni * widget.makanan.price;

  Future<void> _simpanPemesanan() async {
    if (_porsiSaatIni <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Masukkan jumlah porsi minimal 1!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Pemesanan ${widget.makanan.name} disimpan!'),
        backgroundColor: Color(0xFFE07B39),
      ),
    );

    Navigator.pop(context, _porsiSaatIni);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F4EE),

      appBar: AppBar(
        title: Text(
          widget.makanan.name,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFFE07B39),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                widget.makanan.imageUrl,
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
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

            SizedBox(height: 20),

            Text(
              widget.makanan.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            SizedBox(height: 4),

            Text(
              widget.makanan.hargaFormatted,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFFE07B39),
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: 12),

            Text(
              widget.makanan.description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
                height: 1.5,
              ),
            ),

            SizedBox(height: 24),

            TextField(
              controller: _kontrolerPorsi,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Jumlah (porsi)',
                labelStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(
                  Icons.format_list_bulleted,
                  color: Color(0xFFE07B39),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xFFE07B39), width: 2),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              onChanged: (nilai) {
                setState(() {
                  _porsiSaatIni = int.tryParse(nilai) ?? 0;
                });
              },
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),

                Text(
                  _porsiSaatIni > 0 ? 'Rp ${formatHarga(_totalHarga)}' : 'Rp 0',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),

            SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _simpanPemesanan,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFE07B39),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_cart),
                    SizedBox(width: 8),
                    Text(
                      'Simpan Pemesanan',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
