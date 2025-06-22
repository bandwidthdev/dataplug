import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  final VoidCallback onGetStarted;
  const OnboardingScreen({required this.onGetStarted, super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _page = 0;
  final List<_OnboardingPage> _pages = const [
    _OnboardingPage(
      icon: Icons.wifi_tethering,
      title: 'Welcome to DataPlug',
      description:
          'Share your internet securely with others and help make data affordable for everyone in Uganda.',
    ),
    _OnboardingPage(
      icon: Icons.lock,
      title: 'Secure & Private',
      description:
          'All connections use end-to-end WireGuard VPN encryption. No signup required.',
    ),
    _OnboardingPage(
      icon: Icons.offline_bolt,
      title: 'Works Offline',
      description:
          'Peer discovery and cached connections work even with low or no data.',
    ),
    _OnboardingPage(
      icon: Icons.speed,
      title: 'You Control Bandwidth',
      description:
          'Set speed tiers and slots. Share only what you want, when you want.',
    ),
  ];

  void _next() {
    if (_page < _pages.length - 1) {
      setState(() => _page++);
    } else {
      widget.onGetStarted();
    }
  }

  void _skip() {
    widget.onGetStarted();
  }

  @override
  Widget build(BuildContext context) {
    final page = _pages[_page];
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(page.icon, size: 80, color: Theme.of(context).primaryColor),
              const SizedBox(height: 32),
              Text(
                page.title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 16),
              Text(page.description, textAlign: TextAlign.center),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _pages.length,
                  (i) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: i == _page
                          ? Theme.of(context).primaryColor
                          : Colors.grey[300],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(onPressed: _skip, child: const Text('Skip')),
                  ElevatedButton(
                    onPressed: _next,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(120, 48),
                    ),
                    child: Text(
                      _page == _pages.length - 1 ? 'Get Started' : 'Next',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OnboardingPage {
  final IconData icon;
  final String title;
  final String description;
  const _OnboardingPage({
    required this.icon,
    required this.title,
    required this.description,
  });
}
