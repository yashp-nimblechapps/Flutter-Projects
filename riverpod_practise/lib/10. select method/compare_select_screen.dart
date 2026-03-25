import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practise/6.%20StateNotifierProvider/todo_example/todo_model.dart';
import 'package:riverpod_practise/6.%20StateNotifierProvider/todo_example/todo_provider_controller.dart';

class CompareSelectScreen extends ConsumerWidget {
  const CompareSelectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(todoListProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ref.watch vs ref.watch(select)'),
      ),
      body: Row(
        children: const [
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Without select (bad)'),
                ),
                Expanded(child: TodoListWithoutSelect()),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('With select (good)'),
                ),
                Expanded(child: TodoListWithSelect()),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () =>
            notifier.add('New task ${DateTime.now().second}'),
        label: const Text('Add Todo'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}

/// WITHOUT SELECT (Bad – all items rebuild)

class TodoListWithoutSelect extends ConsumerWidget {
  const TodoListWithoutSelect({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoListProvider);

    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (_, i) {
        final todo = todos[i];
        return TodoItemWithoutSelect(todo: todo);
      },
    );
  }
}

class TodoListWithSelect extends ConsumerWidget {
  const TodoListWithSelect({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final length = ref.watch(todoListLengthProvider);

    print('TodoListWithSelect: parent rebuilt, length=$length');

    return ListView.builder(
      itemCount: length,
      itemBuilder: (context, i) {
        final todo = ref.read(todoListProvider)[i];
        return TodoItemWithSelect(
          todoId: todo.id,
          title: todo.title,
        );
      },
    );
  }
}

/// WITH SELECT (Good – only changed item rebuilds)

class TodoItemWithoutSelect extends ConsumerWidget {
  final Todo todo;

  const TodoItemWithoutSelect({
    required this.todo,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(todoListProvider.notifier);

    print('WithoutSelect: build item ${todo.id}');

    return ListTile(
      title: Text(todo.title),
      leading: Checkbox(
        value: todo.completed,
        onChanged: (_) => notifier.toggle(todo.id),
      ),
    );
  }
}

class TodoItemWithSelect extends ConsumerWidget {
  final int todoId;
  final String title;

  const TodoItemWithSelect({
    required this.todoId,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final completed = ref.watch(
      todoListProvider.select((list) {
        final todo = list.firstWhere((t) => t.id == todoId);
        return todo.completed;
      }),
    );

    final notifier = ref.read(todoListProvider.notifier);

    print('WithSelect: build item $todoId, completed=$completed');

    return ListTile(
      title: Text(title),
      leading: Checkbox(
        value: completed,
        onChanged: (_) => notifier.toggle(todoId),
      ),
    );
  }
}
