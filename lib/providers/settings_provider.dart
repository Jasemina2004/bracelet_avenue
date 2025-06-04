import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  bool _darkModeEnabled = false;
  bool get darkModeEnabled => _darkModeEnabled;

  String _selectedLanguage = 'English';
  String get selectedLanguage => _selectedLanguage;

  // Map me përkthimet e thjeshta
  static const Map<String, Map<String, String>> localizedTexts = {
    'English': {
      'settings': 'Settings',
      'account_settings': 'Account Settings',
      'edit_profile': 'Edit Profile',
      'change_password': 'Change Password',
      'email_preferences': 'Email Preferences',
      'app_preferences': 'App Preferences',
      'dark_mode': 'Dark Mode',
      'notifications': 'Notifications',
      'language': 'Language',
      'about_app': 'About App',
      'app_version': 'App Version',
      'rate_us': 'Rate Us',
      'share_app': 'Share App',
      'privacy_policy': 'Privacy Policy',
      'select_language': 'Select Language',
      'notifications_enabled': 'Notifications Enabled',
      'notifications_disabled': 'Notifications Disabled',
    },
    'Shqip': {
      'settings': 'Cilësimet',
      'account_settings': 'Cilësimet e Llogarisë',
      'edit_profile': 'Ndrysho Profilin',
      'change_password': 'Ndrysho Fjalëkalimin',
      'email_preferences': 'Preferencat e Emailit',
      'app_preferences': 'Preferencat e Aplikacionit',
      'dark_mode': 'Modaliteti i Errët',
      'notifications': 'Njoftimet',
      'language': 'Gjuha',
      'about_app': 'Rreth Aplikacionit',
      'app_version': 'Versioni i Aplikacionit',
      'rate_us': 'Vlerëso Na',
      'share_app': 'Ndaje Aplikacionin',
      'privacy_policy': 'Politika e Privatësisë',
      'select_language': 'Zgjidh Gjuhën',
      'notifications_enabled': 'Njoftimet janë aktivizuar',
      'notifications_disabled': 'Njoftimet janë çaktivizuar',
    },
  };

  // Për të ruajtur në SharedPreferences
  static const String prefDarkMode = 'darkModeEnabled';
  static const String prefLanguage = 'selectedLanguage';

  SettingsProvider() {
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    _darkModeEnabled = prefs.getBool(prefDarkMode) ?? false;
    _selectedLanguage = prefs.getString(prefLanguage) ?? 'English';
    notifyListeners();
  }

  Future<void> setDarkMode(bool enabled) async {
    _darkModeEnabled = enabled;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(prefDarkMode, enabled);
    notifyListeners();
  }

  Future<void> setLanguage(String language) async {
    _selectedLanguage = language;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(prefLanguage, language);
    notifyListeners();
  }

  String translate(String key) {
    return localizedTexts[_selectedLanguage]?[key] ?? key;
  }
}
