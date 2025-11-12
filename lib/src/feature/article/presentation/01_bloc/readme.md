# 🧱 BLoC Example

This folder demonstrates the **BLoC (Business Logic Component)** pattern using the [`flutter_bloc`](https://pub.dev/packages/flutter_bloc) package.

---

## 🧠 Overview

- Uses **Events** and **States** to manage reactive UI updates.
- Promotes **separation of concerns** between UI and business logic.
- Scales well for **complex, testable**, and **predictable** applications.

---

## 🚀 Key Concepts

| Concept   | Description                                                          |
| :-------- | :------------------------------------------------------------------- |
| **Event** | Describes what should happen (e.g., `fetch`, `refresh`, `loadMore`). |
| **State** | Represents the UI’s condition at any given moment.                   |
| **Bloc**  | Reacts to events, performs logic, and emits new states.              |

---

## 💡 Example Usage

```dart
context.read<ArticleListBloc>().add(const ArticleListEvent.fetch());
```

or

```dart
context.read<ArticleDetailBloc>().add(ArticleDetailEvent.fetchArticleById(widget.articleId));
```

---

## 📁 Structure

- [presentation/01_bloc/](./presentation/01_bloc)
  - [bloc/](./presentation/01_bloc/bloc)
    - [article_detail/](./presentation/01_bloc/bloc/article_detail)
      - [article_detail_bloc.dart](./presentation/01_bloc/bloc/article_detail/article_detail_bloc.dart)
      - [article_detail_event.dart](./presentation/01_bloc/bloc/article_detail/article_detail_event.dart)
      - [article_detail_state.dart](./presentation/01_bloc/bloc/article_detail/article_detail_state.dart)
    - [article_list/](./presentation/01_bloc/bloc/article_list)
      - [article_list_bloc.dart](./presentation/01_bloc/bloc/article_list/article_list_bloc.dart)
      - [article_list_event.dart](./presentation/01_bloc/bloc/article_list/article_list_event.dart)
      - [article_list_state.dart](./presentation/01_bloc/bloc/article_list/article_list_state.dart)
  - [page/](./presentation/01_bloc/page)
    - [article_detail_page.dart](./presentation/01_bloc/page/article_detail_page.dart)
    - [article_list_page.dart](./presentation/01_bloc/page/article_list_page.dart)
  - [readme.md](./presentation/01_bloc/readme.md)

---
