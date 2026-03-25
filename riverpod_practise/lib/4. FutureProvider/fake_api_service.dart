import 'dart:async';
import 'dart:math';

class FakeService {
  
  Future<String> fetchGreeting() async {
    await Future.delayed(Duration(seconds: 2));

    // Simulate a 30% chance of failure
    if(Random().nextDouble() < 0.3) {
      throw Exception('Failed to fetch greeeting');
    }
    return 'Hello from Async';
  }
}