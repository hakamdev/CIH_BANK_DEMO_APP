import 'package:cih_bank_app_demo/Utils/constants.dart';
import 'package:flutter/material.dart';

class TransactionHistoryItem extends StatelessWidget {
  const TransactionHistoryItem({
    super.key,
    required this.label,
    required this.value,
    required this.transactionType,
    required this.currency,
    this.onPressed,
  });

  final String label;
  final int value;
  final String transactionType;
  final String currency;
  final VoidCallback? onPressed;

  String getInitialsFromLabel(String label) {
    final parts = label.split(" ");
    String iconLabel = "";
    for (final part in parts) {
      iconLabel += part[0];
    }
    return iconLabel;
  }

  Widget getIcon(BuildContext context) {
    final icon = transactionTypes[transactionType];
    if (icon != null) {
      return Icon(
        icon,
        color: Colors.black87,
      );
    } else {
      return Text(
        getInitialsFromLabel(label),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: 100,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            //color: Colors.white,
            border: Border.all(
              color: Colors.grey.shade300,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                "$value $currency",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: value > 0 ? Colors.green : Colors.red.shade800,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: 42,
                height: 42,
                clipBehavior: Clip.antiAlias,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  shape: BoxShape.circle,
                ),
                child: getIcon(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
