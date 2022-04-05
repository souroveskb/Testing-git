part of 'counter_bloc.dart';


abstract class CounterEvent {
  int val;
  CounterEvent({required this.val});
}
class Increment extends CounterEvent{
  Increment({value}):super(val: value);
}
class Decrement extends CounterEvent{
  Decrement({value}):super(val: value);
}