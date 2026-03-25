import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practise/7.%20&%208.%20AsyncNotifier/async_notifier.dart';

class AsyncNotifierScreen extends ConsumerWidget {
  const AsyncNotifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final greetingAsync = ref.watch(greetingAsyncProvider(1));
    final greeingAsyncNotifier = ref.read(greetingAsyncProvider(1).notifier);

    return Scaffold(
      appBar: AppBar(title: Text('Async Notifier')
    ),
    body: Center(
      child: greetingAsync.when(
        //skipLoadingOnRefresh: false,
        data: (g) => Text(g, style: TextStyle(fontSize: 24),), 
        error: (e, _) => Text('Error: $e'), 
        loading: () => CircularProgressIndicator()
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () => greeingAsyncNotifier.refreshGreeting(),
      child: Icon(Icons.refresh),
    ),
    );
  }
}