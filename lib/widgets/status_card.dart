import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  final String status;
  final String message;
  const StatusCard({required this.status, required this.message, super.key});

  Color get color {
    switch (status) {
      case 'Active':
        return Colors.green;
      case 'Offline':
        return Colors.red;
      case 'Error':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color.withOpacity(0.1),
      child: ListTile(
        leading: Icon(Icons.info, color: color),
        title: Text(
          status,
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(message),
      ),
    );
  }
}
