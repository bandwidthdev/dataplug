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
                Image.asset('assets/logo.png', height: 120),
                SizedBox(height: 32),
                Text(
                  'Welcome to DataPlug',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: 16),
                Text(
                  'Peer-to-peer bandwidth sharing for everyone.',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                ElevatedButton.icon(
                  icon: Icon(Icons.wifi),
                  label: Text('Share My Bandwidth'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(48),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => SharerDashboard()),
                    );
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton.icon(
                  icon: Icon(Icons.search),
                  label: Text('Find Nearby Sharers'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(48),
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
