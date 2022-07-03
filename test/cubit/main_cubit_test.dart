import 'package:bloc_test/bloc_test.dart' show blocTest;
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_bloc_example/cubit/main_cubit.dart';

void main() {
  group("testing of the main cubit of the app.", () {
    late CounterCubit counterCubit;
    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() {
      counterCubit.close();
    });

    test("testing the initial value of the cubit.", () {
      expect(counterCubit.state, CounterState(countervalue: 0));
    });


   blocTest<CounterCubit, CounterState>(
     'check if increment works as expected.',
     build: () => CounterCubit(),
     act: (bloc) => bloc.increment(),
     expect: () => [CounterState(countervalue: 1)],
   );

    blocTest<CounterCubit, CounterState>(
     'check if decrement works as expected.',
     build: () => CounterCubit(),
     act: (bloc) => bloc.decrement(),
     expect: () => [CounterState(countervalue: -1)],
   );
  });
}
