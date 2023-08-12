import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_union/data/server/auth_repo.dart';
import 'package:test_app_union/features/aplication/dependencies_provider.dart';
import 'package:test_app_union/features/aplication/preferences_utils.dart';
import 'package:test_app_union/features/auth/src/bloc/auth_bloc.dart';
import 'package:test_app_union/features/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.init();

  runApp(
    DependenciesProvider(
      child: BlocProvider(
        create: (context) => AuthBloc(context.read<AuthRepo>()),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const SplashScreen(),
    );
  }
}
