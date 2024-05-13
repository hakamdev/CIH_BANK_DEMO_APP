import 'package:flutter/material.dart';

class BottomNavBarItem {
  final Widget item;
  final Widget? selectedItem;

  BottomNavBarItem({
    required this.item,
    this.selectedItem,
  });
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.index,
    required this.items,
    this.onSelected,
    this.onSendMoneyPressed,
    this.selectedItemColor,
    this.itemColor,
  });

  final int index;
  final List<BottomNavBarItem> items;
  final void Function(int)? onSelected;
  final VoidCallback? onSendMoneyPressed;

  final Color? selectedItemColor;
  final Color? itemColor;

  @override
  Widget build(BuildContext context) {
    final mSelectedItemColor = selectedItemColor ?? Colors.grey.shade900;
    final mItemColor = itemColor ?? Colors.grey.shade500;

    return Container(
      height: 90,
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      padding: const EdgeInsets.all(12),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(45),
      ),
      child: Row(
        children: [
          Material(
            color: Colors.deepOrange,
            borderRadius: BorderRadius.circular(45),
            child: InkWell(
              onTap: onSendMoneyPressed,
              splashColor: Colors.white.withAlpha(100),
              borderRadius: BorderRadius.circular(45),
              child: Container(
                height: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  //color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(45),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Send Money",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.north_east_rounded,
                      color: Colors.white,
                      size: 24,
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (int i = 0; i < items.length; i++)
                  IconButton(
                    onPressed: () => onSelected?.call(i),
                    iconSize: 26,
                    color: index == i ? mSelectedItemColor : mItemColor,
                    icon: index == i && items[i].selectedItem != null
                        ? items[i].selectedItem!
                        : items[i].item,
                  ),
                // IconButton(
                //   onPressed: () {},
                //   icon: const Icon(
                //     Icons.notifications_rounded,
                //     size: 26,
                //   ),
                // ),
                // IconButton(
                //   onPressed: () {},
                //   icon: const Icon(
                //     Icons.settings_rounded,
                //     size: 26,
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
