import 'package:flutter/material.dart';

class UserSlotSelector extends StatelessWidget {
  final int currentSlots;
  final int maxSlots;
  final ValueChanged<int> onChanged;
  const UserSlotSelector({
    required this.currentSlots,
    required this.maxSlots,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Slots:'),
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: currentSlots > 1
              ? () => onChanged(currentSlots - 1)
              : null,
        ),
        Text('$currentSlots / $maxSlots'),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: currentSlots < maxSlots
              ? () => onChanged(currentSlots + 1)
              : null,
        ),
      ],
    );
  }
}
