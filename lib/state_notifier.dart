import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class StateNotifierPage extends ConsumerWidget {
  const StateNotifierPage({super.key});
  void onSubmitted(String value, WidgetRef ref ){
    ref.read(userProvider.notifier).updateName(value);
  }
 void onsubmittedAge(String value,WidgetRef ref){
  ref.watch( userProvider.notifier).updateAge(int.parse(value));
 }
  @override
  Widget build(BuildContext context,WidgetRef ref) {
  final user= ref.watch(userProvider);
  final user1 =ref.watch(userProvider.select((value) => value.age));//another method
    return  Scaffold(
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
          Text(user1.toString())
        ],
      ),
    );
  }
}
