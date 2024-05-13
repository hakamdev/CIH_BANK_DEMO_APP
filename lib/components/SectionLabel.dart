import 'package:flutter/material.dart';

class SectionLabel extends StatelessWidget {
  const SectionLabel({
    super.key,
    required this.label,
    this.info,
    this.buttonLabel,
    this.onPressed,
  });

  final String label;
  final String? info;
  final String? buttonLabel;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text.rich(
            TextSpan(
              style: const TextStyle(fontSize: 15),
              children: [
                TextSpan(
                  text: label,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                if (info != null)
                  const TextSpan(
                    text: ": ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                if (info != null)
                  TextSpan(
                    text: info,
                  ),
              ],
            ),
          ),
        ),
        if (buttonLabel != null)
          TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              backgroundColor: Colors.deepOrange.withAlpha(30),
              foregroundColor: Colors.deepOrange,
              visualDensity: VisualDensity.compact,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: EdgeInsets.zero,
            ),
            child: Text(
              buttonLabel!,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }
}
