import 'package:flutter/material.dart';
import 'package:riverpod_mvvm/riverpod_mvvm.dart';
import 'package:riverpod_mvvm_example/second_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      child: MaterialApp(
        home: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulView<MyAppViewModel, int> {
  const MyApp({super.key});

  @override
  ViewState<MyAppViewModel, int> createState() => _MyAppState();
}

class _MyAppState extends ViewState<MyAppViewModel, int> with MyAppUiActions {
  @override
  initViewModel() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            read.moveToSecond();
          },
          child: const Icon(Icons.exit_to_app_sharp),
        ),
        title: const Text('Example'),
      ),
      body: Center(
        child: Text(
          '$watch',
          style: const TextStyle(fontSize: 32),
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          read.increase();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  MyAppViewModel get read => ref.read(myAppViewModel.notifier);

  @override
  int get watch => ref.watch(myAppViewModel);

  @override
  moveToSecondPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SecondPage()));
  }
}

mixin MyAppUiActions {
  moveToSecondPage();
}

final myAppViewModel =
    StateNotifierProvider<MyAppViewModel, int>((ref) => MyAppViewModel(0));

class MyAppViewModel extends StateNotifier<int> with ViewModel<MyAppUiActions> {
  MyAppViewModel(super.state);

  increase() {
    state++;
  }

  moveToSecond() {
    state = 0;
    uiActions.moveToSecondPage();
  }
}
