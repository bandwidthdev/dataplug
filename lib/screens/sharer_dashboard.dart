import 'package:flutter/material.dart';
import '../widgets/speed_tier_badge.dart';
import '../widgets/bandwidth_meter.dart';
import '../widgets/user_slot_selector.dart';
import '../widgets/status_card.dart';

class SharerDashboard extends StatefulWidget {
  const SharerDashboard({super.key});

  @override
  State<SharerDashboard> createState() => _SharerDashboardState();
}

class _SharerDashboardState extends State<SharerDashboard> {
  bool _isSharingEnabled = false; // Default to false
  int _currentSlots = 1; // Default to 1 slot
  final int _maxSlots = 5; // Max slots available

  void _toggleSharing(bool value) {
    setState(() {
      _isSharingEnabled = value;
      // TODO: Add logic to publish availability to Firebase/backend
      // TODO: Add logic to start/stop WireGuard server or sharing service
      print('Sharing enabled: $_isSharingEnabled');
    });
  }

  void _updateSlots(int newSlotValue) {
    if (newSlotValue >= 1 && newSlotValue <= _maxSlots) {
      setState(() {
        _currentSlots = newSlotValue;
        // TODO: Add logic to update slot count in Firebase/backend
        print('Current slots: $_currentSlots');
      });
    }
  }

  // TODO: Add state and logic for selecting speed tier

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sharer Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SwitchListTile(
              title: const Text('Enable Sharing'),
              value: _isSharingEnabled,
              onChanged: _toggleSharing,
              secondary: Icon(_isSharingEnabled ? Icons.wifi : Icons.wifi_off),
            ),
            const SizedBox(height: 16),
            const Text('Speed Tier'), // TODO: Make this interactive
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpeedTierBadge(tier: 'Good'), // Placeholder, make selectable
                SpeedTierBadge(tier: 'Medium'),
                SpeedTierBadge(tier: 'Slow'),
              ],
            ),
            const SizedBox(height: 16),
            UserSlotSelector(
              currentSlots: _currentSlots,
              maxSlots: _maxSlots,
              onChanged: _updateSlots,
            ),
            const SizedBox(height: 16),
            const Text('Bandwidth Usage'),
            const BandwidthMeter(usage: 0.0, max: 10.0), // TODO: Make usage dynamic
            const SizedBox(height: 16),
            // TODO: Make StatusCard dynamic based on actual sharing status and connections
            StatusCard(
                status: _isSharingEnabled ? 'Active' : 'Inactive',
                message: _isSharingEnabled
                    ? '$_currentSlots slots available. 0 receivers connected.' // Placeholder
                    : 'Sharing is currently disabled.'),
          ],
        ),
      ),
    );
  }
}
