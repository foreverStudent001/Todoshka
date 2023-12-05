import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
  final Function()? onTap;
  final String? label;
  final IconData? icon;

  const SimpleButton({super.key, required this.onTap, this.label, this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label ?? 'Sign In',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            if (icon != null) SizedBox(width: 20),
            if (icon != null) Icon(icon, color: Colors.white),
          ],
        ),
      ),
    );
  }
}