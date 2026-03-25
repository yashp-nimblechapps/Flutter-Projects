import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final textProvider = StateProvider((Ref ref) {
  return '';
});

class StatefulConsumerTutorial extends ConsumerStatefulWidget {
  const StatefulConsumerTutorial({super.key});

  @override
  ConsumerState<StatefulConsumerTutorial> createState() => _StatefulConsumerTutorialState();
}

class _StatefulConsumerTutorialState extends ConsumerState<StatefulConsumerTutorial> {

  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize controller and listen for changes
    _controller = TextEditingController();
    _controller.addListener(() {
      ref.read(textProvider.notifier).state = _controller.text;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final text = ref.watch(textProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Text form'),),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: _controller,
            ),
            SizedBox(height: 20,),
            Text('You typed: $text')
          ],
        ),
        ),
      
    );
  }
}

//ConsumerWidget is StatelessWidget have no lifecycle
//ConsumerStateWidget is StatefulWidget have void init method dispose method and all