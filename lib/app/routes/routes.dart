
import 'package:flutter/material.dart';
import 'package:todo_bloc_isar/app/modules/splash/splash_route.dart';

sealed class Routes {

  static Route<dynamic> routes (RouteSettings settings){

    WidgetBuilder builder;
    switch (settings.name) {

      case '/' :
      builder = SplashRoute().page;
      break;

      default:
      throw Exception('Rota Não Encontrada');
    }

  
    return MaterialPageRoute(builder: builder, settings: settings);

  }
  
}