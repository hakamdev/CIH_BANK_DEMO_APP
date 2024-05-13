import 'package:flutter/material.dart';

class QuickActionButtonPlaceholder extends StatelessWidget {
  const QuickActionButtonPlaceholder({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(16),
      color: Colors.grey.shade200,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            // border: Border.all(
            //   color: Colors.grey.shade300,
            //   width: 1,
            // ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.add_rounded,
                  color: Colors.black87,
                  size: 24,
                ),
              ),
              // const SizedBox(width: 16),
              // Flexible(
              //   child: Text(
              //     "New",
              //     maxLines: 2,
              //     overflow: TextOverflow.ellipsis,
              //     style: const TextStyle(
              //       fontSize: 14,
              //       color: Colors.black87,
              //       fontWeight: FontWeight.w500,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
