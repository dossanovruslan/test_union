import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app_union/features/frofile/profile_screen.dart';
import 'package:test_app_union/features/home_screen/src/components/bottom_nav_bar.dart';
import 'package:test_app_union/features/home_screen/src/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomScreenViewModel(),
      builder: (context, child) {
        return const Scaffold(
          body: ProfileScreen(),
          bottomNavigationBar: BottomNavBar(),
        );
      },
    );
  }
}
