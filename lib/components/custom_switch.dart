import 'package:flutter/material.dart';
import 'package:revmed/components/constants.dart';

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
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(widget.text, textAlign: TextAlign.center),
        ),
        Expanded(
          child: Switch(
            // This bool value toggles the switch.
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
    );
  }
}
