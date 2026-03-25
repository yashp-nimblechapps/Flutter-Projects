import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practise/4.%20FutureProvider/Second%20Example/userListScreen.dart';
void main() {
  runApp(ProviderScope(child: MaterialApp(home: UserListScreen())));
}

