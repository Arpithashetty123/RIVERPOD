import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'main.dart';

class FamilyPage extends ConsumerStatefulWidget {
  const FamilyPage({super.key});
  @override
  ConsumerState<FamilyPage> createState() => _FamilyPageState();
}

class _FamilyPageState extends ConsumerState<FamilyPage> {
 String userNo="1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ref.watch(userfutureNotifier1(userNo)).when(data: (data) {
        return Scaffold(
          appBar: AppBar(title: Text(data.name)),
          body: Column(
            children: [
            TextField(
              onSubmitted: (value) {
                setState(() {
                  userNo=value;
                });
              },
            ),
              Text(data.email)
            ],
          ),
        );
      }, error: (error, stackTrace) {
        return Center(
          child: Text(error.toString()),
        );
      }, loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
