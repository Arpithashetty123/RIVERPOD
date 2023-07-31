import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'main.dart';

class StreamProviderPage extends ConsumerStatefulWidget {
  const StreamProviderPage({super.key});
  @override
  ConsumerState<StreamProviderPage> createState() => _StreamProviderPageState();
}

class _StreamProviderPageState extends ConsumerState<StreamProviderPage> {
  @override
  Widget build(BuildContext context) {
    return ref.watch(userstreamProvider).when(data: (data) {
      return Scaffold(body: Text(data.toString()));
    }, error: (error, stackTrace) {
      return Scaffold(
          body: Center(
        child: Text(error.toString()),
      ));
    }, loading: () {
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
