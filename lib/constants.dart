import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFF3A8C2); // Rozë e butë e përqendruar
  static const Color secondary = Color(0xFFD6B8D1); // Rozë-ljila harmonike
  static const Color background =
      Color(0xFFFEF5F9); // Rozë shumë i çelët (almost white)
  static const Color cardBackground =
      Color(0xFFFFFBFF); // Bardhë me nuancë rozë

  static const Color textPrimary = Color(0xFF4A2C3A);
  static const Color textSecondary = Color(0xFF7D5D6E);
  static const Color textTertiary = Color(0xFF9E8A98);

  static const Color accent = Color(0xFFE67F9F);
  static const Color accentLight = Color(0xFFF8D0DD);

  static const Color error = Color(0xFFE57373);
  static const Color success = Color(0xFF81C784);
  static const Color warning = Color(0xFFFFB74D);

  static const Color surface = Color(0xFFFFFFFF);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onSurface = Color(0xFF4A2C3A);
  static const Color onBackground = Color(0xFF4A2C3A);
  static const Color onError = Color(0xFFFFFFFF);
}

class AppStyles {
  static const TextStyle titleStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    letterSpacing: 0.5,
    height: 1.3,
  );

  static const TextStyle subtitleStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    letterSpacing: 0.1,
    height: 1.4,
  );

  static const TextStyle displayLarge = titleStyle;
  static const TextStyle headlineStyle = titleStyle;
  static const TextStyle subheadStyle = subtitleStyle;

  static const TextStyle bodyStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.5,
    letterSpacing: 0.1,
  );

  static const TextStyle captionStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.4,
  );

  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.onPrimary,
    letterSpacing: 0.5,
  );

  static const TextStyle overlineStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textTertiary,
    letterSpacing: 0.5,
  );
}

class AppImages {
  static const String logo = 'assets/images/logo.jpg.jpg';

  static const String carousel1 = 'assets/images/j (19).JPG';
  static const String carousel2 = 'assets/images/j (21).JPG';
  static const String carousel3 = 'assets/images/j (22).JPG';

  static const String blog1 = 'assets/images/blog1.jpg';
  static const String blog2 = 'assets/images/blog2.jpg';
  static const String blog3 = 'assets/images/blog3.jpg';

  static const String product1 = 'assets/images/j(1).jpg';
  static const String product2 = 'assets/images/j(2).jpg';
  static const String product3 = 'assets/images/j(3).jpg';
  static const String product4 = 'assets/images/p4.jpg';
  static const String product5 = 'assets/images/p5.jpg';
  static const String product6 = 'assets/images/p6.jpg';
  static const String product7 = 'assets/images/p7.jpg';
  static const String product8 = 'assets/images/p8.jpg';
  static const String product9 = 'assets/images/p9.jpg';
  static const String product10 = 'assets/images/p10.jpg';
  static const String product11 = 'assets/images/p11.jpg';
  static const String product12 = 'assets/images/p12.jpg';
}

class ApiEndpoints {
  static const String baseUrl = 'https://your-api-url.com/api';
  static String get favorites => '$baseUrl/favorites';
  static const String login = '$baseUrl/login';
  static const String register = '$baseUrl/register';
  static const String products = '$baseUrl/products';

  static const String userProfile = '$baseUrl/user/profile';
  static const String categories = '$baseUrl/categories';
  static const String search = '$baseUrl/search';
}
