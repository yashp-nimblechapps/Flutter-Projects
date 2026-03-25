import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final staticStringProvider = Provider((Ref ref) {
  return 'Hello World';
});

final intProvider = Provider((Ref ref) {
  return 20;
});

final doubleProvider = Provider((Ref ref) {
  return 20.02;
});

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final result = ref.watch(staticStringProvider);
    final resultInt = ref.watch(intProvider);
    final resultDouble = ref.watch(doubleProvider);

    return Scaffold(
      body: Center(
        child: Text('$result\n$resultInt\n$resultDouble'),
      ),
    );
  }
}