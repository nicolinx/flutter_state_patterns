# 🧱 BLoC Example

This folder demonstrates the **BLoC (Business Logic Component)** pattern using the [`flutter_bloc`](https://pub.dev/packages/flutter_bloc) package.

**BLoC** is a state management pattern in Flutter that helps you separate **business logic** from **UI code**. By using **Events** and **States**, BLoC ensures that your application’s logic is **predictable, testable, and scalable**.

It is ideal for **complex applications** where multiple parts of the UI depend on shared state and require clear separation between input (Events) and output (States).

---

## 🧠 Overview

- Uses **Events** and **States** to manage reactive UI updates.
- Promotes **separation of concerns** between UI and business logic.
- Scales well for **complex, testable**, and **predictable** applications.
- Ideal for apps with **multiple features** and **shared state** across screens.

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

- presentation/01_bloc/
  - bloc/
    - article_detail/
      - article_detail_bloc.dart
      - article_detail_event.dart
      - article_detail_state.dart
    - article_list/
      - article_list_bloc.dart
      - article_list_event.dart
      - article_list_state.dart
  - page/
    - article_detail_page.dart
    - article_list_page.dart
  - bloc.dart

---
