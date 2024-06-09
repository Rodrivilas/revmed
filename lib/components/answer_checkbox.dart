import 'package:flutter/material.dart';

class AnswerCheckbox extends StatefulWidget {
  const AnswerCheckbox({super.key, required this.title});
  final String title;

  @override
  State<AnswerCheckbox> createState() => _AnswerCheckboxState();
}

class _AnswerCheckboxState extends State<AnswerCheckbox> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      shape: selected
          ? RoundedRectangleBorder(
              side:
                  BorderSide(color: Theme.of(context).primaryColor, width: 1.5),
              borderRadius: BorderRadius.circular(5.0))
          : RoundedRectangleBorder(
              side: BorderSide(
                  color: Theme.of(context).unselectedWidgetColor, width: 0.5),
              borderRadius: BorderRadius.circular(5.0)),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Checkbox(
                checkColor: Theme.of(context).canvasColor,
                value: selected,
                shape: const CircleBorder(),
                onChanged: (value) {
                  setState(() {
                    selected = !selected;
                  });
                }),
            Expanded(child: Text(widget.title)),
          ],
        ),
      ),
    );
  }
}
