import 'package:cih_bank_app_demo/Utils/utils.dart';
import 'package:flutter/material.dart';

class AccountDetailsCard extends StatelessWidget {
  const AccountDetailsCard({
    super.key,
    required this.accountNumber,
    required this.balance,
    required this.isInfoHidden,
    this.onVisibilityToggle,
  });

  final String accountNumber;
  final double balance;
  final bool isInfoHidden;
  final VoidCallback? onVisibilityToggle;

  String getAccountNumber() {
    if (!isInfoHidden) return accountNumber;
    final parts = accountNumber.split(" ");
    return "**** **** **** ${parts.last}";
  }

  String getBalance() {
    if (!isInfoHidden) return formatMoney(balance);
    return "*********";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Checking account",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    getAccountNumber(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 8),
                  Image.asset(
                    "assets/master_card_logo.png",
                    height: 22,
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 16),
          Divider(
            color: Colors.grey.shade300,
            height: 0,
            thickness: 1,
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Balance",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    getBalance(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: onVisibilityToggle,
                    style: IconButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                    ),
                    icon: Icon(isInfoHidden
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
