import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_union/features/auth/auth_screen.dart';

import 'package:test_app_union/features/auth/src/bloc/auth_bloc.dart';
import 'package:test_app_union/features/home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    context.read<AuthBloc>().add(IsAuthorizedEvent());
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is IsAuthorizedState) {
          state.isAuthorized
              ? Navigator.of(context).pushAndRemoveUntil(
                  CupertinoPageRoute(builder: (context) => const HomeScreen()),
                  (route) => false,
                )
              : Navigator.of(context).pushAndRemoveUntil(
                  CupertinoPageRoute(builder: (context) => const AuthScreen()),
                  (route) => false,
                );
        }
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}
