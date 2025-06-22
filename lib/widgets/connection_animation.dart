import 'package:flutter/material.dart';

class ConnectionAnimation extends StatelessWidget {
  final String state; // 'connecting', 'connected', 'error'
  const ConnectionAnimation({required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    if (state == 'connecting') {
      return Column(
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 12),
          Text('Connecting...'),
        ],
      );
    } else if (state == 'connected') {
      return Column(
        children: [
          Icon(Icons.check_circle, color: Colors.green, size: 48),
          SizedBox(height: 12),
          Text('Connected!'),
        ],
      );
    } else {
      return Column(
        children: [
          Icon(Icons.error, color: Colors.red, size: 48),
          SizedBox(height: 12),
          Text('Connection Failed'),
        ],
      );
    }
  }
}
