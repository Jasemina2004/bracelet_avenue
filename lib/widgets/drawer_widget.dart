import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as provider_package;
import 'package:bracelet_avenue/screens/home_screen.dart';
import 'package:bracelet_avenue/screens/about_screen.dart';
import 'package:bracelet_avenue/screens/products_screen.dart';
import 'package:bracelet_avenue/screens/contact_screen.dart';
import 'package:bracelet_avenue/screens/settings_screen.dart';
import 'package:bracelet_avenue/screens/cart_screen.dart';
import 'package:bracelet_avenue/screens/wishlist_screen.dart';
import 'package:bracelet_avenue/constants.dart' as app_constants;
import 'package:bracelet_avenue/providers/cart_provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider =
        provider_package.Provider.of<CartProvider>(context, listen: false);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: app_constants.AppColors.primary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20),
                Image(
                  image: AssetImage(app_constants.AppImages.logo),
                  height: 60,
                ),
                SizedBox(height: 10),
                Text(
                  'Bracelet Avenue',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          _buildDrawerItem(
            context: context,
            icon: Icons.home,
            title: 'Home',
            destination: const HomeScreen(),
            replace: true,
          ),
          _buildDrawerItem(
            context: context,
            icon: Icons.info,
            title: 'About',
            destination: const AboutScreen(),
          ),
          _buildDrawerItem(
            context: context,
            icon: Icons.shopping_bag,
            title: 'Products',
            destination: const ProductsScreen(),
          ),
          _buildDrawerItem(
            context: context,
            icon: Icons.contact_mail,
            title: 'Contact',
            destination: const ContactScreen(),
          ),
          _buildDrawerItem(
            context: context,
            icon: Icons.shopping_cart,
            title: 'Cart',
            destination: CartScreen(
              cartItems: cartProvider.cartItems,
              onRemoveItem: (product) => cartProvider.removeFromCart(product),
            ),
          ),
          _buildDrawerItem(
            context: context,
            icon: Icons.favorite,
            title: 'Wishlist',
            destination: WishlistScreen(
              products: cartProvider.wishlistItems,
              onFavoriteToggle: (productId) =>
                  cartProvider.toggleFavorite(productId),
              onAddToCart: (product) => cartProvider.addToCart(product),
            ),
          ),
          const Divider(height: 1),
          _buildDrawerItem(
            context: context,
            icon: Icons.settings,
            title: 'Settings',
            destination: const SettingsScreen(),
          ),
          _buildDrawerItem(
            context: context,
            icon: Icons.logout,
            title: 'Logout',
            onTap: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    Widget? destination,
    bool replace = false,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap ??
          () {
            if (destination != null) {
              if (replace) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => destination),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => destination),
                );
              }
            }
          },
    );
  }
}
