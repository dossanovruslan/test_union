import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final bool isActive;
  final Color? labelColor;
  const BigButton({
    super.key,
    required this.onTap,
    required this.label,
    this.isActive = true,
    this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          height: 64,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: isActive ? Theme.of(context).primaryColor : Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(6))),
          child: Center(
              child: Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.white : labelColor,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          )),
        ));
  }
}
