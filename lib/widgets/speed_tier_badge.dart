import 'package:flutter/material.dart';

class SpeedTierBadge extends StatelessWidget {
  final String tier;
  const SpeedTierBadge({required this.tier, super.key});

  Color get color {
    switch (tier) {
      case 'Good':
        return Colors.green;
      case 'Medium':
        return Colors.orange;
      case 'Slow':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(tier),
      backgroundColor: color.withOpacity(0.2),
      labelStyle: TextStyle(color: color, fontWeight: FontWeight.bold),
    );
  }
}
