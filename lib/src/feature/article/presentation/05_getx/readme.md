# ⚡️ GetX Example

This folder demonstrates the **GetX** state management pattern using the [`get`](https://pub.dev/packages/get) package.

**GetX** is an all-in-one Flutter solution that provides **state management**, **dependency injection**, and **route management** in a lightweight and reactive way.  
It is ideal for **small to medium-sized applications** that need clear separation between UI, logic, and dependencies — without excessive boilerplate.

---

## 🧠 Overview

- Uses **`GetxController`** for reactive logic and lifecycle management.
- State updates are handled automatically with **`Obx`** reactive widgets.
- Includes **Bindings** to register controllers and dependencies per feature.
- Compatible with **GoRouter** or **GetMaterialApp** (manual binding supported).

---

## 🚀 Key Concepts

| Concept             | Description                                                                        |
| :------------------ | :--------------------------------------------------------------------------------- |
| **GetxController**  | Encapsulates business logic and exposes reactive state variables.                  |
| **Rx (reactive)**   | Any variable can be made reactive using `.obs`, enabling automatic UI rebuilds.    |
| **Obx**             | A widget that listens to reactive variables and rebuilds when they change.         |
| **Binding**         | Defines and registers dependencies (controllers, services) for a route or feature. |
| **Get.find\<T\>()** | Retrieves an already-registered dependency anywhere in the app.                    |

---

## 💡 Example Usage

Here’s a simple example from the **Article List Page**:

```dart
class ArticleListPage extends GetView<ArticleListController> {
  const ArticleListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GetX: Article List')),
      body: Obx(() {
        final state = controller.state.value;

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
              onTap: () => Get.toNamed('/article_detail', arguments: article),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.fetchArticles,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
```

## 📦 Dependency Injection Example

Each feature defines its own Binding to register controllers and services:

```dart
class ArticleListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArticleListController>(() => ArticleListController());
  }
}
```

Bindings are automatically triggered when using **`GetMaterialApp`** with **`GetPage`**,  
or can be manually called inside a **GoRoute** builder:

```dart
GoRoute(
  name: ArticleListPage.routeName,
  path: ArticleListPage.routePath,
  builder: (context, state) {
    ArticleListBinding().dependencies(); // manually inject controller
    return const ArticleListPage();
  },
);
```

---

## 📁 Structure

- presentation/05_getx/
  - binding/
    - article_detail_binding.dart
    - article_list_binding.dart
  - controller/
    - article_detail_controller.dart
    - article_list_controller.dart
  - page/
    - article_detail_page.dart
    - article_list_page.dart
  - state/
    - article_detail_state.dart
    - article_list_state.dart
  - getx.dart

---
