import 'package:flutter_state_boilerplate/src/core/network/api_client.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

Future<void> initDI() async {
  // --- Core / Network ---
  di.registerLazySingleton(() => ApiClient());
}
