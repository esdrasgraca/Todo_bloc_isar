import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_isar/app/modules/splash/cubit/splash_cubit.dart';

class SplashPage extends StatefulWidget {
  final SplashCubit controller;
  const SplashPage({super.key, required this.controller});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashLoaded) {
          Navigator.of(context).pushReplacementNamed('/home');
        }
      },
      builder: (context, state) {
        return switch (state) {
          SplashInitial() => const SizedBox(),
          SplashLoading() => const Center(child: CircularProgressIndicator.adaptive()),
          SplashLoaded() => const SizedBox(),
          SplashError() => Center(
            child: Container(
                color: Colors.red,
                width: double.infinity,
                height: double.infinity,
                child: Text(state.error ?? ''),
              ),
          ),
        };
      },
    ));
  }
}
