import 'package:flutter/material.dart';
import '../widgets/speed_tier_badge.dart';
import '../widgets/bandwidth_meter.dart';
import '../widgets/user_slot_selector.dart';
import '../widgets/status_card.dart';

class SharerDashboard extends StatelessWidget {
  const SharerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sharer Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SwitchListTile(
              title: Text('Enable Sharing'),
              value: true,
              onChanged: (val) {},
            ),
            SizedBox(height: 16),
            Text('Speed Tier'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpeedTierBadge(tier: 'Good'),
                SpeedTierBadge(tier: 'Medium'),
                SpeedTierBadge(tier: 'Slow'),
              ],
            ),
            SizedBox(height: 16),
            UserSlotSelector(currentSlots: 2, maxSlots: 5, onChanged: (v) {}),
            SizedBox(height: 16),
            Text('Bandwidth Usage'),
            BandwidthMeter(usage: 5.2, max: 10.0),
            SizedBox(height: 16),
            StatusCard(status: 'Active', message: '2 receivers connected'),
          ],
        ),
      ),
    );
  }
}
