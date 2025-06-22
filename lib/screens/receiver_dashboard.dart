import 'package:flutter/material.dart';
import '../widgets/proximity_indicator.dart';
import '../widgets/speed_tier_badge.dart';
import '../widgets/status_card.dart';
import '../widgets/trust_score_indicator.dart';
import '../widgets/connection_animation.dart';
import '../models/sharer.dart'; // Import the moved Sharer model

class ReceiverDashboard extends StatefulWidget {
  const ReceiverDashboard({super.key}); // Ensure this is const if possible

  @override
  State<ReceiverDashboard> createState() => _ReceiverDashboardState();
}

class _ReceiverDashboardState extends State<ReceiverDashboard> {
  bool isConnecting = false;
  String connectionState = '';
  final List<Sharer> sharers = [
    const Sharer( // Added const
      name: 'Sharer #1',
      speed: 'Good',
      trust: 0.85,
      distance: 120,
      slotsAvailable: 2,
      slotsTotal: 5,
      online: true,
      lastSeen: 'Online now',
    ),
    const Sharer( // Added const
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
            tooltip: 'Refresh', // This can be const if desired, but often not done for tooltips
          ),
        ],
      ),
      body: isConnecting
          ? Center(child: ConnectionAnimation(state: connectionState)) // state is dynamic
          : sharers.isEmpty
          ? const Center( // If StatusCard can be const and its message is fixed or from a const source
              child: StatusCard( // This specific message isn't const, so StatusCard call cannot be const
                status: 'Offline', // This could be const if StatusCard constructor is const
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
                    leading: SpeedTierBadge(tier: sharer.speed), // tier is dynamic
                    title: Row(
                      children: [
                        Text(sharer.name), // name is dynamic
                        const SizedBox(width: 8),
                        TrustScoreIndicator(score: sharer.trust), // score is dynamic
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProximityIndicator(distanceMeters: sharer.distance), // distance is dynamic
                        Text( // content is dynamic
                          'Slots: ${sharer.slotsAvailable}/${sharer.slotsTotal}',
                        ),
                        Text( // content and style are dynamic
                          sharer.lastSeen,
                          style: TextStyle(
                            fontSize: 12, // This could be const TextStyle(fontSize:12) and color applied separately if needed
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
                      child: const Text('Connect'), // Text is const
                    ),
                    isThreeLine: true,
                  ),
                );
              },
            ),
    );
  }
}
