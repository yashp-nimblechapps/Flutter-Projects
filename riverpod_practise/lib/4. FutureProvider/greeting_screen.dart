import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practise/4.%20FutureProvider/fake_api_service.dart';

// Future Provider
final fakeApiProvider = Provider((_) => FakeService());

final greetingFutureProvider = FutureProvider((Ref ref) async {
  final service = ref.read(fakeApiProvider);
  return await service.fetchGreeting();
});

// UI Screen to display Future data
class GreetingScreen extends ConsumerWidget {
  const GreetingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // watch the FutureProvider
    final greetingAsync = ref.watch(greetingFutureProvider);
    
    return Scaffold(
      appBar: AppBar(title: Text('Async Greeting'),),
      body: Center(
        // Load Data
        child: greetingAsync.when(
          skipLoadingOnRefresh: false,
          data: (greeting) => Text(greeting, style: TextStyle(fontSize: 24),), 
          error: (error, stackTrace) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Error $error', style: TextStyle(color: Colors.red),),
              SizedBox(height: 12,),
              ElevatedButton(
                onPressed: () => ref.refresh(greetingFutureProvider), 
                child: Text('Retry'))
            ],
          ),
          loading: () => CircularProgressIndicator()
        ),
      ),
    );
  }
}