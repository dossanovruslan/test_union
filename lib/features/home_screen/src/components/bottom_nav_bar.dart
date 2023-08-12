import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app_union/features/home_screen/src/home_view_model.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomScreenViewModel>(
      builder: (_, homeScreenVM, __) {
        return BottomNavigationBar(
          unselectedFontSize: 10,
          selectedFontSize: 10,
          type: BottomNavigationBarType.fixed,
          onTap: homeScreenVM.onTap,
          currentIndex: homeScreenVM.currentIndex,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              label: 'Лента',
              icon: Icon(Icons.account_circle_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Карта',
              icon: Icon(Icons.account_circle_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Избранные',
              icon: Icon(Icons.favorite_outline_rounded),
            ),
            BottomNavigationBarItem(
              label: 'Профиль',
              icon: Icon(Icons.account_circle_outlined),
            ),
          ],
        );
      },
    );
  }
}
