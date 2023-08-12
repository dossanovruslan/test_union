import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:test_app_union/features/auth/auth_screen.dart';
import 'package:test_app_union/features/auth/src/bloc/auth_bloc.dart';
import 'package:test_app_union/features/auth/src/components/big_button.dart';
import 'package:test_app_union/features/frofile/src/profile_view_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LogOutState) {
          Navigator.of(context).pushAndRemoveUntil(
              CupertinoPageRoute(builder: (context) => const AuthScreen()),
              (route) => false);
        }
      },
      child: ChangeNotifierProvider(
        create: (context) => ProfileViewModel()..init(),
        child: Scaffold(
          appBar: AppBar(title: const Text('Профиль')),
          body: Consumer<ProfileViewModel>(builder: (_, profileVM, __) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                const Icon(
                  Icons.account_circle_outlined,
                  size: 84,
                ),
                const SizedBox(height: 16),
                Text(
                  profileVM.user.nickname,
                ),
                const SizedBox(height: 12),
                Text(
                  profileVM.user.email,
                ),
                const SizedBox(height: 24),
                BigButton(
                  onTap: () {
                    context.read<AuthBloc>().add(LogOutEvent());
                  },
                  label: 'Выйти',
                  isActive: false,
                  labelColor: Colors.red,
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
