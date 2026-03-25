import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practise/6.%20StateNotifierProvider/todo_example/todo_model.dart';
import 'package:riverpod_practise/6.%20StateNotifierProvider/todo_example/todo_provider_controller.dart';

final numberProvider = StateProvider<List<int>>((_) => [1,2,3,4,5]);

// Derived State

// EXAMPLE 1 of sum of numbers
final sumProvider = Provider((Ref ref) {
  final list = ref.watch(numberProvider);     
  return list.fold(0, (total, n) => total + n);
});


// EXAMPLE 2 of TODO app

final todoListProvider = StateNotifierProvider<TodoListNotifier, List<Todo>>(
  (ref) => TodoListNotifier([]),
);

final filterTextProvider = StateProvider<String>((_) => '');

final filteredTodoProvider = Provider<List<Todo>>((ref) {
  final todos = ref.watch(todoListProvider);
  final filter = ref.watch(filterTextProvider);

  if (filter.isEmpty) return todos;

  return todos.where((t) => t.title.toLowerCase().contains(filter.toLowerCase()))
      .toList();
});