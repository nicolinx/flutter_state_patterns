# Flutter State Management Boilerplate

A Flutter boilerplate demonstrating **all common state management approaches**:  
`setState`, `Provider`, `Riverpod`, `BLoC`, `GetX`, `MobX`, and more. Perfect for learning, comparing, and building scalable apps.

## 📁 State Management Implementations

| Folder                                                        | Approach     | Description                                           |
| :------------------------------------------------------------ | :----------- | :---------------------------------------------------- |
| [`01_bloc`](lib/feature/article/presentation/01_bloc)         | **BLoC**     | Business Logic Component pattern using `flutter_bloc` |
| [`02_provider`](lib/feature/article/presentation/02_provider) | **Provider** | Simple and lightweight state management               |
| [`03_riverpod`](lib/feature/article/presentation/03_riverpod) | **Riverpod** | Modern, type-safe, and testable approach              |
| [`04_getx`](lib/feature/article/presentation/04_getx)         | **GetX**     | Reactive and minimal boilerplate pattern              |
| [`05_mobx`](lib/feature/article/presentation/05_mobx)         | **MobX**     | State management using observables and reactions      |
| [`00_setstate`](lib/feature/article/presentation/00_setstate) | **setState** | Basic Flutter built-in state management               |

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
