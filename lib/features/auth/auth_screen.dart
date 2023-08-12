import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:test_app_union/data/models/auth_request.dart';
import 'package:test_app_union/features/auth/src/auth_view_model.dart';
import 'package:test_app_union/features/auth/src/bloc/auth_bloc.dart';
import 'package:test_app_union/features/auth/src/components/big_button.dart';
import 'package:test_app_union/features/auth/src/components/text_field_widget.dart';
import 'package:test_app_union/features/home_screen/home_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthViewModel(),
      builder: (context, child) {
        final authVM = context.read<AuthViewModel>();
        return BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is SuccessAuthState) {
              Navigator.of(context).pushAndRemoveUntil(
                CupertinoPageRoute(builder: (context) => const HomeScreen()),
                (route) => false,
              );
            }
            if (state is ErrorAuthState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Авторизация'),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.sizeOf(context).height / 5),
                    TextFieldWidget(
                      hintText: 'Логин или почта',
                      controller: authVM.emailController,
                    ),
                    const Divider(),
                    TextFieldWidget(
                      controller: authVM.passwordController,
                      hintText: 'Пароль',
                    ),
                    const SizedBox(height: 32),
                    BigButton(
                      label: 'Войти',
                      onTap: () {
                        context.read<AuthBloc>().add(
                              AuthBlocEvent(
                                authRequest: AuthRequest(
                                  email: authVM.emailController.text,
                                  password: authVM.passwordController.text,
                                ),
                              ),
                            );
                      },
                    ),
                    const SizedBox(height: 20),
                    BigButton(
                      onTap: () {},
                      label: 'Зарегистрироваться',
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
