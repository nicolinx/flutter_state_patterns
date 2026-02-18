import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_patterns/src/core/di/injector.dart';
import 'package:flutter_state_patterns/src/feature/article/presentation/06_riverpod/riverpod.dart';

final articleDetailProvider =
    StateNotifierProvider<ArticleDetailController, ArticleDetailState>(
      (ref) => di<ArticleDetailController>(),
    );
