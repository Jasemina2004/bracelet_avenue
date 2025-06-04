import 'package:flutter/material.dart';
import 'package:bracelet_avenue/constants.dart' as app_constants;

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  String _selectedLanguage = 'English';

  final List<String> _languages = ['English', 'Shqip'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: app_constants.AppColors.primary,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(title: 'Account Settings'),
            AccountSettingsSection(
                onEditProfile: _handleEditProfile,
                onChangePassword: _handleChangePassword,
                onEmailPreferences: _handleEmailPreferences),
            const SizedBox(height: 20),
            const SectionTitle(title: 'App Preferences'),
            AppPreferencesSection(
              darkModeEnabled: _darkModeEnabled,
              notificationsEnabled: _notificationsEnabled,
              selectedLanguage: _selectedLanguage,
              languages: _languages,
              onDarkModeChanged: (val) =>
                  setState(() => _darkModeEnabled = val),
              onNotificationsChanged: (val) =>
                  setState(() => _notificationsEnabled = val),
              onLanguageTap: _showLanguageDialog,
            ),
            const SizedBox(height: 20),
            const SectionTitle(title: 'About App'),
            AboutAppSection(
              onRateUs: _handleRateUs,
              onShareApp: _handleShareApp,
              onPrivacyPolicy: _handlePrivacyPolicy,
            ),
          ],
        ),
      ),
    );
  }

  // Handlers for Account Settings
  void _handleEditProfile() {
    // TODO: Navigate to profile edit screen
  }

  void _handleChangePassword() {
    // TODO: Navigate to password change screen
  }

  void _handleEmailPreferences() {
    // TODO: Navigate to email preferences screen
  }

  // Handlers for About App
  void _handleRateUs() {
    // TODO: Open app store for rating
  }

  void _handleShareApp() {
    // TODO: Implement share functionality
  }

  void _handlePrivacyPolicy() {
    // TODO: Open privacy policy page
  }

  // Show language selection dialog
  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Language'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: _languages.map((lang) {
              return RadioListTile<String>(
                title: Text(lang),
                value: lang,
                groupValue: _selectedLanguage,
                onChanged: (value) {
                  if (value != null) {
                    setState(() => _selectedLanguage = value);
                    Navigator.pop(context);
                  }
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: app_constants.AppColors.primary,
        ),
      ),
    );
  }
}

// Seksioni për Account Settings
class AccountSettingsSection extends StatelessWidget {
  final VoidCallback onEditProfile;
  final VoidCallback onChangePassword;
  final VoidCallback onEmailPreferences;

  const AccountSettingsSection({
    super.key,
    required this.onEditProfile,
    required this.onChangePassword,
    required this.onEmailPreferences,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Edit Profile'),
            trailing: const Icon(Icons.chevron_right),
            onTap: onEditProfile,
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Change Password'),
            trailing: const Icon(Icons.chevron_right),
            onTap: onChangePassword,
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text('Email Preferences'),
            trailing: const Icon(Icons.chevron_right),
            onTap: onEmailPreferences,
          ),
        ],
      ),
    );
  }
}

// Seksioni për App Preferences
class AppPreferencesSection extends StatelessWidget {
  final bool darkModeEnabled;
  final bool notificationsEnabled;
  final String selectedLanguage;
  final List<String> languages;

  final ValueChanged<bool> onDarkModeChanged;
  final ValueChanged<bool> onNotificationsChanged;
  final VoidCallback onLanguageTap;

  const AppPreferencesSection({
    super.key,
    required this.darkModeEnabled,
    required this.notificationsEnabled,
    required this.selectedLanguage,
    required this.languages,
    required this.onDarkModeChanged,
    required this.onNotificationsChanged,
    required this.onLanguageTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: darkModeEnabled,
            onChanged: onDarkModeChanged,
            secondary: const Icon(Icons.dark_mode),
          ),
          SwitchListTile(
            title: const Text('Notifications'),
            value: notificationsEnabled,
            onChanged: onNotificationsChanged,
            secondary: const Icon(Icons.notifications),
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Language'),
            subtitle: Text(selectedLanguage),
            trailing: const Icon(Icons.chevron_right),
            onTap: onLanguageTap,
          ),
        ],
      ),
    );
  }
}

// Seksioni për About App
class AboutAppSection extends StatelessWidget {
  final VoidCallback onRateUs;
  final VoidCallback onShareApp;
  final VoidCallback onPrivacyPolicy;

  const AboutAppSection({
    super.key,
    required this.onRateUs,
    required this.onShareApp,
    required this.onPrivacyPolicy,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          const ListTile(
            leading: Icon(Icons.info),
            title: Text('App Version'),
            subtitle: Text('1.0.0'),
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.star),
            title: const Text('Rate Us'),
            onTap: onRateUs,
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Share App'),
            onTap: onShareApp,
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Privacy Policy'),
            onTap: onPrivacyPolicy,
          ),
        ],
      ),
    );
  }
}
