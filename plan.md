lib/
└── src/
├── presentation/
│ ├── bloc/ <-- BLoC / Cubit state management
│ │ ├── cubit/
│ │ ├── bloc/
│ │ └── page/
│ │
│ ├── getx/ <-- GetX state management
│ │ ├── controller/
│ │ ├── binding/
│ │ └── page/
│ │
│ ├── provider/ <-- Provider / Riverpod
│ │ ├── notifier/
│ │ └── page/
│ │
│ ├── riverpod/ <-- Riverpod (if separate from Provider)
│ │ ├── provider/
│ │ └── page/
│ │
│ └── widget/ <-- Shared UI widgets
│
├── shared/
│ ├── mixin/
│ └── utils/
│
├── app.dart
└── main.dart
