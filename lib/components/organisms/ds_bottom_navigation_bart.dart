import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class DsBottomNavigation extends StatelessWidget {

  final int currentIndex;
  final void Function()? onPressed;

  const DsBottomNavigation({
    super.key, 
    required this.currentIndex,
    this.onPressed 
  });

  void onItemTapped( BuildContext context, int index ) {
    // context.go('');
    switch(index) {
      case 0:
        context.go('/home/0');
        break;
      
      case 1:
        context.go('/home/1');
        break;

      case 2:
        context.go('/home/2');
        break;

      case 3:
        context.go('/home/3');
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: (value) => onItemTapped(context, value),
      elevation: 0,
      destinations: const [
        NavigationDestination(
          icon: Icon( Icons.home_max ),
          label: 'Home'
        ),
        NavigationDestination(
          icon: Icon( Icons.search_rounded ),
          label: 'Search'
        ),
        NavigationDestination(
          icon: Icon( Icons.card_travel_rounded ),
          label: 'Buy'
        ),
        NavigationDestination(
          icon: Icon( Icons.person ),
          label: 'Profile'
        ),
      ]
    );
  }
}