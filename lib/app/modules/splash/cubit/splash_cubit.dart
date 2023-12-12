


import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial()){
    _loading();
  }

  Future<void> _loading() async{
    log("Inicio");
    emit(SplashLoading());
    await Future.delayed(const Duration(seconds: 4));


    emit(SplashLoaded());
    log("Fim");
  }
}
