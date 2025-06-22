import 'package:flutter/material.dart';
import '../widgets/proximity_indicator.dart';
import '../widgets/speed_tier_badge.dart';
import '../widgets/status_card.dart';
import '../widgets/trust_score_indicator.dart';
import '../widgets/connection_animation.dart';

class Sharer {
  final String name;
  final String speed;
  final double trust;
  final int distance;
  final int slotsAvailable;
  final int slotsTotal;
  final bool online;
  final String lastSeen;

  Sharer({
    required this.name,
    required this.speed,
    required this.trust,
    required this.distance,
    required this.slotsAvailable,
    required this.slotsTotal,
    required this.online,
    required this.lastSeen,
  });
}

class ReceiverDashboard extends StatefulWidget {
  const ReceiverDashboard({super.key});

  @override
  State<ReceiverDashboard> createState() => _ReceiverDashboardState();
}

class _ReceiverDashboardState extends State<ReceiverDashboard> {
  bool isConnecting = false;
  String connectionState = '';
  final List<Sharer> sharers = [
    Sharer(
      name: 'Sharer #1',
      speed: 'Good',
      trust: 0.85,
      distance: 120,
      slotsAvailable: 2,
      slotsTotal: 5,
      online: true,
      lastSeen: 'Online now',
    ),
    Sharer(
      name: 'Sharer #2',
      speed: 'Medium',
      trust: 0.6,
      distance: 350,
      slotsAvailable: 0,
      slotsTotal: 3,
      online: false,
      lastSeen: 'Last seen 2m ago',
    ),
  ];

  void _refreshSharers() {
    // Placeholder for refresh logic
    setState(() {});
  }

  void _connectToSharer(int index) {
    setState(() {
      isConnecting = true;
      connectionState = 'connecting';
    });
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        // Simulate connection result
        if (sharers[index].slotsAvailable == 0) {
          connectionState = 'error';
        } else {
          connectionState = 'connected';
        }
        isConnecting = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Sharers'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshSharers,
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: isConnecting
          ? Center(child: ConnectionAnimation(state: connectionState))
          : sharers.isEmpty
          ? Center(
              child: StatusCard(
                status: 'Offline',
                message:
                    'No live sharers found. Try moving closer to campus or refreshing.',
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: sharers.length,
              itemBuilder: (context, i) {
                final sharer = sharers[i];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: ListTile(
                    leading: SpeedTierBadge(tier: sharer.speed),
                    title: Row(
                      children: [
                        Text(sharer.name),
                        const SizedBox(width: 8),
                        TrustScoreIndicator(score: sharer.trust),
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProximityIndicator(distanceMeters: sharer.distance),
                        Text(
                          'Slots: ${sharer.slotsAvailable}/${sharer.slotsTotal}',
                        ),
                        Text(
                          sharer.lastSeen,
                          style: TextStyle(
                            fontSize: 12,
                            color: sharer.online ? Colors.green : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    trailing: ElevatedButton(
                      onPressed: sharer.slotsAvailable == 0
                          ? null
                          : () => _connectToSharer(i),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(90, 40),
                      ),
                      child: const Text('Connect'),
                    ),
                    isThreeLine: true,
                  ),
                );
              },
            ),
    );
  }
}
