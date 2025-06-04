import 'package:flutter/material.dart';
import 'package:bracelet_avenue/models/blog.dart';
import 'package:bracelet_avenue/constants.dart' as app_constants;

class BlogDetailScreen extends StatelessWidget {
  final Blog blog;

  const BlogDetailScreen({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    // Define detailed content for each blog
    final Map<String, Map<String, String>> blogContents = {
      '1': {
        'title': 'The Beauty Born from the Master\'s Hand',
        'content': '''
In a world where everything is becoming increasingly automated, handcrafted jewelry stands as a testament to slow, dedicated artistry. Every detail, every curve, every precisely placed stone carries a story - that of the artisan who created it and the inspiration behind it.

At Bracelet Avenue, we celebrate this rare art by bringing you collections that are more than accessories - they're wearable art that speaks. From traditional techniques to modern combinations, each piece is as unique as you are.

### The Craftsmanship Difference
- **Unique Designs**: No two pieces are exactly alike
- **Quality Materials**: Only premium metals and gemstones
- **Attention to Detail**: Hours spent perfecting each element
- **Sustainable Practices**: Ethically sourced materials

Our artisans combine centuries-old techniques with contemporary aesthetics to create pieces that tell your story while honoring the tradition of fine jewelry making.
''',
        'quote':
            '"Jewelry is like the perfect spice - it complements but should never overpower the wearer."',
      },
      '2': {
        'title': 'This Season\'s Hottest Trends That Shine',
        'content': '''
Jewelry fashion is never static - it evolves with the rhythm of new inspirations and bold desires. This season, minimalist style blends with glamorous sparkle, while pastel colors and organic shapes dominate every runway.

At Bracelet Avenue, we keep pace with the times without losing classic elegance. Whether you're passionate about delicate rings, layered necklaces, or bold bracelets, our new collection has something for your heart. Because your style deserves to speak before you do.

### Trending Now:
✨ **Mixed Metals**: Gold and silver combinations  
✨ **Organic Shapes**: Asymmetrical and nature-inspired  
✨ **Personalized Pieces**: Initials and meaningful symbols  
✨ **Statement Earrings**: Bold designs that frame your face  

Discover how to mix and match these trends to create your signature look that transitions effortlessly from day to night.
''',
        'quote': '"Fashion fades, style is eternal." - Yves Saint Laurent',
      },
      '3': {
        'title': 'Caring for Your Jewelry to Keep It Brilliant Forever',
        'content': '''
Jewelry is more than decoration - it's memories, emotions, and gifts from the heart. For this reason, it deserves special care.

### Essential Care Tips:
1. **Keep away from moisture**, perfumes and harsh chemicals
2. **Clean gently** using a soft cloth
3. **Store properly** in individual boxes, away from direct sunlight
4. **Regular check-ups** for clasps and settings
5. **Professional cleaning** every 6 months for precious pieces

At Bracelet Avenue, we teach you not only how to choose beautiful jewelry but also how to maintain it so it lasts for years to come - a brilliance that never fades.

### When to Remove Your Jewelry:
- Showering or swimming  
- Applying makeup or perfume  
- Exercising or manual work  
- Sleeping (to prevent damage)  

Follow these simple practices and your treasured pieces will maintain their beauty for generations.
''',
        'quote':
            '"Fine jewelry is like a good friend - it lasts forever when treated with care."',
      },
    };

    // Get content for this specific blog or use defaults
    final content = blogContents[blog.id] ??
        {
          'title': blog.title,
          'content': blog.description,
          'quote': '',
        };

    return Scaffold(
      appBar: AppBar(
        title: Text(blog.title),
        backgroundColor: app_constants.AppColors.primary,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero image with smooth transition
            Hero(
              tag: 'blog-image-${blog.id}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  blog.imageUrl,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 25),

            // Blog title
            Text(
              content['title']!,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: app_constants.AppColors.primary,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 10),

            // Author and date row
            Row(
              children: [
                Icon(Icons.person_outline, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 5),
                Text(
                  'By ${blog.author}',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(width: 15),
                Icon(Icons.calendar_today, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 5),
                Text(
                  blog.date,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
            const SizedBox(height: 25),

            // Inspirational quote box
            if (content['quote']!.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: app_constants.AppColors.accent.withValues(),
                  borderRadius: BorderRadius.circular(10),
                  border: const Border(
                    left: BorderSide(
                      color: app_constants.AppColors.primary,
                      width: 3,
                    ),
                  ),
                ),
                child: Text(
                  content['quote']!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: app_constants.AppColors.textPrimary,
                  ),
                ),
              ),

            // Blog content with formatted paragraphs
            ...content['content']!.split('\n').map((paragraph) {
              if (paragraph.startsWith('###')) {
                // Section heading
                return Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 8),
                  child: Text(
                    paragraph.replaceAll('###', ''),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: app_constants.AppColors.primary,
                    ),
                  ),
                );
              } else if (paragraph.startsWith('✨') ||
                  paragraph.startsWith('-')) {
                // Bullet points
                return Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('• ', style: TextStyle(fontSize: 16)),
                      Expanded(
                        child: Text(
                          paragraph.substring(1).trim(),
                          style: const TextStyle(
                            fontSize: 16,
                            height: 1.5,
                            color: app_constants.AppColors.textPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else if (paragraph.trim().isEmpty) {
                // Empty line (spacing)
                return const SizedBox(height: 10);
              }
              // Regular paragraph
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  paragraph,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.6,
                    color: app_constants.AppColors.textPrimary,
                  ),
                ),
              );
            }).toList(),

            const SizedBox(height: 30),

            // Back button
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: app_constants.AppColors.primary,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  'Back to Articles',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
