import 'package:flutter/material.dart';

class ProximityIndicator extends StatelessWidget {
  final int distanceMeters;
  const ProximityIndicator({required this.distanceMeters, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.location_on, color: Colors.blue, size: 18),
        SizedBox(width: 4),
        Text('$distanceMeters m away', style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
