# Flutter State Management Boilerplate

A Flutter boilerplate demonstrating **all common state management approaches**:  
`setState`, `Provider`, `Riverpod`, `BLoC`, `GetX`, `MobX`, and more. Perfect for learning, comparing, and building scalable apps.

## 📁 State Management Implementations

| Folder                                                                       | Approach          | Description                                           |
| :--------------------------------------------------------------------------- | :---------------- | :---------------------------------------------------- |
| [`01_setstate`](/lib/src/feature/article/presentation/01_setstate)           | **setState**      | Basic Flutter built-in state management               |
| [`02_provider`](/lib/src/feature/article/presentation/02_provider)           | **Provider**      | Simple and lightweight state management               |
| [`03_bloc`](/lib/src/feature/article/presentation/03_bloc)                   | **BLoC**          | Business Logic Component pattern using `flutter_bloc` |
| [`04_cubit`](/lib/src/feature/article/presentation/04_cubit)                 | **Cubit**         | Simplified version of BLoC with minimal boilerplate   |
| [`05_riverpod`](/lib/src/feature/article/presentation/05_riverpod)           | **Riverpod**      | Modern, type-safe, and testable approach              |
| [`06_getx`](/lib/src/feature/article/presentation/06_getx)                   | **GetX**          | Reactive and minimal boilerplate pattern              |
| [`07_mobx`](/lib/src/feature/article/presentation/07_mobx)                   | **MobX**          | State management using observables and reactions      |
| [`08_redux`](/lib/src/feature/article/presentation/08_redux)                 | **Redux**         | Predictable state container using actions & reducers  |
| [`09_valuenotifier`](/lib/src/feature/article/presentation/09_valuenotifier) | **ValueNotifier** | Lightweight built-in reactive state approach          |

> 💡 Each folder includes its own `README.md` explaining setup, usage, and example pages.

## Getting Started

1. **Clone the repo**

```bash
git clone https://github.com/yourusername/flutter-state-mgmt-boilerplate.git
```

2. **Install dependencies**

```bash
flutter pub get
```

3. **Run the app**

```bash
flutter run
```

## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests for:

- Adding new state management examples
- Improving existing implementations
- Fixing bugs or enhancing docs

## License

This project is licensed under the MIT License.
