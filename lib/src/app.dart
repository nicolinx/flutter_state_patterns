import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_state_patterns/src/core/router/app_router.dart';
import 'package:flutter_state_patterns/src/feature/article/presentation/08_redux/redux.dart';
import 'package:redux/redux.dart';

class App extends StatelessWidget {
  final Store<AppState> store;

  const App({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp.router(routerConfig: AppRouter.router),
    );
  }
}
