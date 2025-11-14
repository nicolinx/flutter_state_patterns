# 🔮 MobX Example

This folder demonstrates the **MobX** state management pattern using the  
[`mobx`](https://pub.dev/packages/mobx) and [`flutter_mobx`](https://pub.dev/packages/flutter_mobx) packages.

**MobX** brings **observable state**, **computed values**, and **reactions** to Flutter — producing highly reactive UIs with very minimal boilerplate.  
It is ideal for **small to medium-large applications** that prefer clean, reactive state with a simple mental model.

---

## 🧠 Overview

- Uses **Stores** to hold observable state and actions.
- UIs automatically rebuild using **Observer** widgets.
- State updates occur through **@action** methods.
- Supports **computed** values for derived data.
- Plays well with DI tools like **GetIt**.
- Requires code generation (`build_runner`).

---

## 🚀 Key Concepts

| Concept          | Description                                                              |
| ---------------- | ------------------------------------------------------------------------ |
| **Observable**   | Reactive field that notifies observers when it changes.                  |
| **Action**       | Wraps state-changing code — ensures reactive updates behave predictably. |
| **Computed**     | Derives values from observables (auto-updated).                          |
| **Store**        | Class containing observables, actions, and computed values.              |
| **Observer**     | Flutter widget that rebuilds automatically when observed state changes.  |
| **mobx_codegen** | Code generator for eliminating boilerplate in Store classes.             |

---

## 💡 Example Usage (Article List Page)

```dart
class ArticleListPage extends StatefulWidget {
  const ArticleListPage({super.key});

  @override
  State<ArticleListPage> createState() => _ArticleListPageState();
}

class _ArticleListPageState extends State<ArticleListPage> {
  late final ArticleListStore store;

  @override
  void initState() {
    super.initState();
    store = locator<ArticleListStore>();
    store.onInitialFetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MobX: Article List')),
      body: Observer(
        builder: (_) {
          if (store.state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (store.state.articles.isEmpty) {
            return const Center(child: Text('No articles found.'));
          }

          return ListView.builder(
            itemCount: store.state.articles.length,
            itemBuilder: (context, index) {
              final article = store.state.articles[index];
              return ListTile(
                title: Text(article.title),
                subtitle: Text(article.content),
                onTap: () =>
                    context.push('/article_detail', extra: article),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => store.onRefresh(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
```

## 📦 Store Example

```dart
import 'package:flutter_state_boilerplate/src/feature/article/data/repository/article_repository.dart';
import 'package:flutter_state_boilerplate/src/feature/article/presentation/07_mobx/mobx.dart';
import 'package:mobx/mobx.dart';

part 'article_list_store.g.dart';

class ArticleListStore = _ArticleListStore with _$ArticleListStore;

abstract class _ArticleListStore with Store {
  final ArticleRepository _articleRepository;
  int _page = 1;

  _ArticleListStore(this._articleRepository);

  @observable
  ArticleListState state = const ArticleListState();

  @action
  Future<void> onInitialFetch() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final response = await _articleRepository.getArticles(_page, 20);
      state = state.copyWith(
        isLoading: false,
        error: null,
        hasMore: response.hasMore ?? false,
        articles: response.articles ?? [],
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  @action
  Future<void> onLoadMore() async {
    if (state.isLoadingMore || !state.hasMore) return;

    state = state.copyWith(isLoadingMore: true, error: null);

    try {
      final response = await _articleRepository.getArticles(++_page, 20);
      state = state.copyWith(
        isLoadingMore: false,
        error: null,
        hasMore: response.hasMore ?? false,
        articles: [...state.articles, ...response.articles ?? []],
      );
    } catch (e) {
      state = state.copyWith(isLoadingMore: false, error: e.toString());
    }
  }

  @action
  Future<void> onRefresh() async {
    _page = 1;
    onInitialFetch();
  }
}
```

## 🔧 Generate MobX Code

Generate .g.dart files:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

Watch mode:

```bash
flutter pub run build_runner watch --delete-conflicting-outputs
```

---

## 📁 Structure

- presentation/07_mobx/
  - page/
    - article_detail_page.dart
    - article_list_page.dart
  - store/
    - article_detail_store.dart
    - article_list_store.dart
  - state/
    - article_detail_state.dart
    - article_list_state.dart
  - mobx.dart

---
