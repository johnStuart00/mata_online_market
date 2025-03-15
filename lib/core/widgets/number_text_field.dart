import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberInputField extends StatelessWidget {
  const NumberInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number, // Show number keyboard
      maxLength: 3, // Limit to 3 characters
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly, // Allow only numbers
        LengthLimitingTextInputFormatter(3), // Max length: 3
      ],
      decoration: const InputDecoration(
        labelText: "Enter a Number (Max: 3 digits)",
        border: OutlineInputBorder(),
        counterText: "", // Hides default counter text
      ),
    );
  }
}
