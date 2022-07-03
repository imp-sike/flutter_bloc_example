import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/logic/cubit/main_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Base App 2"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterCubit, CounterState>(
            builder: (context, state) {
              return Text(
                "Counter value: ${state.countervalue}",
                style: const TextStyle(fontSize: 25),
              );
            },
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterCubit>().increment();
                },
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterCubit>().decrement();
                },
                child: const Icon(Icons.remove),
              ),
            ],
          ),
          // Container(
          //   margin: const EdgeInsets.all(50),
          //   child: MaterialButton(
          //     color: Colors.red,
          //     padding: const EdgeInsets.all(20),
          //     onPressed: () {
          //       Navigator.pushNamed(context, "/second");
          //     },
          //     child:  const Text("Go to Second screen", style: TextStyle(color: Colors.white),),
          //   ),
          // )
        ],
      ),
    );
  }
}
