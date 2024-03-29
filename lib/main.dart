import 'package:curalog/components/adaptive_page_scaffold.dart';
import 'package:curalog/config/theme/placebo_colors.dart';
import 'package:curalog/config/theme/placebo_typography.dart';
import 'package:curalog/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Curalog',
      debugShowCheckedModeBanner: false,
      theme: themeData.copyWith(
        extensions: <ThemeExtension<dynamic>>[PlaceboColors.light, textTheme],
        // Override default Text('') styling to placebo body
        textTheme:
            Theme.of(context).textTheme.copyWith(bodyMedium: textTheme.body),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const AdaptivePageScaffold(
        title: Text('Curalog'), body: BottomNavBar());
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> buildScreens() {
      return [
        // TODO : Replace with the actual widgets for your pages
        const Center(child: Text('Home Page')),
        const Center(child: Text('Second Page')),
        const Center(child: Text('Third Page')),

        // HomeScreen(),
        // SecondScreen(),
        // ThirdScreen(),
      ];
    }

    List<PersistentBottomNavBarItem> navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          title: ("Home"),
          activeColorPrimary: colors(context).highlight.s500,
          inactiveColorPrimary: colors(context).onSurface.s500,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.settings),
          title: ("Settings"),
          activeColorPrimary: colors(context).highlight.s500,
          inactiveColorPrimary: colors(context).onSurface.s500,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.person),
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
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle
          .style1, // Choose the nav bar style with this property. ----------------------------------------------------------------
      //there are many style given in the documentation https://pub.dev/packages/persistent_bottom_nav_bar change the .style1 according to your needs
      //for example style15, style16 etc.
    );
  }
}
