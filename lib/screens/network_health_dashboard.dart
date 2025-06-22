import 'package:flutter/material.dart';

class NetworkHealthDashboard extends StatelessWidget {
  const NetworkHealthDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Network Health')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Uptime: 12h 34m',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 12),
            Text('Sessions: 8'),
            SizedBox(height: 12),
            Text('Avg. Speed: 8.2 Mbps'),
            SizedBox(height: 12),
            Text('Last Disconnect: 2h ago'),
            SizedBox(height: 24),
            Text(
              'Performance Graph (coming soon)',
              style: TextStyle(color: Colors.grey),
            ),
            Expanded(
              child: Center(
                child: Icon(
                  Icons.show_chart,
                  size: 64,
                  color: Colors.grey[300],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
