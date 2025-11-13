# 🌟 ValueNotifier Example

This folder demonstrates the **ValueNotifier** state management pattern built into Flutter.

**ValueNotifier** allows a widget to **reactively rebuild** when its state changes, using `ValueListenableBuilder`.  
It is ideal for **small, lightweight applications** or **single-feature pages**, where you want **minimal boilerplate** and no external dependencies.

---

## 🧠 Overview

- Uses **`ValueNotifier<T>`** to hold state objects.
- Updates automatically rebuild widgets via **`ValueListenableBuilder`**.
- No third-party packages required.
- Great for **local feature-level state**.

---

## 🚀 Key Concepts

| Concept                    | Description                                                                     |
| :------------------------- | :------------------------------------------------------------------------------ |
| **ValueNotifier**          | Holds a value and notifies listeners when it changes.                           |
| **ValueListenableBuilder** | Listens to a `ValueNotifier` and rebuilds its child whenever the value updates. |
| **Controller**             | A class holding logic and the `ValueNotifier` state (like a mini ViewModel).    |

---

## 💡 Example Usage

Here’s a simple example from the **Article List Page**:

```dart
class ArticleListPage extends StatefulWidget {
  const ArticleListPage({super.key});

  @override
  State<ArticleListPage> createState() => _ArticleListPageState();
}

class _ArticleListPageState extends State<ArticleListPage> {
  late final ArticleListController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ArticleListController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ValueNotifier: Article List')),
      body: ValueListenableBuilder<ArticleListState>(
        valueListenable: _controller.state,
        builder: (context, state, _) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.error != null) {
            return Center(child: Text('Error: ${state.error}'));
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
                onTap: () {
                  // Navigate to detail page or perform action
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _controller.refresh,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
```

---

## 📁 Structure

- presentation/09_valuenotifier/
  - controller/
    - article_detail_controller.dart
    - article_list_controller.dart
  - page/
    - article_detail_page.dart
    - article_list_page.dart
  - state/
    - article_detail_state.dart
    - article_list_state.dart
  - valuenotifier.dart

---
