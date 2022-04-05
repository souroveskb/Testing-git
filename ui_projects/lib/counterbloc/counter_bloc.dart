import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(count: 0)) {
    on<Increment>((event, emit) {
        state.count += event.val;
        emit(CounterState(count: state.count));
    });
    on<Decrement>((event, emit) {
      state.count -= event.val;
      emit(CounterState(count: state.count));
    });
  }
}
