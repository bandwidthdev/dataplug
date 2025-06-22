import 'package:flutter/material.dart';

class ProximityIndicator extends StatelessWidget {
  final int distanceMeters;
  const ProximityIndicator({required this.distanceMeters, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.location_on, color: Colors.blue, size: 18),
        const SizedBox(width: 4),
        Text('$distanceMeters m away', style: const TextStyle(fontSize: 12)), // Text content is dynamic
      ],
    );
  }
}
