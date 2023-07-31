import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StateProviderPage extends ConsumerWidget {
  const StateProviderPage({super.key});
  void _onSubmitted(String n, WidgetRef ref) {
    ref.read(nameStateProvider.notifier).update((state) => n);
  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
 final name =ref.watch(nameStateProvider)?? "";
    return Scaffold(
      body: Column(
        children: [
          TextField(
            onSubmitted: (value) {
             _onSubmitted(value, ref);
            },
          ),
          Text(name)
        ],
      ),
    );
  }
}
