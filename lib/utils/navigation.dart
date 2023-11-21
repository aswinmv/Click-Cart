import 'package:apiexample/screens/cartpage.dart';
import 'package:apiexample/screens/wishlist.dart';
import 'package:apiexample/screens/profile.dart';
import 'package:apiexample/screens/storee.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class Navigationpage extends StatefulWidget {
  const Navigationpage({super.key, r});

  @override
  State<Navigationpage> createState() => _NavigationpageState();
}

class _NavigationpageState extends State<Navigationpage> {
  PersistentTabController controller = PersistentTabController(initialIndex: 0);
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller,
      confineInSafeArea: true,
      navBarStyle: NavBarStyle.style12,
      backgroundColor: const Color.fromARGB(255, 233, 205, 120),
      screens: const [Store(), WishList(), Profile(), Cart()],
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.black,
      ),
      items: [
        PersistentBottomNavBarItem(
          activeColorPrimary: Colors.black,
          inactiveColorPrimary: Colors.white,
          icon: const Icon(
            Icons.home,
          ),
        ),
        PersistentBottomNavBarItem(
            activeColorPrimary: Colors.black,
            inactiveColorPrimary: Colors.white,
            icon: const Icon(Ionicons.heart)),
        PersistentBottomNavBarItem(
            activeColorPrimary: Colors.black,
            inactiveColorPrimary: Colors.white,
            icon: const Icon(Icons.person_2_rounded)),
        PersistentBottomNavBarItem(
            inactiveColorPrimary: Colors.white,
            activeColorPrimary: Colors.black,
            icon: const Icon(Ionicons.cart))
      ],
    );
  }
}
