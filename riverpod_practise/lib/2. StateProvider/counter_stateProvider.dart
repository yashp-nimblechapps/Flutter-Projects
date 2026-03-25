import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider((Ref ref) {
  return 0;
});

class CounterStateprovider extends ConsumerWidget {
  const CounterStateprovider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    print('Build method loaded');
    return Scaffold(
      appBar: AppBar(title: Text('Counter StateProvider'),),

      body: Center(
        child: Consumer(builder: (context, ref, child) {

          final counter = ref.watch(counterProvider);
          print('Consumer method loaded');
          return Text(counter.toString()); 
          
        }),
      ),

      floatingActionButton: IconButton(onPressed: () {
        ref.read(counterProvider.notifier).state ++;
      }, icon: Icon(Icons.add)),
    
    );
  }
}