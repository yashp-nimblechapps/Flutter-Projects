import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practise/6.%20StateNotifierProvider/todo_example/todo_model.dart';

final simpleSelectProvider = StateProvider(
  (ref) => Todo(id: 1, title: 'New Todo item', completed: true)
);

class SelectSimpleDemo extends ConsumerWidget{
  const SelectSimpleDemo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final completed = ref.watch(simpleSelectProvider.select((item) => item.completed));
    final title = ref.read(simpleSelectProvider).title;
    print('Rebuild');

    return Scaffold(
      appBar: AppBar(title: Text('List Demo'),),
      body: Column(
        children: [
          Text('With Select', style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(width: 8,),
          Text('Title (read): $title'),
          SizedBox(height: 6,),
          Row(
            children: [
              Text('Completed'),
              SizedBox(width: 8,),
              Checkbox(value: completed, onChanged: (_) {
                // toggle via notifier
                final t =ref.read(simpleSelectProvider);
                ref.read(simpleSelectProvider.notifier).state = t.copyWith(completed: !t.completed);
              }),
              Checkbox(value: completed, onChanged: (_) {
                // toggle via notifier
                final t =ref.read(simpleSelectProvider);
                ref.read(simpleSelectProvider.notifier).state = t.copyWith(title: 'New New New' );
              }),
            ],
          )
        ],
      ),
    );
  }
  
}