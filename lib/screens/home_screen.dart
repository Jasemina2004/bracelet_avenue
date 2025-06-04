import 'package:bracelet_avenue/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:bracelet_avenue/widgets/blog_card.dart';
import 'package:bracelet_avenue/models/blog.dart';
import 'package:bracelet_avenue/constants.dart' as app_constants;
import 'package:bracelet_avenue/screens/products_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Blog> blogs = [
    Blog(
      id: '1',
      title: 'The Art of Handcrafted Jewelry',
      description:
          'Discover the beauty and craftsmanship behind our unique handmade pieces that tell a story.',
      imageUrl: 'assets/images/j (6).JPG',
      date: 'June 15, 2023',
      author: 'Sarah Johnson',
    ),
    Blog(
      id: '2',
      title: 'Trending Jewelry Styles',
      description:
          'Explore this season\'s hottest jewelry trends and how to wear them.',
      imageUrl: 'assets/images/j (8).JPG',
      date: 'July 2, 2023',
      author: 'Michael Chen',
    ),
    Blog(
      id: '3',
      title: 'Caring for Your Jewelry',
      description:
          'Essential tips to keep your precious pieces looking brilliant for years.',
      imageUrl: 'assets/images/j (3).JPG',
      date: 'July 10, 2023',
      author: 'Emma Rodriguez',
    ),
  ];

  final List<String> images = [
    app_constants.AppImages.carousel1,
    app_constants.AppImages.carousel2,
    app_constants.AppImages.carousel3,
  ];

  int _currentPage = 0;
  final PageController _pageController = PageController(viewportFraction: 0.8);

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bracelet Avenue'),
        backgroundColor: app_constants.AppColors.primary,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _buildAnimatedPageViewSlider(),
          ),
          SliverToBoxAdapter(
            child: _buildWelcomeSection(context),
          ),
          SliverToBoxAdapter(
            child: _buildCategoriesSection(),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.8,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => BlogCard(blog: blogs[index]),
                childCount: blogs.length,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: app_constants.AppColors.primary,
        onPressed: () {
          // Navigate to create new post
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildAnimatedPageViewSlider() {
    return SizedBox(
      height: 220,
      child: PageView.builder(
        controller: _pageController,
        itemCount: images.length,
        itemBuilder: (context, index) {
          double scale = 1.0;
          double opacity = 1.0;
          if (_pageController.position.haveDimensions) {
            double pageOffset =
                _pageController.page ?? _pageController.initialPage.toDouble();
            double diff = (pageOffset - index).abs();

            scale = 1 - (diff * 0.2).clamp(0.0, 0.2);
            opacity = 1 - (diff * 0.4).clamp(0.0, 0.4);
          }

          return Transform.scale(
            scale: scale,
            child: Opacity(
              opacity: opacity,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: app_constants.AppColors.primary.withValues(),
                      offset: const Offset(0, 5),
                      blurRadius: 10,
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage(images[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
      ),
    );
  }

  Widget _buildWelcomeSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: const TextSpan(
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: app_constants.AppColors.textPrimary,
              ),
              children: [
                TextSpan(text: 'Best '),
                TextSpan(
                  text: 'New Collection',
                  style: TextStyle(color: app_constants.AppColors.accent),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Bracelet Avenue',
            style: TextStyle(
              fontSize: 22,
              color: app_constants.AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Welcome to our app! Every item is handmade to fit you perfectly. '
            'We make unique pieces and also trendy ones! You can also always '
            'DM us on Instagram for more help.',
            style: app_constants.AppStyles.bodyStyle.copyWith(height: 1.5),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductsScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: app_constants.AppColors.accent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
            child: const Text(
              'Shop Now',
              style: app_constants.AppStyles.buttonTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesSection() {
    const categories = ['Rings', 'Bracelets', 'Necklaces', 'Earrings'];

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            width: 120,
            margin: EdgeInsets.only(
              left: index == 0 ? 20 : 10,
              right: index == categories.length - 1 ? 20 : 10,
            ),
            decoration: BoxDecoration(
              color: index % 2 == 0
                  ? app_constants.AppColors.accentLight
                  : app_constants.AppColors.secondary.withValues(),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                categories[index],
                style: app_constants.AppStyles.subtitleStyle
                    .copyWith(fontSize: 16),
              ),
            ),
          );
        },
      ),
    );
  }
}
