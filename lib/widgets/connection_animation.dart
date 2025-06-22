import 'package:flutter/material.dart';

class ConnectionAnimation extends StatelessWidget {
  final String state; // 'connecting', 'connected', 'error'
  const ConnectionAnimation({required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    if (state == 'connecting') {
      return Column(
        mainAxisSize: MainAxisSize.min, // Added for potentially better layout
        children: [
          CircularProgressIndicator(), // Not const
          const SizedBox(height: 12),
          const Text('Connecting...'),
        ],
      );
    } else if (state == 'connected') {
      return Column(
        mainAxisSize: MainAxisSize.min, // Added for potentially better layout
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 48),
          const SizedBox(height: 12),
          const Text('Connected!'),
        ],
      );
    } else { // Assuming 'error' or other default
      return Column(
        mainAxisSize: MainAxisSize.min, // Added for potentially better layout
        children: [
          const Icon(Icons.error, color: Colors.red, size: 48),
          const SizedBox(height: 12),
          const Text('Connection Failed'),
        ],
      );
    }
  }
}
