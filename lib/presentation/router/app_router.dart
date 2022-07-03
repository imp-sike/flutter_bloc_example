import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/logic/cubit/main_cubit.dart';
import 'package:flutter_bloc_example/presentation/screens/home_screen.dart';
import 'package:flutter_bloc_example/presentation/screens/second_screen.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();
  Route? onGeneratedRoute(RouteSettings routeSettings) {
    switch(routeSettings.name) {
      case "/":
          return MaterialPageRoute(builder: (_) => 
            BlocProvider.value(value: _counterCubit, child: const HomeScreen(),)
          );
      case "/second":
          return MaterialPageRoute(builder: (_) => 
            BlocProvider.value(value: _counterCubit, child: const SecondScreen(),)
          );
      default:
          return null;
    }
  }

  void destroy() {
    _counterCubit.close();
  }

}