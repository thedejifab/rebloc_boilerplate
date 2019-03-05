import 'package:flutter/material.dart';
import 'package:rebloc/rebloc.dart';
import 'package:rebloc_boilerplate/rebloc/actions/main_action.dart';
import 'package:rebloc_boilerplate/rebloc/states/app_state.dart';
import 'package:rebloc_boilerplate/rebloc/states/main_state.dart';
import 'package:rebloc_boilerplate/rebloc/store.dart';

void main() {
  runApp(StoreProvider(
    store: appStore,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo - ReBLOC'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            ViewModelSubscriber<AppState, MainState>(
              converter: (state) => state.mainState,
              builder: (context, dispatcher, viewModel) {
                return Text(
                  '${viewModel.counter}',
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: ViewModelSubscriber<AppState, MainState>(
          converter: (state) => state.mainState,
          builder: (context, dispatcher, viewModel) {
            return FloatingActionButton(
              onPressed: () {
                dispatcher(IncrementCounter(currentCounter: viewModel.counter));
              },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            );
          }), 
    );
  }
}
