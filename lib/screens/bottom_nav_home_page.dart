import 'package:curalog/config/theme/theme.dart';
import 'package:curalog/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class ScreenWithBottomNav extends StatefulWidget {
  const ScreenWithBottomNav({super.key});

  @override
  State<ScreenWithBottomNav> createState() => _ScreenWithBottomNavState();
}

class _ScreenWithBottomNavState extends State<ScreenWithBottomNav> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: BottomNavBar());
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> buildScreens() {
      return [
        const HomePage(),
        const Center(child: Text('Second Page')),
        const Center(child: Text('Third Page')),
      ];
    }

    List<PersistentBottomNavBarItem> navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home_outlined),
          title: ("Home"),
          activeColorPrimary: colors(context).highlight.s500,
          inactiveColorPrimary: colors(context).onSurface.s500,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.search),
          title: ("Curalog's AI"),
          activeColorPrimary: colors(context).highlight.s500,
          inactiveColorPrimary: colors(context).onSurface.s500,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.person_outline),
          title: ("Profile"),
          activeColorPrimary: colors(context).highlight.s500,
          inactiveColorPrimary: colors(context).onSurface.s500,
        ),
      ];
    }

    PersistentTabController controller;

    controller = PersistentTabController(initialIndex: 0);

    return PersistentTabView(
      context,
      controller: controller,
      screens: buildScreens(),
      items: navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: colors(context).onSurface.s100,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style6,
    );
  }
}
