import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangeNotifierPage extends ConsumerWidget {
  const ChangeNotifierPage({super.key});
  void onSubmitted(String value, WidgetRef ref) {
    ref.read(userChangenotifier).updateName(value);
  }

  void onsubmittedAge(String n, WidgetRef ref) {
    ref.read(userChangenotifier).updateAge(int.parse(n));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userChangenotifier).person;
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: Column(
        children: [
          TextField(
            onSubmitted: (value) {
              return onSubmitted(value, ref);
            },
          ),
          TextField(
            onSubmitted: (n) {
              return onsubmittedAge(n, ref);
            },
          ),
          Text(user.age.toString())
        ],
      ),
    );
  }
}
