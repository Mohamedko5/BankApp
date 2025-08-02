import 'package:bankapp/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: getTabs(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            pageIndex = 4;
          });
        },
        child: Icon(AntDesign.creditcard, size: 25),
      ),
    );
  }

  Widget getTabs() {
    List<IconData> iconItems = [
      Icons.home,
      Icons.comment_bank,
      Icons.account_balance_wallet,
      Icons.account_circle,
    ];
    return AnimatedBottomNavigationBar(
      icons: iconItems,
      activeColor: primary,
      splashColor: secondary,
      inactiveColor: black.withOpacity(0.5),
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 10,
      rightCornerRadius: 10,
      activeIndex: pageIndex,
      onTap: (index) {
        setState(() {
          pageIndex = index;
        });
      },
    );
  }
}
