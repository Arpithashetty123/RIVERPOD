// import 'package:flutter/material.dart';
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
 // By usinge SetState
// class _HomePageState extends State<HomePage> {
//   int counter=0;
//   void _incrementCount(){
//     setState(() {
//       counter++;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My First App'),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//      Text("Data,$counter"),
//           IconButton(onPressed: _incrementCount, icon: const Icon(Icons.add))
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
final countProvider= StateProvider((ref) => 0);
class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
  final counter=ref.watch(countProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My First App'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text("Data, $counter"),
          IconButton(
         onPressed: () => ref.read(countProvider),
            icon: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}