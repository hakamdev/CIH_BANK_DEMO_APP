import 'package:cih_bank_app_demo/components/BottomNavBar.dart';
import 'package:cih_bank_app_demo/screens/HomeScreen.dart';
import 'package:cih_bank_app_demo/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  final screens = [];

  Widget getHomeScreen(BuildContext context) {
    return const HomeScreen();
  }

  Widget getNotificationsScreen(BuildContext context) {
    return Container();
  }

  Widget getSettingsScreen(BuildContext context) {
    return Container();
  }

  Future<T?> showProfileSheet<T>(BuildContext context) async {
    return showModalBottomSheet<T>(
      context: context,
      builder: (context) => Container(
        height: 2000,
        width: double.infinity,
        color: Colors.white,
      ),
    );
  }

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    screens.add(getHomeScreen);
    screens.add(getNotificationsScreen);
    screens.add(getSettingsScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: getAppBar(context),
      drawer: getDrawer(context),
      body: screens[currentIndex](context),
      bottomNavigationBar: BottomNavBar(
        index: currentIndex,
        onSelected: (index) {
          setState(() => currentIndex = index);
        },
        onSendMoneyPressed: () {
          // TODO:
        },
        selectedItemColor: HakamTheme.secondaryColor,
        items: [
          BottomNavBarItem(
            item: const Icon(Icons.credit_card),
          ),
          BottomNavBarItem(
            item: const Icon(Icons.notifications_rounded),
          ),
          BottomNavBarItem(
            item: const Icon(Icons.settings_rounded),
          ),
        ],
      ),
    );
  }

  AppBar getAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Image.asset(
        "assets/cih_logo.png",
        height: 46,
      ),
      centerTitle: true,
      toolbarHeight: 84,
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(
            Icons.menu_rounded,
            size: 32,
          ),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () => showProfileSheet(context),
          child: const Badge(
            alignment: Alignment.topRight,
            label: Text("10"),
            isLabelVisible: false,
            backgroundColor: Colors.deepOrange,
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/ehakam_pic.jpg"),
            ),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  Widget getDrawer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .7,
      color: Colors.white,
    );
  }
}
