import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterState extends Equatable {
  int countervalue;
  
  CounterState({
    required this.countervalue,
  });
  
  @override
  List<Object?> get props => [countervalue];
}

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(countervalue: 0));

  void increment() => emit(CounterState(countervalue: state.countervalue + 1));
  void decrement() => emit(CounterState(countervalue: state.countervalue - 1));
}
