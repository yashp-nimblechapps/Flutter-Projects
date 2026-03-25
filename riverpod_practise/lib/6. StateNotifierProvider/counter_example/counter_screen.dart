import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practise/6.%20StateNotifierProvider/counter_example/counter_provider_controller.dart';

class CounterScreen extends ConsumerWidget{
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final count = ref.watch(counter2Provider);
    final ctrl = ref.read(counter2Provider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text('CounterNotifier'),),
      body: Center(
        child: Text('Count: $count', style: TextStyle(fontSize: 21),),
      ),
      
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed: ctrl.increment, child: Icon(Icons.add),),
          SizedBox(width: 12,),
          FloatingActionButton(onPressed: ctrl.decrement, child: Icon(Icons.remove),),
          SizedBox(width: 12,),
          FloatingActionButton(onPressed: ctrl.reset, child: Icon(Icons.refresh),)       
        ],
      ),
    );
  }
}