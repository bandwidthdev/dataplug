// This class definition is moved from lib/screens/receiver_dashboard.dart
class Sharer {
  final String name;
  final String speed;
  final double trust;
  final int distance;
  final int slotsAvailable;
  final int slotsTotal;
  final bool online;
  final String lastSeen;

  const Sharer({
    required this.name,
    required this.speed,
    required this.trust,
    required this.distance,
    required this.slotsAvailable,
    required this.slotsTotal,
    required this.online,
    required this.lastSeen,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Sharer &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          speed == other.speed &&
          trust == other.trust &&
          distance == other.distance &&
          slotsAvailable == other.slotsAvailable &&
          slotsTotal == other.slotsTotal &&
          online == other.online &&
          lastSeen == other.lastSeen;

  @override
  int get hashCode =>
      name.hashCode ^
      speed.hashCode ^
      trust.hashCode ^
      distance.hashCode ^
      slotsAvailable.hashCode ^
      slotsTotal.hashCode ^
      online.hashCode ^
      lastSeen.hashCode;

  factory Sharer.fromJson(Map<String, dynamic> json) {
    return Sharer(
      name: json['name'] as String,
      speed: json['speed'] as String,
      trust: (json['trust'] as num).toDouble(),
      distance: json['distance'] as int,
      slotsAvailable: json['slotsAvailable'] as int,
      slotsTotal: json['slotsTotal'] as int,
      online: json['online'] as bool,
      lastSeen: json['lastSeen'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'speed': speed,
      'trust': trust,
      'distance': distance,
      'slotsAvailable': slotsAvailable,
      'slotsTotal': slotsTotal,
      'online': online,
      'lastSeen': lastSeen,
    };
  }
}
