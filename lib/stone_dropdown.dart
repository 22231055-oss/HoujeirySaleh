import 'package:flutter/material.dart';
import 'stone.dart';

class StoneDropdown extends StatefulWidget {
  final Function(Stone) updateStone;

  const StoneDropdown({required this.updateStone, super.key});

  @override
  State<StoneDropdown> createState() => _StoneDropdownState();
}

class _StoneDropdownState extends State<StoneDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      width: 250,
      initialSelection: stones[0],
      onSelected: (stone) {
        setState(() {
          widget.updateStone(stone as Stone);
        });
      },
      dropdownMenuEntries: stones.map((stone) {
        return DropdownMenuEntry(
          value: stone,
          label: stone.toString(),
        );
      }).toList(),
    );
  }
}
