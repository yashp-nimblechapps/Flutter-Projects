import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practise/6.%20StateNotifierProvider/todo_example/todo_provider_controller.dart';

class TodoScreen extends ConsumerStatefulWidget {
  const TodoScreen({super.key});

  @override
  ConsumerState<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends ConsumerState<TodoScreen> {

  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final todos = ref.watch(todoListProvider);
    final notifier = ref.read(todoListProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text('Riverpod Todo List'),),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            //Add Todo
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller:  _controller,
                    decoration: InputDecoration(labelText: 'New Task'),
                  )
                ),
                IconButton(
                  onPressed: () {
                    final text = _controller.text.trim();
                    if (text.isNotEmpty) {
                      notifier.add(text);
                      _controller.clear();
                    }
                  }, 
                  icon: Icon(Icons.add)
                )
              ],
            ),
            SizedBox(height: 16,),

            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (_, i) {
                  final todo = todos[i];
                  return ListTile(
                    leading: Checkbox(
                      value: todo.completed, 
                      onChanged: (_) => notifier.toggle(todo.id),
                    ),
                    title: Text(todo.title, 
                      style: TextStyle(
                        decoration: todo.completed ? TextDecoration.lineThrough : TextDecoration.none   //dashline
                      ),
                    ),
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
      ),     
    );
  }
}