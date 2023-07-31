import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'main.dart';

class MyWidget extends ConsumerStatefulWidget {
  const MyWidget({super.key});

  @override
  ConsumerState<MyWidget> createState() => _MyWidgetState();
}
class _MyWidgetState extends ConsumerState<MyWidget> {
  @override
  //ConsumerStatefulWidget has widgerref Built inside
  Widget build(BuildContext context) {
    final name=ref.watch(nameProvider);
    final name1=ref.read(nameProvider);
    return  Scaffold(
        body: Column(
      children: [
        Text(name),
        Text(name1)
        ],
    ));
  }
}