import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practise/5.%20StreamProvider/fake_stream_service.dart';

final tickerProvider = StreamProvider((Ref ref) {
  final service = ref.read(timeServiceProvider);
  return service.tickwithError();
});

class TimerScreen extends ConsumerWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final tickAsync = ref.watch(tickerProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Live Timer'),),
      body: Center(
        child: tickAsync.when(
          loading: () => CircularProgressIndicator(),
          data: (count) => Text('Seconds elapsed: $count'), 
          error: (err, _) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Error $err', style: TextStyle(color: Colors.red),),
              SizedBox(height: 12,),
              ElevatedButton(
                onPressed: () => ref.refresh(tickerProvider),
                child: Text('Retry')
              ),
            ],
          ), 
        )
      ),
    );
  }
}