class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final double rating;
  bool isFavorite;
  final String category;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.rating,
    required this.isFavorite,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        price: json['price']?.toDouble() ?? 0.0,
        imageUrl: json['imageUrl'],
        rating: json['rating']?.toDouble() ?? 0.0,
        isFavorite: json['isFavorite'] ?? false,
        category: json['category'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'price': price,
        'imageUrl': imageUrl,
        'rating': rating,
        'isFavorite': isFavorite,
        'category': category,
      };

  Product copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? imageUrl,
    double? rating,
    bool? isFavorite,
    String? category,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      rating: rating ?? this.rating,
      isFavorite: isFavorite ?? this.isFavorite,
      category: category ?? this.category,
    );
  }

  static Product empty() => Product(
        id: '',
        name: '',
        description: '',
        price: 0.0,
        imageUrl: '',
        rating: 0.0,
        isFavorite: false,
        category: '',
      );
}
