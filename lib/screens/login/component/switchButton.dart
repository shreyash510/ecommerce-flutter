import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget {
  const SwitchButton({super.key});

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.0),
      child: SizedBox(
          width: 40,
          height: 30,
          child: FittedBox(
            child: Switch(
              // This bool value toggles the switch.
              value: light,
              activeColor: Theme.of(context).colorScheme.primary,
              onChanged: (bool value) {
                // This is called when the user toggles the switch.
                print(value);
                setState(() {
                  light = value;
                });
              },
            ),
          )),
    );
  }
}
