import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Language'),
            subtitle: const Text('English / Luganda'),
            trailing: Switch(value: false, onChanged: (v) {}), // Placeholder
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.accessibility),
            title: const Text('High Contrast'),
            trailing: Switch(value: false, onChanged: (v) {}), // Placeholder
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.brightness_6),
            title: const Text('Theme'),
            subtitle: const Text('Light / Dark'),
            trailing: Switch(
              value: false,
              onChanged: (v) {},
            ), // Placeholder for theme switch
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            subtitle: const Text('Manage your profile'),
            onTap: () {
              // Placeholder for profile management
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Profile'),
                  content: const Text('Profile management coming soon.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.feedback),
            title: const Text('Feedback / Support'),
            subtitle: const Text('Contact us or send feedback'),
            onTap: () {
              // Placeholder for feedback
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Feedback / Support'),
                  content: const Text(
                    'Contact support@dataplug.com or use the in-app feedback form (coming soon).',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About DataPlug'),
            subtitle: const Text('Version 1.0.0'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
