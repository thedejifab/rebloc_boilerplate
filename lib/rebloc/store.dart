import 'package:rebloc_boilerplate/rebloc/blocs/main_bloc.dart';
import 'package:rebloc_boilerplate/rebloc/states/app_state.dart';
import 'package:rebloc/rebloc.dart';

final appStore = Store<AppState>(
  initialState: AppState.initialState(),
  blocs: [
    MainBloc(),
  ],
);
