import 'package:flutter/material.dart';
import 'stone.dart';
class SizeWidget extends StatefulWidget {
  final Stone stone;
  final Function(String) updateSize;

  const SizeWidget({required this.stone, required this.updateSize, Key? key}) : super(key: key);

  @override
  State<SizeWidget> createState() => _SizeWidgetState();
}

class _SizeWidgetState extends State<SizeWidget> {
  String _selectedSize = "";

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.stone.sizes.keys.map((size) {
        return Row(
          children: [
            Radio<String>(
              value: size,
              groupValue: widget.stone.selectedSize,
              onChanged: (val) {
                setState(() {
                  _selectedSize = val!;
                  widget.stone.selectedSize = _selectedSize;
                  widget.updateSize(_selectedSize);
                });
              },
            ),
            Text("$size — ${widget.stone.sizes[size]} \$"),
          ],
        );
      }).toList(),
    );
  }
}
