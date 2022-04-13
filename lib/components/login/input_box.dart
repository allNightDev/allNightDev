import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  const InputBox({
    Key? key,
    this.label = "",
    required this.onChange,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.value = "",
  }) : super(key: key);

  final String label;
  final String value;
  final Function(String) onChange;
  final bool obscureText;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      padding: EdgeInsets.symmetric(horizontal: 18.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: Theme.of(context).dividerColor),
      ),
      child: Center(
        child: TextFormField(
          initialValue: value,
          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: label,
            contentPadding: EdgeInsets.all(0),
          ),
          onChanged: onChange,
        ),
      ),
    );
  }
}
