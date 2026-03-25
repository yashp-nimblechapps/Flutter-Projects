import 'package:flutter_riverpod/flutter_riverpod.dart';

final timeServiceProvider = Provider((_) => TimerScreen());

class TimerScreen {

  //Emits an integer every seconds, starting at 0
  Stream<int> tick() {
    return Stream.periodic(Duration(seconds: 1), (count) => (count));
  }

  // In TimerService :
  Stream<int> tickwithError() async* {
    for(int i = 0; i < 5; i++) {
      await Future.delayed(Duration(seconds: 1));
      yield i;
    }
    throw Exception('Timer stopped unexpectedly');
  }
}

