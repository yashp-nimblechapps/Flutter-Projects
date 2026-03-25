import 'package:flutter_riverpod/flutter_riverpod.dart';

//StateNotifierProvider<Object, dynamic>

final counter2Provider = StateNotifierProvider<CounterNotifier, int>((_) {
  return CounterNotifier(0);
});

class CounterNotifier extends StateNotifier<int> {
  //constructure
  CounterNotifier(super.state);

  void increment() => state++;
  void decrement() => state--;
  void reset() => state = 0;
}