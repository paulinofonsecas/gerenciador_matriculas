import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class ButtonPanelWidget extends StatelessWidget {
  const ButtonPanelWidget({
    super.key,
    required this.title,
    required this.icon,
    this.color,
    this.onTap,
  });

  final String title;
  final IconData icon;
  final Color? color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: (color ?? Colors.green).withValues(alpha: .25),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 25),
              GutterTiny(),
              Text(title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
