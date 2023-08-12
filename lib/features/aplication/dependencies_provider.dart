import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:test_app_union/data/server/auth_repo.dart';

class DependenciesProvider extends StatelessWidget {
  final Widget child;
  const DependenciesProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        RepositoryProvider(
          lazy: false,
          create: (context) => AuthRepo()..init(),
        )
      ],
      child: child,
    );
  }
}
