class FoodItem {
  final String name;
  final String description;
  final String imageUrl;
  int quantity;
  final int price;

  FoodItem({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.quantity,
    required this.price,
  });

  int get totalHarga => quantity * price;

  String get hargaFormatted => 'Rp ${formatHarga(price)} / porsi';

  String get totalFormatted => 'Rp ${formatHarga(totalHarga)}';

  static final List<FoodItem> daftarMakanan = [
    FoodItem(
      name: 'Nasi Goreng',
      description: 'Nasi goreng spesial dengan telur, ayam, dan kerupuk.',
      imageUrl:
          'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=800&q=80&auto=format&fit=crop',
      quantity: 0,
      price: 15000,
    ),

    FoodItem(
      name: 'Mie Goreng',
      description: 'Mie goreng jawa dengan bumbu khas dan sayuran segar.',
      imageUrl:
          'https://images.unsplash.com/photo-1473093295043-cdd812d0e601?w=800&q=80&auto=format&fit=crop',
      quantity: 0,
      price: 12000,
    ),

    FoodItem(
      name: 'Ayam Bakar',
      description:
          'Ayam bakar bumbu kecap disajikan dengan sambal dan lalapan.',
      imageUrl:
          'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=800&q=80&auto=format&fit=crop',
      quantity: 0,
      price: 25000,
    ),

    FoodItem(
      name: 'Es Teh',
      description: 'Teh manis dingin yang menyegarkan.',
      imageUrl:
          'https://images.unsplash.com/photo-1544787219-7f47ccb76574?w=800&q=80&auto=format&fit=crop',
      quantity: 0,
      price: 5000,
    ),

    FoodItem(
      name: 'Es Jeruk',
      description: 'Jeruk peras asli dingin dengan es batu.',
      imageUrl:
          'https://images.unsplash.com/photo-1600271886742-f049cd451bba?w=800&q=80&auto=format&fit=crop',
      quantity: 0,
      price: 6000,
    ),
  ];
}

String formatHarga(int nilai) {
  return nilai.toString().replaceAllMapped(
    RegExp(r'(\d)(?=(\d{3})+$)'),
    (m) => '${m[1]}.',
  );
}
