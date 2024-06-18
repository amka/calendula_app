import 'package:flutter/material.dart';

import '../app_config.dart';

class Entry extends StatelessWidget {
  const Entry({
    super.key,
    required this.controller,
    this.labelText,
    this.hintText,
    this.inputFormat,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.disabled = false,
    this.autofocus = false,
  });

  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final String? inputFormat;
  final bool obscureText;
  final TextInputType keyboardType;
  final bool disabled;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 48,
      child: TextField(
        controller: controller,
        readOnly: disabled,
        obscureText: obscureText,
        keyboardType: keyboardType,
        autofocus: autofocus,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConfig.borderRadius),
          ),
          labelText: labelText,
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConfig.borderRadius),
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ),
    );
  }
}
