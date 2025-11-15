# 🧩 Flutter State Management Boilerplate

A comprehensive Flutter boilerplate showcasing **multiple state management approaches** in one unified project:

`setState`, `Provider`, `Riverpod`, `BLoC`, `Cubit`, `GetX`, `MobX`, `Redux`, and `ValueNotifier`.

Perfect for **learning, comparing, prototyping, and understanding trade-offs** between each approach — all using the **same feature**, the same API, and the same architecture.

---

## 🚀 What This Project Covers

This repository demonstrates:

- **9 popular state management approaches**, implemented side-by-side
- **Clean Architecture folder structure**
- **Dio** for networking
- **get_it** for dependency injection
- **Freezed** for data classes & sealed states
- **go_router** for navigation
- **Mock API backend** (Node.js) for consistent, testable data
- A realistic example feature:  
  **Article List → Pagination (infinite scroll) → Article Detail**

---

## 📁 State Management Implementations

| Folder                                                                        | Approach          | Description                                        |
| :---------------------------------------------------------------------------- | :---------------- | :------------------------------------------------- |
| [`01_setstate`](./lib/src/feature/article/presentation/01_setstate)           | **setState**      | Basic Flutter built-in state management            |
| [`02_provider`](./lib/src/feature/article/presentation/02_provider)           | **Provider**      | Simple and lightweight state management            |
| [`03_bloc`](./lib/src/feature/article/presentation/03_bloc)                   | **BLoC**          | Predictable state transitions using `flutter_bloc` |
| [`04_cubit`](./lib/src/feature/article/presentation/04_cubit)                 | **Cubit**         | Lightweight BLoC with minimal boilerplate          |
| [`05_getx`](./lib/src/feature/article/presentation/05_getx)                   | **GetX**          | Fast, reactive, and minimal setup                  |
| [`06_riverpod`](./lib/src/feature/article/presentation/06_riverpod)           | **Riverpod**      | Modern, type-safe, flexible, and testable          |
| [`07_mobx`](./lib/src/feature/article/presentation/07_mobx)                   | **MobX**          | Observable-driven reactive state management        |
| [`08_redux`](./lib/src/feature/article/presentation/08_redux)                 | **Redux**         | Predictable global store with actions & reducers   |
| [`09_valuenotifier`](./lib/src/feature/article/presentation/09_valuenotifier) | **ValueNotifier** | Lightweight built-in reactive state tools          |

> 💡 Each folder includes its own `README.md` describing setup, usage, and sample pages.

---

## 🔗 Mock API

This project uses a custom Node.js mock API to ensure consistent, reproducible results.

**Mock API Repo:**  
https://github.com/nicolin29/mock-api-nodejs

Endpoints include:

- `/articles?page={page}&limit={limit}` → paginated article list
- `/articles/{id}` → article detail

Used by every state management example.

---

## 📱 Feature Demonstrated (Same Across All Approaches)

Every state management example implements the **same exact feature**, allowing apples-to-apples comparison.

### **Article List Page**

- Fetch articles from mock API
- Infinite scroll pagination
- Loading & error states
- Clean UI and structure

### **Article Detail Page**

- Navigate using `go_router`
- Fetch article by ID
- Display detail content

---

## 🛠 Getting Started

1. **Clone the repo**

   ```bash
   git clone https://github.com/yourusername/flutter-state-mgmt-boilerplate.git
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the mock API (Node.js repo)**

   Follow instructions here:
   https://github.com/nicolin29/mock-api-nodejs
   <br>

4. **Run the app**
   ```bash
   flutter run
   ```

---

## 🤝 Contributing

Contributions are welcome!  
You can help by:

- Adding new state management examples
- Improving architecture or patterns
- Fixing bugs
- Enhancing documentation
- Creating more sample features (search, CRUD, auth, etc.)

---

## License

This project is licensed under the **MIT License**.

---

## Created & Maintained by

**Nicodemus Lin**  
Full-Stack & Mobile Engineer — From Idea to Scalable Product

[![GitHub](https://img.shields.io/badge/GitHub-nicolin29-000?logo=github)](https://github.com/nicolin29)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Nicodemus_Lin-0A66C2?logo=linkedin)](https://www.linkedin.com/in/nicodemus-lin/)
[![Email](https://img.shields.io/badge/Email-nicolin.work%40gmail.com-D14836?logo=gmail)](mailto:nicolin.work@gmail.com)
