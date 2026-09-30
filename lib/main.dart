import 'package:flutter/material.dart';

import 'root.dart';

void main() {
  runApp(const AplikasiResto());
}

class AplikasiResto extends StatelessWidget {
  const AplikasiResto({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Pemesanan Resto',

      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFE07B39)),
        useMaterial3: true,
      ),

      home: RootHalaman(),
    );
  }
}
