import 'package:flutter/material.dart';

class BandwidthMeter extends StatelessWidget {
  final double usage;
  final double max;
  const BandwidthMeter({required this.usage, required this.max, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LinearProgressIndicator(
          value: usage / max,
          minHeight: 12,
          backgroundColor: Colors.grey[300],
          color: Colors.blue,
        ),
        SizedBox(height: 4),
        Text(
          '${usage.toStringAsFixed(1)} Mbps / ${max.toStringAsFixed(1)} Mbps',
        ),
      ],
    );
  }
}
