import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_projects/counterbloc/counter_bloc.dart';

class CounterPageView extends StatefulWidget {
  CounterPageView({Key ? key, required this.title}) : super(key: key);

  final String title;

  @override
  _CounterPageViewState createState() => _CounterPageViewState();
}

class _CounterPageViewState extends State<CounterPageView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context)=> CounterBloc(),
        child: BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Scaffold(
                backgroundColor: Colors.lightBlue,
                body: Center(
                  child: Column(
                    children: [
                      Text(state.count.toString()),
                      Row(
                        children: [
                          ElevatedButton(onPressed: (){
                            context.read<CounterBloc>().add(Increment(value: 2));
                          }, child: const Text("Increment")),
                          ElevatedButton(onPressed: (){
                            context.read<CounterBloc>().add(Decrement(value: 2));
                          }, child: const Text("Decrement")),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}

