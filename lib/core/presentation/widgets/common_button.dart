import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const CommonButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(const Color(0xfffe5000)),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}
