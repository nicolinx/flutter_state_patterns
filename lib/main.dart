import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_boilerplate/src/app.dart';
import 'package:flutter_state_boilerplate/src/core/di/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDI();

  runApp(ProviderScope(child: const App()));
}
