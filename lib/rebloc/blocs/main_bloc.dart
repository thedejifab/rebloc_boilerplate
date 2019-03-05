import 'dart:async';

import 'package:rebloc/rebloc.dart';
import 'package:rebloc_boilerplate/rebloc/actions/main_action.dart';
import 'package:rebloc_boilerplate/rebloc/states/app_state.dart';

class MainBloc extends SimpleBloc<AppState> {
  @override
  FutureOr<Action> middleware(
      DispatchFunction dispatcher, AppState state, Action action) async {
    if (action is IncrementCounter) {
      int result = action.currentCounter + 1;
      dispatcher(DisplayNewCounter(newCounter: result));
    }
    return super.middleware(dispatcher, state, action);
  }

  @override
  AppState reducer(AppState state, Action action) {
    final _mainState = state.mainState;

    if (action is DisplayNewCounter) {
      return state.copyWith(
        mainState: _mainState.copyWith(counter: action.newCounter),
      );
    }
    return super.reducer(state, action);
  }
}
