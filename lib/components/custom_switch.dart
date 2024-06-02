import 'package:flutter/material.dart';
import 'package:revmed/theme/color_scheme.dart';

class CustomSwitch extends StatefulWidget {
  final String text;
  const CustomSwitch({super.key, required this.text});
  @override
  State<CustomSwitch> createState() => _CustomSwitch();
}

class _CustomSwitch extends State<CustomSwitch> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              widget.text,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 13),
              child: Switch(
                value: light,
                activeColor: primary,
                onChanged: (bool value) {
                  // This is called when the user toggles the switch.
                  setState(() {
                    light = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
