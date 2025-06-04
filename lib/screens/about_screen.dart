import 'package:flutter/material.dart';
import 'package:bracelet_avenue/widgets/drawer_widget.dart';
import 'package:bracelet_avenue/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bracelet_avenue/screens/contact_screen.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Bracelet Avenue'),
        backgroundColor: AppColors.primary,
        elevation: 0,
        centerTitle: true,
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeroSection(),
            const SizedBox(height: 30),
            _buildSectionTitle('Our Story'),
            _buildContentCard(
                'Founded in 2023, Bracelet Avenue began as a small passion project in a home workshop. '
                'What started with just a few beads and some thread has grown into a thriving community '
                'of jewelry lovers and artisans. Each piece in our collection carries the dedication '
                'and love of our craftspeople who pour their creativity into every design.'),
            const SizedBox(height: 20),
            _buildSectionTitle('Our Mission'),
            _buildMissionGrid(),
            const SizedBox(height: 20),
            _buildSectionTitle('Our Values'),
            _buildValuesSection(),
            const SizedBox(height: 20),
            _buildSectionTitle('Meet The Team'),
            _buildTeamCarousel(),
            const SizedBox(height: 20),
            _buildSectionTitle('What Our Customers Say'),
            _buildTestimonials(),
            const SizedBox(height: 20),
            _buildContactCTA(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: const DecorationImage(
          image: AssetImage('assets/images/about_hero.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color.fromRGBO(255, 255, 255, 0.7),
              Colors.transparent,
            ],
          ),
        ),
        child: const Center(
          child: Text(
            'Handcrafted With Love',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  blurRadius: 10,
                  color: Color(0x80000000),
                  offset: Offset(2, 2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
      ),
    );
  }

  Widget _buildContentCard(String text) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: AppColors.cardBackground,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          text,
          style: AppStyles.bodyStyle,
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }

  Widget _buildMissionGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 1.2,
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      children: [
        _buildMissionItem(FontAwesomeIcons.handHoldingHeart, 'Ethical Sourcing',
            'We use only conflict-free materials and sustainable practices'),
        _buildMissionItem(FontAwesomeIcons.heart, 'Handmade Quality',
            'Each piece is individually crafted with attention to detail'),
        _buildMissionItem(FontAwesomeIcons.users, 'Community Focus',
            'We support local artisans and fair trade principles'),
        _buildMissionItem(FontAwesomeIcons.leaf, 'Eco-Friendly',
            'Minimal waste packaging and recycled materials'),
      ],
    );
  }

  Widget _buildMissionItem(IconData icon, String title, String text) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.primary, size: 30),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            Text(
              text,
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildValuesSection() {
    return Column(
      children: [
        _buildValueItem('Creativity', 0.9),
        _buildValueItem('Quality', 0.95),
        _buildValueItem('Sustainability', 0.85),
        _buildValueItem('Community', 0.9),
      ],
    );
  }

  Widget _buildValueItem(String value, double percentage) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('${(percentage * 100).toInt()}%'),
            ],
          ),
          const SizedBox(height: 5),
          LinearProgressIndicator(
            value: percentage,
            backgroundColor: Colors.grey[200],
            color: AppColors.primary,
            minHeight: 10,
            borderRadius: BorderRadius.circular(5),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamCarousel() {
    const teamMembers = [
      {
        'name': 'Jasemina Moli',
        'role': 'Founder & Lead Designer',
        'image': 'assets/images/jasemina.jpeg'
      },
      {
        'name': 'Aldo Toska',
        'role': 'Production Manager',
        'image': 'assets/images/aldo.jpeg'
      },
      {
        'name': 'Omer Hoxha',
        'role': 'Customer Relations ',
        'image': 'assets/images/omer.jpeg'
      },
    ];

    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: teamMembers.length,
        itemBuilder: (context, index) {
          return Container(
            width: 140,
            margin: const EdgeInsets.only(right: 15),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(teamMembers[index]['image']!),
                ),
                const SizedBox(height: 8),
                Text(
                  teamMembers[index]['name']!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Text(
                  teamMembers[index]['role']!,
                  style: const TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTestimonials() {
    const testimonials = [
      {
        'text':
            'I absolutely love my bracelet! The craftsmanship is incredible and it gets compliments everywhere I go.',
        'author': 'Emanuela S.'
      },
      {
        'text':
            'The most comfortable and beautiful jewelry I own. Knowing it\'s ethically made makes it even better!',
        'author': 'Geri S.'
      },
    ];

    return Column(
      children: testimonials
          .map((testimonial) => Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        const Icon(Icons.format_quote, color: Colors.grey),
                        const SizedBox(height: 10),
                        Text(
                          testimonial['text']!,
                          style: AppStyles.bodyStyle,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '- ${testimonial['author']!}',
                          style: const TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }

  Widget _buildContactCTA(BuildContext context) {
    return Card(
      color: const Color(0x1AFF66CC), // 10% opacity of primary color
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(color: AppColors.primary, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Have Questions?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'We\'d love to hear from you! Contact our team for any inquiries.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ContactScreen()),
                );
              },
              child: const Text('Contact Us'),
            ),
          ],
        ),
      ),
    );
  }
}
