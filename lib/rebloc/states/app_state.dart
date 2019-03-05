import 'package:meta/meta.dart';
import 'package:rebloc_boilerplate/rebloc/states/main_state.dart';

@immutable
class AppState {
  final MainState mainState;

  AppState({this.mainState});

  AppState.initialState() : mainState = MainState.initialState();

  AppState copyWith({MainState mainState}) {
    return AppState(
      mainState: mainState ?? this.mainState,
    );
  }

  @override
  String toString() => "AppState_$mainState";
}
