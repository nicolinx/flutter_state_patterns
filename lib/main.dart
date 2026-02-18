import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_patterns/src/app.dart';
import 'package:flutter_state_patterns/src/core/di/injector.dart';
import 'package:redux/redux.dart';

import 'src/feature/article/presentation/08_redux/redux.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDI();

  // for redux
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: createMiddlewares(),
  );

  runApp(ProviderScope(child: App(store: store)));
}
