import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ecommerce/common/secureStorage.dart';

class SwitchButton extends StatefulWidget {
  const SwitchButton({Key? key}) : super(key: key);

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  SecureStorageHelper storage = SecureStorageHelper();
// Read an item by key
// String? itemValue = await storage.readItem('key_to_read');

// print(itemValue);

  bool flag = true;

  Future<void> _setThemeState(bool isDark) async {
    // print('isDark: $isDark'); // Print the value of isDark
    await storage.addItem("isDark", isDark);
    // print(await storage.readItem("isDark"));
  }

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
              value: flag,
              activeColor: Theme.of(context).colorScheme.primary,
              onChanged: (bool value) {
                // This is called when the user toggles the switch.
                setState(() {
                  flag = value; // Update the switch state
                });
                _setThemeState(value); // Set the theme state in secure storage
              },
            ),
          )),
    );
  }
}
