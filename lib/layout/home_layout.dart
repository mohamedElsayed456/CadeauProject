import 'package:demo_project/providers/occasions_provider.dart';
import 'package:demo_project/bottomnavigationscreens/account.dart';
import 'package:demo_project/bottomnavigationscreens/discount.dart';
import 'package:demo_project/bottomnavigationscreens/home.dart';
import 'package:demo_project/bottomnavigationscreens/occasion.dart';
import 'package:demo_project/bottomnavigationscreens/shopping.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
 
// ignore: must_be_immutable
class HomeLayoutScreen extends StatelessWidget {
   HomeLayoutScreen({super.key});

  List<String>titles=[
    'Home',
    'Occasions',
    'Discount',
    'Shopping',
    'Account',
  ];
  List<Widget>bottomscreens=[
    const Home(),
    Occasion(model: [],),
    Discount(),
    Shopping(),
    Account(),
  ];
  
  List<PersistentBottomNavBarItem>navBarItems(){
    return [
      PersistentBottomNavBarItem(
        icon:const Icon(Icons.home),
        title: 'Home',
        activeColorPrimary: Colors.orange,
        inactiveColorPrimary: Colors.black,
        ),
        PersistentBottomNavBarItem(
        icon:const Icon(Icons.card_giftcard_outlined),
        title: 'occasion',
        activeColorPrimary: Colors.orange,
        inactiveColorPrimary: Colors.black,
        ),
        PersistentBottomNavBarItem(
        icon:const Icon(Icons.discount_outlined),
        title: 'top Deals',
        activeColorPrimary: Colors.orange,
        inactiveColorPrimary: Colors.black,
        ),
        PersistentBottomNavBarItem(
        icon:const Icon(Icons.shopping_cart_outlined),
        title: 'Cart',
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
          // appBar: AppBar(
      
          //     style:TextStyle(fontSize:22,fontWeight: FontWeight.bold),
          //   ),
            // actions:const[
            //   Padding(
            //     padding: EdgeInsets.all(10.0),
            //     child: Icon(Icons.notifications_none),
            //   ),
            //  ],
            // ),
            body:PersistentTabView(
              context,
              screens: bottomscreens,
              items: navBarItems(),
              navBarStyle: NavBarStyle.style6,
          ),
       ),
    );
  }
}