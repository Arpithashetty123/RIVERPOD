import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProviderPage extends ConsumerWidget {
//class ProviderPage extends StatelessWidget {
  const ProviderPage({super.key});
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final name = ref.watch(nameProvider); //method1
    final name1 =ref.watch(nameProvider);//method2  (one-time read) ,it is not recommented to use inside build method
    return Scaffold(
        // body: Consumer(
        //   builder: (context, ref, child) {
        //     final name =ref.watch(nameProvider);
        body:Column(
      children: [
        Text(name),
        Text(name1)
        ],
    ));
  }
}
