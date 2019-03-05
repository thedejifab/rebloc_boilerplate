import 'package:meta/meta.dart';

@immutable
class MainState {
  final int counter;

  MainState({this.counter});

  MainState.initialState() : counter = 0;

  MainState copyWith({int counter}) {
    return MainState(
      counter: counter ?? this.counter,
    );
  }

  
  @override
  String toString() => "MainState_$counter";
}
