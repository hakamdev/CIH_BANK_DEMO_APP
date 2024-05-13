import 'package:cih_bank_app_demo/components/AccountDetailsCard.dart';
import 'package:cih_bank_app_demo/components/QuickActionButton.dart';
import 'package:cih_bank_app_demo/components/QuickActionButtonPlaceholder.dart';
import 'package:cih_bank_app_demo/components/SectionLabel.dart';
import 'package:cih_bank_app_demo/components/TransactionHistoryItem.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isAccountDetailsHidden = true;

  List<Map<String, dynamic>> quickActions = [
    {"label": "Top Up", "icon": Icons.mobile_friendly},
    {"label": "Mortgage Payment", "icon": Icons.house_rounded},
    {"label": "Vignette", "icon": Icons.car_crash_outlined},
    {"label": "Pay Bills", "icon": Icons.receipt_rounded},
  ];

  List<Map<String, dynamic>> transactions = [
    {"label": "Recharge", "type": "topup", "value": -43},
    {"label": "Ahmad Hassan", "type": "send", "value": -400},
    {"label": "Imad Chkamba", "type": "receive", "value": 200},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: getBody(context),
    );
  }

  Widget getBody(BuildContext context) {
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
          sliver: SliverToBoxAdapter(
            child: // TODO: LABEL
                SectionLabel(
              label: "Recent Transactions",
              info: "02/27/23",
              buttonLabel: "more",
              onPressed: () {},
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(bottom: 24),
          sliver: SliverToBoxAdapter(
            child: SizedBox(
              height: 120,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return TransactionHistoryItem(
                    label: transactions[index % 3]["label"],
                    value: transactions[index % 3]["value"],
                    transactionType: transactions[index % 3]["type"],
                    currency: "DH",
                    onPressed: () {},
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemCount: transactions.length * 2,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
          sliver: SliverToBoxAdapter(
            child: AccountDetailsCard(
              accountNumber: "2204 4554 6068 6655",
              balance: 42345.00,
              isInfoHidden: isAccountDetailsHidden,
              onVisibilityToggle: () {
                setState(
                    () => isAccountDetailsHidden = !isAccountDetailsHidden);
              },
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverGrid(
            delegate: SliverChildListDelegate.fixed(
              [
                for (int i = 0; i < 4; i++)
                  if (i < quickActions.length)
                    QuickActionButton(
                      label: quickActions[i]["label"],
                      icon: quickActions[i]["icon"],
                      onPressed: () {},
                    )
                  else
                    QuickActionButtonPlaceholder(
                      onPressed: () {},
                    ),
              ],
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.8,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
          ),
        )
      ],
    );
  }
}
