import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final String variant;
  final bool disabled;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.variant = 'primary',
    this.disabled = false,
  }) : super(key: key);
  Color _getBackgroundColor(BuildContext context) {
    if (disabled) return Colors.grey;
    switch (variant) {
      case 'secondary':
        return Colors.grey[300]!;
      case 'primary':
      default:
        return Theme.of(context).primaryColor;
    }
  }

  Color _getTextColor(BuildContext context) {
    if (disabled) return Colors.black45;
    switch (variant) {
      case 'secondary':
        return Colors.black;
      case 'primary':
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: disabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: _getBackgroundColor(context),
          foregroundColor: _getTextColor(context),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          minimumSize: const Size(0, 50),
        ),
        child: Text(text),
      ),
    );
  }
}
