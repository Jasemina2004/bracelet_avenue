import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:bracelet_avenue/models/product.dart';
import 'package:bracelet_avenue/screens/product_detail_screen.dart';
import 'package:bracelet_avenue/screens/cart_screen.dart';
import 'package:bracelet_avenue/screens/wishlist_screen.dart';
import 'package:bracelet_avenue/constants.dart';
import 'package:bracelet_avenue/providers/cart_provider.dart';

class ProductApiService {
  final http.Client client;

  ProductApiService(this.client);

  Future<List<Product>> fetchProducts() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Product(
        id: '1',
        name: 'Sky Pearl Ring',
        description:
            'A delicate heart-shaped ring adorned with shimmering pearls, perfect for adding a romantic and elegant touch to any outfit. '
            '\n- Stretch design for easy on-and-off wear '
            '\n- Colorful raw quartz and glass beads on stretch elastic '
            '\n- Total bracelet length: 1.5" '
            '\n- 100% waterproof, tarnish-resistant, and designed for everyday wear',
        price: 5.99,
        category: 'Rings',
        rating: 5.0,
        isFavorite: false,
        imageUrl: 'assets/images/j (2).JPG',
      ),
      Product(
        id: '2',
        name: 'Pearl Heart Elegance',
        description:
            'A delicate heart-shaped pendant adorned with shimmering pearls, perfect for adding a romantic touch to any outfit.'
            '\n- Stretch design for easy on-and-off wear '
            '\n- Colorful raw quartz and glass beads on stretch elastic '
            '\n- Total necklace length: 30.5" '
            '\n- 100% waterproof, tarnish-resistant, and designed for everyday wear',
        price: 22.99,
        category: 'Necklaces',
        rating: 4.5,
        isFavorite: false,
        imageUrl: 'assets/images/j (1).JPG',
      ),
      Product(
        id: '3',
        name: 'Midnight Pearl Ring',
        description:
            'An elegant ring combining pearls with a deep, dark blue gemstone, reminiscent of a starry night sky.'
            '\n- Stretch design for easy on-and-off wear '
            '\n- Colorful raw quartz and glass beads on stretch elastic '
            '\n- Total ring length: 1.5" '
            '\n- 100% waterproof, tarnish-resistant, and designed for everyday wear',
        price: 6.99,
        category: 'Rings',
        rating: 4.5,
        isFavorite: false,
        imageUrl: 'assets/images/j (4).JPG',
      ),
      Product(
        id: '4',
        name: 'Rainbow Pearl Pendant',
        description:
            'A vibrant pendant with pearls and a colorful center gemstone, creating a playful yet sophisticated look.'
            '\n- Stretch design for easy on-and-off wear '
            '\n- Colorful raw quartz and glass beads on stretch elastic '
            '\n- Total bracelet length: 6.5" '
            '\n- Letter charm: 1/4" in height '
            '\n- 100% waterproof, tarnish-resistant, and designed for everyday wear',
        price: 21.99,
        category: 'Necklaces',
        rating: 4.9,
        isFavorite: false,
        imageUrl: 'assets/images/j (7).JPG',
      ),
      Product(
        id: '5',
        name: 'Cherry Blossom Bracelet',
        description:
            'A handmade floral bracelet with cherry red and white flowers, adding a delicate and feminine charm.'
            '\n- Stretch design for easy on-and-off wear '
            '\n- Colorful raw quartz and glass beads on stretch elastic '
            '\n- Total bracelet length: 6.5" '
            '\n- 100% waterproof, tarnish-resistant, and designed for everyday wear',
        price: 14.99,
        category: 'Bracelets',
        rating: 5.0,
        isFavorite: false,
        imageUrl: 'assets/images/j (9).JPG',
      ),
      Product(
        id: '6',
        name: 'Starlight Pearl Pendant',
        description:
            'A celestial-inspired star-shaped pendant embellished with pearls, perfect for dreamy and ethereal styling.'
            '\n- Stretch design for easy on-and-off wear '
            '\n- Colorful raw quartz and glass beads on stretch elastic '
            '\n- Total necklace length: 30.5" '
            '\n- 100% waterproof, tarnish-resistant, and designed for everyday wear',
        price: 18.99,
        category: 'Necklaces',
        rating: 4.9,
        isFavorite: false,
        imageUrl: 'assets/images/j (11).JPG',
      ),
      Product(
        id: '7',
        name: 'Black Ribbon Pearl Pendant',
        description:
            'A bold yet elegant pendant featuring large pearls and a striking black ribbon detail in the center.'
            '\n- Stretch design for easy on-and-off wear '
            '\n- Colorful raw quartz and glass beads on stretch elastic '
            '\n- Total bracelet length: 30.5" '
            '\n- 100% waterproof, tarnish-resistant, and designed for everyday wear',
        price: 19.99,
        category: 'Necklaces',
        rating: 5.0,
        isFavorite: false,
        imageUrl: 'assets/images/j (12).JPG',
      ),
      Product(
        id: '8',
        name: 'White Blossom Bracelet',
        description:
            'A handcrafted floral bracelet with white flowers and deep red gemstones at the center, exuding timeless beauty.'
            '\n- Stretch design for easy on-and-off wear '
            '\n- Colorful raw quartz and glass beads on stretch elastic '
            '\n- Total bracelet length: 6.5" '
            '\n- Letter charm: 1/4" in height '
            '\n- 100% waterproof, tarnish-resistant, and designed for everyday wear',
        price: 11.99,
        category: 'Bracelets',
        rating: 5.0,
        isFavorite: false,
        imageUrl: 'assets/images/j (14).JPG',
      ),
      Product(
        id: '9',
        name: 'Twin Pearl & Gold Bracelets',
        description:
            'A set of two bracelets: one with white pearls, gold accents, and a heart charm, and the other with golden pearls for a luxurious touch.'
            '\n- Stretch design for easy on-and-off wear '
            '\n- Colorful raw quartz and glass beads on stretch elastic '
            '\n- Total bracelet length: 6.5" '
            '\n- 100% waterproof, tarnish-resistant, and designed for everyday wear',
        price: 9.99,
        category: 'Bracelets',
        rating: 4.9,
        isFavorite: false,
        imageUrl: 'assets/images/j (15).JPG',
      ),
      Product(
        id: '10',
        name: 'Pink Lily Transparent Ring',
        description:
            'A delicate ring with transparent gemstones and a soft pink lily flower in the center, radiating elegance.'
            '\n- Stretch design for easy on-and-off wear '
            '\n- Colorful raw quartz and glass beads on stretch elastic '
            '\n- Total bracelet length: 1.5" '
            '\n- 100% waterproof, tarnish-resistant, and designed for everyday wear',
        price: 5.99,
        category: 'Rings',
        rating: 4.5,
        isFavorite: false,
        imageUrl: 'assets/images/j (17).JPG',
      ),
      Product(
        id: '11',
        name: 'Cream Rose Pearl Pendant',
        description:
            'A handcrafted floral pendant with white flowers and a soft pinkish-cream gemstone at its heart.'
            '\n- Stretch design for easy on-and-off wear '
            '\n- Colorful raw quartz and glass beads on stretch elastic '
            '\n- Total necklace length: 30.5" '
            '\n- 100% waterproof, tarnish-resistant, and designed for everyday wear',
        price: 12.99,
        category: 'Necklaces',
        rating: 4.7,
        isFavorite: false,
        imageUrl: 'assets/images/j (18).JPG',
      ),
      Product(
        id: '12',
        name: 'Triple Strand Pearl Pendant',
        description:
            'A sophisticated pendant with three interwoven strands of pearls, creating a layered and graceful effect.'
            '\n- Stretch design for easy on-and-off wear '
            '\n- Colorful raw quartz and glass beads on stretch elastic '
            '\n- Total necklace length: 30.5" '
            '\n- 100% waterproof, tarnish-resistant, and designed for everyday wear',
        price: 18.99,
        category: 'Necklaces',
        rating: 4.5,
        isFavorite: false,
        imageUrl: 'assets/images/j (20).JPG',
      ),
      Product(
        id: '13',
        name: ' Pearl Necklace',
        description: 'A charming necklace with featuring pearls .'
            '\n- Stretch design for easy on-and-off wear '
            '\n- Colorful raw quartz and glass beads on stretch elastic '
            '\n- Total necklace length: 30.5" '
            '\n- 100% waterproof, tarnish-resistant, and designed for everyday wear',
        price: 15.99,
        category: 'Necklaces',
        rating: 5.0,
        isFavorite: false,
        imageUrl: 'assets/images/j (21).JPG',
      ),
      Product(
        id: '14',
        name: 'Lavender Pearl Ring',
        description:
            'A charming ring featuring pearls and a light, translucent purple gemstone at the center, perfect for a subtle pop of color.'
            '\n- Stretch design for easy on-and-off wear '
            '\n- Colorful raw quartz and glass beads on stretch elastic '
            '\n- Total ring length: 1.9" '
            '\n- 100% waterproof, tarnish-resistant, and designed for everyday wear',
        price: 5.99,
        category: 'Rings',
        rating: 4.9,
        isFavorite: false,
        imageUrl: 'assets/images/j (23).JPG',
      ),
    ];
  }

  Future<void> toggleFavorite(String productId, bool isFavorite) async {
    await Future.delayed(const Duration(milliseconds: 300));
  }
}

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late final ProductApiService _apiService;
  List<Product> _products = [];
  List<Product> _filteredProducts = [];
  final TextEditingController _searchController = TextEditingController();
  bool _isLoading = true;
  bool _hasError = false;
  String _selectedCategory = 'All';
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _apiService = ProductApiService(http.Client());
    _loadProducts();
    _searchController.addListener(_filterProducts);
  }

  Future<void> _loadProducts() async {
    if (!mounted) return;

    setState(() {
      _isLoading = true;
      _hasError = false;
      _errorMessage = '';
    });

    try {
      final products = await _apiService.fetchProducts();
      if (!mounted) return;

      setState(() {
        _products = products;
        _filteredProducts = products;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _hasError = true;
        _isLoading = false;
        _errorMessage = e.toString();
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  void _filterProducts() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredProducts = _products.where((product) {
        final matchesSearch = product.name.toLowerCase().contains(query) ||
            product.description.toLowerCase().contains(query);
        final matchesCategory =
            _selectedCategory == 'All' || product.category == _selectedCategory;
        return matchesSearch && matchesCategory;
      }).toList();
    });
  }

  Future<void> _toggleFavorite(String productId) async {
    final index = _products.indexWhere((p) => p.id == productId);
    if (index == -1) return;

    final newStatus = !_products[index].isFavorite;
    final previousStatus = _products[index].isFavorite;

    setState(() {
      _products[index] = _products[index].copyWith(isFavorite: newStatus);
      _filterProducts();
    });

    try {
      await _apiService.toggleFavorite(productId, newStatus);
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _products[index] =
            _products[index].copyWith(isFavorite: previousStatus);
        _filterProducts();
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update favorite: ${e.toString()}')),
      );
    }
  }

  void _addToCart(Product product) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.addToCart(product);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${product.name} added to cart')),
    );
  }

  void _selectCategory(String category) {
    setState(() {
      _selectedCategory = category;
      _filterProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Products'),
        backgroundColor: AppColors.primary,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WishlistScreen(
                    products: _products.where((p) => p.isFavorite).toList(),
                    onFavoriteToggle: _toggleFavorite,
                    onAddToCart: _addToCart,
                  ),
                ),
              );
            },
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(
                        cartItems: cartProvider.cartItems,
                        onRemoveItem: (product) =>
                            cartProvider.removeFromCart(product),
                      ),
                    ),
                  );
                },
              ),
              if (cartProvider.cartItems.isNotEmpty)
                Positioned(
                  right: 8,
                  top: 8,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: AppColors.error,
                    child: Text(
                      cartProvider.cartItems.length.toString(),
                      style: const TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => showSearch(
              context: context,
              delegate: ProductSearchDelegate(_products),
            ),
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) return _buildLoading();
    if (_hasError) return _buildError();
    return Column(
      children: [
        _buildSearchBar(),
        _buildCategoryChips(),
        Expanded(child: _buildProductGrid()),
      ],
    );
  }

  Widget _buildLoading() => const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
        ),
      );

  Widget _buildError() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 60, color: Colors.red[400]),
            const SizedBox(height: 16),
            const Text('Failed to load products',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            if (_errorMessage.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(_errorMessage, style: TextStyle(color: Colors.grey[600])),
            ],
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: _loadProducts,
              child: const Text('Retry', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      );

  Widget _buildSearchBar() => Padding(
        padding: const EdgeInsets.all(16),
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search products...',
            prefixIcon: const Icon(Icons.search, color: AppColors.primary),
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primary),
            ),
          ),
        ),
      );

  Widget _buildCategoryChips() {
    final categories = ['All', 'Necklaces', 'Bracelets', 'Rings', 'Earrings'];
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children:
            categories.map((category) => _buildCategoryChip(category)).toList(),
      ),
    );
  }

  Widget _buildCategoryChip(String category) {
    final isSelected = _selectedCategory == category;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ChoiceChip(
        label: Text(category),
        selected: isSelected,
        onSelected: (_) => _selectCategory(category),
        selectedColor: AppColors.primary,
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : AppColors.onSurface,
          fontWeight: FontWeight.w500,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  Widget _buildProductGrid() {
    if (_filteredProducts.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off, size: 60, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              _searchController.text.isEmpty
                  ? 'No products available'
                  : 'No matching products found',
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            if (_searchController.text.isNotEmpty) ...[
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  _searchController.clear();
                  _filterProducts();
                },
                child: const Text('Clear search'),
              ),
            ],
          ],
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: _filteredProducts.length,
      itemBuilder: (context, index) => ProductCard(
        product: _filteredProducts[index],
        onTap: () => _navigateToDetail(context, index),
        onFavoriteToggle: _toggleFavorite,
        onAddToCart: _addToCart,
      ),
    );
  }

  void _navigateToDetail(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailScreen(
          product: _filteredProducts[index],
          onFavoriteToggle: _toggleFavorite,
          onAddToCart: _addToCart,
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  final Function(String) onFavoriteToggle;
  final Function(Product) onAddToCart;

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
    required this.onFavoriteToggle,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(
                    product.imageUrl,
                    width: double.infinity,
                    height: 120,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 120,
                      color: Colors.grey[200],
                      child:
                          const Center(child: Icon(Icons.image_not_supported)),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: Icon(
                      product.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color:
                          product.isFavorite ? AppColors.error : Colors.white,
                    ),
                    onPressed: () => onFavoriteToggle(product.id),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                        color: AppColors.primary, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, color: AppColors.accent, size: 16),
                      Text(' ${product.rating.toStringAsFixed(1)}'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.accent,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                      onPressed: () => onAddToCart(product),
                      child: const Text('Add to Cart'),
                    ),
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

class ProductSearchDelegate extends SearchDelegate<Product> {
  final List<Product> products;

  ProductSearchDelegate(this.products);

  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () => query = '',
        ),
      ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => close(context, Product.empty()),
      );

  @override
  Widget buildResults(BuildContext context) => _buildSearchResults();

  @override
  Widget buildSuggestions(BuildContext context) => _buildSearchResults();

  Widget _buildSearchResults() {
    final results = products.where((product) {
      final q = query.toLowerCase();
      return product.name.toLowerCase().contains(q) ||
          product.description.toLowerCase().contains(q) ||
          product.category.toLowerCase().contains(q);
    }).toList();

    if (results.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off, size: 60, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              'No products found for "$query"',
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) => ListTile(
        leading: Image.asset(
          results[index].imageUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 50,
            height: 50,
            color: Colors.grey[200],
            child: const Center(child: Icon(Icons.image_not_supported)),
          ),
        ),
        title: Text(results[index].name),
        subtitle: Text(
            '\$${results[index].price.toStringAsFixed(2)} • ${results[index].category}'),
        trailing: IconButton(
          icon: Icon(
            results[index].isFavorite ? Icons.favorite : Icons.favorite_border,
            color: results[index].isFavorite ? AppColors.error : Colors.grey,
          ),
          onPressed: () {},
        ),
        onTap: () {
          close(context, results[index]);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailScreen(
                product: results[index],
                onFavoriteToggle: (productId) {},
                onAddToCart: (product) {},
              ),
            ),
          );
        },
      ),
    );
  }
}
