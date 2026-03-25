import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practise/9.%20Computed%20StateProvider/computed_providers.dart';

class SumScreen extends ConsumerWidget {
  const SumScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final sum = ref.watch(sumProvider);
    
    return Scaffold(
      appBar: AppBar(title: Text('Sum Screen'),),
      body: Center(
        child: Text('Total = $sum', style: TextStyle(fontSize: 21) ,),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          final list = ref.read(numberProvider.notifier).state;
          ref.read(numberProvider.notifier).state = [...list, list.length + 1];
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class TodoFilterScreen extends ConsumerWidget{
  const TodoFilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final todos = ref.watch(filteredTodoProvider);
    final notifier = ref.read(todoListProvider.notifier);

    return Scaffold(
      floatingActionButton: IconButton(
        onPressed: () {
          final text = 'Todo Item';
          notifier.add(text);
        }, 
        icon: Icon(Icons.add),
      ),
      appBar: AppBar(title: Text('Filtered Todos'),),
      body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                  decoration: InputDecoration(labelText: 'Search'),
                  onChanged: (t) => ref.read(filterTextProvider.notifier).state = t,
              )
            ),       
            SizedBox(height: 16,),
            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (_, i) {
                  final todo = todos[i];
                  return ListTile(
                    leading: Checkbox(value: todo.completed, onChanged: (_) => notifier.toggle(todo.id),
                    ),
                    title: Text(todo.title,),
                    trailing: IconButton(
                      onPressed: () => notifier.remove(todo.id) , 
                      icon: Icon(Icons.delete)
                    ),
                  );
                }
              )
            )
          ],
        ),     
    );
  }
}
