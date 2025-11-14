# 🌿 Riverpod Example

This folder demonstrates the **Riverpod** state management pattern using the [`flutter_riverpod`](https://pub.dev/packages/flutter_riverpod) package.

**Riverpod** is a robust, compile-safe, and testable state management solution for Flutter.  
It is ideal for **small to large applications** that require clean separation between UI, state, and business logic — with predictable behavior and minimal boilerplate.

---

## 🧠 Overview

- Uses **Providers** to expose state and logic across your app.
- Business logic is placed inside **Notifiers** (e.g., `StateNotifier`, `AsyncNotifier`).
- UI automatically rebuilds using **`ref.watch`**.
- Encourages **immutable state**, often generated using **Freezed**.
- Works with any routing system (GoRouter recommended).

---

## 🚀 Key Concepts

| Concept                   | Description                                                                 |
| ------------------------- | --------------------------------------------------------------------------- |
| **Provider**              | Base building block — exposes values, state, or controllers across the app. |
| **StateNotifier**         | Encapsulates business logic and exposes immutable state.                    |
| **StateNotifierProvider** | Connects a `StateNotifier` to the widget tree.                              |
| **ref.watch / ref.read**  | Reads providers reactively or imperatively.                                 |
| **AsyncValue**            | Built-in data/loading/error wrapper for async operations.                   |
| **Freezed state**         | Immutable, type-safe structure for predictable state.                       |

---

## 💡 Example Usage (Article List Page)

```dart
class ArticleListPage extends ConsumerWidget {
  const ArticleListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(articleListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Riverpod: Article List')),
      body: Builder(builder: (context) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.articles.isEmpty) {
          return const Center(child: Text('No articles found.'));
        }

        return ListView.builder(
          itemCount: state.articles.length,
          itemBuilder: (context, index) {
            final article = state.articles[index];
            return ListTile(
              title: Text(article.title),
              subtitle: Text(article.content),
              onTap: () => context.push('/article_detail', extra: article),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            ref.read(articleListProvider.notifier).fetchArticles(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
```

## 📦 Provider / Controller Example

### Controller (StateNotifier)

```dart
class ArticleListController extends StateNotifier<ArticleListState> {
  ArticleListController() : super(const ArticleListState());

  Future<void> fetchArticles() async {
    state = state.copyWith(isLoading: true);

    await Future.delayed(const Duration(seconds: 1));

    state = state.copyWith(
      isLoading: false,
      articles: [
        Article(id: 1, title: "Hello", content: "Riverpod example"),
        Article(id: 2, title: "World", content: "Clean state management"),
      ],
    );
  }
}
```

### Provider

```dart
final articleListProvider =
    StateNotifierProvider<ArticleListController, ArticleListState>(
  (ref) => ArticleListController(),
);
```

---

## 📁 Structure

- presentation/06_riverpod/
  - controller/
    - article_detail_controller.dart
    - article_list_controller.dart
  - page/
    - article_detail_page.dart
    - article_list_page.dart
  - provider/
    - article_detail_provider.dart
    - article_list_provider.dart
  - state/
    - article_detail_state.dart
    - article_list_state.dart
  - riverpod.dart

---
