import 'dart:async';
import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/constants/enums.dart';
import 'package:flutter_bloc_example/logic/internet_cubit/internet_cubit_cubit.dart';

class CounterState extends Equatable {
  int countervalue;
  
  CounterState({
    required this.countervalue,
  });
  
  @override
  List<Object?> get props => [countervalue];
}

class CounterCubit extends Cubit<CounterState> {
  InternetCubitCubit internetCubitCubit;
  late StreamSubscription streamSubscription;

  CounterCubit({required this.internetCubitCubit}) : super(CounterState(countervalue: 0)) {
    streamSubscription =  internetCubitCubit.stream.listen((event) {
      if(event is InternetDissconnected) {
        decrement();
      }
      if(event is InternetConnected && event.connectionType == ConnectionType.wifi) {
        increment();
      }

      if(event is InternetConnected && event.connectionType == ConnectionType.mobile) {
        increment();
        increment();
        increment();
        increment();
        increment();
      }
    });
  }

  void increment() => emit(CounterState(countervalue: state.countervalue + 1));
  void decrement() => emit(CounterState(countervalue: state.countervalue - 1));
}
