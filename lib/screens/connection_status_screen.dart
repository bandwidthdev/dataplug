import 'package:flutter/material.dart';
import '../widgets/vpn_status_indicator.dart';
import '../widgets/bandwidth_meter.dart';
import '../widgets/status_card.dart';

class ConnectionStatusScreen extends StatelessWidget {
  final String vpnStatus;
  final double usage;
  final double max;
  final String status;
  final String message;

  const ConnectionStatusScreen({
    this.vpnStatus = 'Connected',
    this.usage = 3.5,
    this.max = 10.0,
    this.status = 'Active',
    this.message = 'Connection is stable',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Connection Status')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            VPNStatusIndicator(status: vpnStatus),
            SizedBox(height: 16),
            Text('Bandwidth Usage'),
            BandwidthMeter(usage: usage, max: max),
            SizedBox(height: 16),
            StatusCard(status: status, message: message),
          ],
        ),
      ),
    );
  }
}
