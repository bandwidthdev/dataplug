import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/welcome_screen.dart';
import 'screens/onboarding_screen.dart';
import 'localization/app_localizations.dart';

void main() {
  runApp(const DataPlugApp());
}

class DataPlugApp extends StatefulWidget {
  const DataPlugApp({super.key});

  @override
  State<DataPlugApp> createState() => _DataPlugAppState();
}

class _DataPlugAppState extends State<DataPlugApp> {
  bool _showOnboarding = true;

  void _completeOnboarding() {
    setState(() => _showOnboarding = false);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DataPlug',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: _showOnboarding
          ? OnboardingScreen(onGetStarted: _completeOnboarding)
          : WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
