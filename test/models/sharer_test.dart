import 'package:flutter_test/flutter_test.dart';
import 'package:dataplug/models/sharer.dart'; // Updated import path

void main() {
  group('Sharer Model Tests', () {
    final sharerJson = {
      'name': 'Test Sharer',
      'speed': 'Fast',
      'trust': 0.9,
      'distance': 100,
      'slotsAvailable': 3,
      'slotsTotal': 5,
      'online': true,
      'lastSeen': 'Just now',
    };

    const sharerModel = Sharer(
      name: 'Test Sharer',
      speed: 'Fast',
      trust: 0.9,
      distance: 100,
      slotsAvailable: 3,
      slotsTotal: 5,
      online: true,
      lastSeen: 'Just now',
    );

    test('fromJson creates a valid Sharer model', () {
      final sharer = Sharer.fromJson(sharerJson);
      expect(sharer.name, 'Test Sharer');
      expect(sharer.speed, 'Fast');
      expect(sharer.trust, 0.9);
      expect(sharer.distance, 100);
      expect(sharer.slotsAvailable, 3);
      expect(sharer.slotsTotal, 5);
      expect(sharer.online, isTrue);
      expect(sharer.lastSeen, 'Just now');
    });

    test('toJson creates a valid JSON map', () {
      final json = sharerModel.toJson();
      expect(json, equals(sharerJson));
    });

    test('Equality operator works correctly', () {
      const sharer1 = Sharer(
        name: 'Sharer A',
        speed: 'Medium',
        trust: 0.75,
        distance: 150,
        slotsAvailable: 1,
        slotsTotal: 3,
        online: true,
        lastSeen: '5m ago',
      );
      const sharer2 = Sharer(
        name: 'Sharer A',
        speed: 'Medium',
        trust: 0.75,
        distance: 150,
        slotsAvailable: 1,
        slotsTotal: 3,
        online: true,
        lastSeen: '5m ago',
      );
      const sharer3 = Sharer(
        name: 'Sharer B', // Different name
        speed: 'Medium',
        trust: 0.75,
        distance: 150,
        slotsAvailable: 1,
        slotsTotal: 3,
        online: true,
        lastSeen: '5m ago',
      );

      expect(sharer1 == sharer2, isTrue);
      expect(sharer1.hashCode == sharer2.hashCode, isTrue);
      expect(sharer1 == sharer3, isFalse);
      expect(sharer1.hashCode == sharer3.hashCode, isFalse);
    });

     test('Sharer instances with different values are not equal', () {
      const s1 = Sharer(name: 'N1', speed: 'S1', trust: 0.1, distance: 10, slotsAvailable: 1, slotsTotal: 1, online: true, lastSeen: 'L1');
      const s2 = Sharer(name: 'N2', speed: 'S1', trust: 0.1, distance: 10, slotsAvailable: 1, slotsTotal: 1, online: true, lastSeen: 'L1'); // Different name
      const s3 = Sharer(name: 'N1', speed: 'S2', trust: 0.1, distance: 10, slotsAvailable: 1, slotsTotal: 1, online: true, lastSeen: 'L1'); // Different speed
      const s4 = Sharer(name: 'N1', speed: 'S1', trust: 0.2, distance: 10, slotsAvailable: 1, slotsTotal: 1, online: true, lastSeen: 'L1'); // Different trust
      // ... (could add more for each property)

      expect(s1 == s2, isFalse);
      expect(s1 == s3, isFalse);
      expect(s1 == s4, isFalse);
    });

    test('Sharer model is const constructible', () {
      // This test primarily serves to ensure that the const constructor works
      // and is enforced. If it weren't const, this wouldn't compile as a const assignment.
      const sharer = Sharer(
          name: 'Const Sharer',
          speed: 'Const',
          trust: 1.0,
          distance: 0,
          slotsAvailable: 0,
          slotsTotal: 0,
          online: false,
          lastSeen: 'Never');
      expect(sharer.name, 'Const Sharer'); // Basic check
    });
  });
}
