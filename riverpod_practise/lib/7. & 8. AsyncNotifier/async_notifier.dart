import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practise/4.%20FutureProvider/greeting_screen.dart';

final greetingAsyncProvider = AsyncNotifierProvider.autoDispose.family<GreetingAsyncNotifier, String, int>(
  () => GreetingAsyncNotifier());

class GreetingAsyncNotifier extends AutoDisposeFamilyAsyncNotifier<String, int> {

  @override
  Future<String> build(id) async {
    return await ref.read(fakeApiProvider).fetchGreeting();
  }

  Future<void> refreshGreeting() async {
    state = AsyncValue.loading();
    state = await AsyncValue.guard(() => ref.read(fakeApiProvider).fetchGreeting());

    /*
    try{
      state = AsyncValue.loading();
      final value = await ref.read(fakeApiProvider).fetchGreeting();
      state = AsyncValue.data(value);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
    */
  }
}