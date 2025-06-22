import 'package:flutter/material.dart';

class VPNStatusIndicator extends StatelessWidget {
  final String status;
  const VPNStatusIndicator({required this.status, super.key});

  Color get color {
    switch (status) {
      case 'Connected':
        return Colors.green;
      case 'Connecting':
        return Colors.orange;
      case 'Error':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData get icon {
    switch (status) {
      case 'Connected':
        return Icons.vpn_lock;
      case 'Connecting':
        return Icons.sync;
      case 'Error':
        return Icons.error;
      default:
        return Icons.help;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color, size: 32), // Icon and color are dynamic
        const SizedBox(width: 12),
        Text(
          status, // Text content is dynamic
          style: TextStyle( // Color is dynamic
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
