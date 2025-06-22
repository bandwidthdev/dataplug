import 'package:flutter/material.dart';

class TrustScoreIndicator extends StatelessWidget {
  final double score; // 0.0 to 1.0
  const TrustScoreIndicator({required this.score, super.key});

  @override
  Widget build(BuildContext context) {
    Color color = score > 0.7
        ? Colors.green
        : (score > 0.4 ? Colors.orange : Colors.red);
    return Row(
      children: [
        Icon(Icons.verified_user, color: color, size: 20), // Color is dynamic
        const SizedBox(width: 4),
        Text(
          'Trust: ${(score * 100).toInt()}%', // Text content is dynamic
          style: TextStyle(color: color, fontWeight: FontWeight.bold), // Color is dynamic
        ),
      ],
    );
  }
}
