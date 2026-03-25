import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider = StreamProvider((ref) async* {
  yield [1,2,3,4,5,6,7,8,9,10,11,12];
});

void main() {
  runApp(const ProviderScope(child: Streamexample()));
}

class Streamexample extends ConsumerWidget {
  const Streamexample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Stream Provider'),),
      body: ref.watch(streamProvider).when(
        data: (data) => Text(data.toString()), 
        error: (error, StackTrace) => Text(error.toString()), 
        loading: () => CircularProgressIndicator()
      ),
    );
  }
}