import 'package:eshop_a/core/config/app_padding.dart';
import 'package:eshop_a/core/di/di_container.dart';
import 'package:eshop_a/core/extensions/context_extension.dart';
import 'package:eshop_a/core/utilities/app_validator.dart';
import 'package:eshop_a/core/widgets/button_widget.dart';
import 'package:eshop_a/features/auth/domain/usecases/login_usecase.dart';
import 'package:eshop_a/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _userNameController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _userNameController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: Scaffold(
        appBar: AppBar(),
        body: Form(
          child: ListView(
            padding: AppPadding.pagePadding,
            children: [
              Gap(20),
              TextFormField(
                controller: _userNameController,
                validator: AppValidator.required,
              ),
              Gap(20),
              TextFormField(
                controller: _passwordController,
                validator: AppValidator.required,
              ),
              Gap(20),
              Builder(
                builder: (context) => ButtonWidget(
                  onPressed: () {
                    if (Form.of(context).validate()) {
                      context.read<AuthCubit>().login(LoginParams(
                            userName: _userNameController.text,
                            password: _passwordController.text,
                          ));
                    }
                  },
                  width: context.width,
                  text: 'login',
                ),
              ),
              Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
