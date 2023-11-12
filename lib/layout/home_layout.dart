import 'package:demo_project/providers/occasions_provider.dart';
import 'package:demo_project/screens/account_screen.dart';
import 'package:demo_project/screens/occasion_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
 
// ignore: must_be_immutable
class HomeLayoutScreen extends StatelessWidget {
   HomeLayoutScreen({super.key});

  List<Widget>bottomscreens=[
      const OccasionScreen(),
      const AccountScreen(),
  ];
  
  List<PersistentBottomNavBarItem>navBarItems(){
    return [
        PersistentBottomNavBarItem(
        icon:const Icon(Icons.card_giftcard_outlined),
        title: 'occasion',
        activeColorPrimary: Colors.orange,
        inactiveColorPrimary: Colors.black,
        ),
        PersistentBottomNavBarItem(
        icon:const Icon(Icons.account_box_outlined),
        title: 'Account',
        activeColorPrimary: Colors.orange,
        inactiveColorPrimary: Colors.black,
        ),
    ];
  }

  @override
  Widget build(BuildContext context){
    return  Selector<OccasionsProvider,int>(
      selector:(ctx,provider) => provider.currentIndex,
      builder: (context,currentIndex, child) => Scaffold(
            body:PersistentTabView(
              context,
              screens: bottomscreens,
              items: navBarItems(),
              navBarStyle:NavBarStyle.style6,
          ),
       ),
    );
  }
}