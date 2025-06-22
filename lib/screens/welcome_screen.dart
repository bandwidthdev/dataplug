import 'package:flutter/material.dart';
import 'sharer_dashboard.dart';
import 'receiver_dashboard.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png', height: 120), // Assuming logo.png won't change often, this is fine. Const cannot be applied directly if path is dynamic, but here it's static.
                const SizedBox(height: 32),
                Text(
                  'Welcome to DataPlug',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Peer-to-peer bandwidth sharing for everyone.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                ElevatedButton.icon(
                  icon: const Icon(Icons.wifi),
                  label: const Text('Share My Bandwidth'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(48),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SharerDashboard()),
                    );
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  icon: const Icon(Icons.search),
                  label: const Text('Find Nearby Sharers'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(48),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => ReceiverDashboard()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
