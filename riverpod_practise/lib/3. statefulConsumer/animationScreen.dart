import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final durationProvider = Provider((_) => const Duration(seconds: 2));

class Animationscreen extends ConsumerStatefulWidget {
  const Animationscreen({super.key});

  @override
  ConsumerState<Animationscreen> createState() => _AnimationscreenState();
}

class _AnimationscreenState extends ConsumerState<Animationscreen>
  with SingleTickerProviderStateMixin {

  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    final duration = ref.read(durationProvider);
    _animationController = AnimationController(vsync: this, duration: duration)
    ..repeat(reverse: true);
  }

  @override
  void dispose(){
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pulsing Circle'),),
      body: Center(
        child: ScaleTransition(
          scale: _animationController.drive(Tween(begin: 0.5, end: 1.5)),
          child: const Icon(Icons.circle, size: 80, color: Colors.blue,),
        ),
      ),
    );
  }
}