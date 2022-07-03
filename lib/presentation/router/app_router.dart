import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/logic/cubit/main_cubit.dart';
import 'package:flutter_bloc_example/logic/internet_cubit/internet_cubit_cubit.dart';
import 'package:flutter_bloc_example/presentation/screens/home_screen.dart';

class AppRouter {
  final InternetCubitCubit _internetCubitCubit = InternetCubitCubit();
    late final CounterCubit _counterCubit;
  Route? onGeneratedRoute(RouteSettings routeSettings) {
  
    _counterCubit =  CounterCubit(internetCubitCubit: _internetCubitCubit);
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: const HomeScreen(),
                ));
      // case "/second":
      //     return MaterialPageRoute(builder: (_) =>
      //       BlocProvider.value(value: _counterCubit, child: const SecondScreen(),)
      //     );
      default:
        return null;
    }
  }

  void destroy() {
    _internetCubitCubit.close();
    _counterCubit.close();
  }
}
