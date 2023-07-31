import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/main.dart';
class FutureProviderPage extends ConsumerWidget {
  const FutureProviderPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //return ref.watch(userfutureNotifier).whenData((value) => null)  (It is used when we dont want error or loading screen)
   //map:
    // ref.watch(userfutureNotifier).map(data: (data){
    // data.value.email;
    // }, error: (error){},loading: (loading) {
    // },);
   return Scaffold(
  body: ref.watch(userfutureNotifier).when(
      data: (data){
        return Scaffold(
          appBar: AppBar(title: Text(data.name)),
          body: Column(
            children: [Text(data.email)],
          ),
        );
      },
      error: (error,stackTrace){
        return Center(
          child:Text(error.toString()),);
      }, 
      loading: (){
        return const Center(
          child:CircularProgressIndicator(),);
      }),
   );
  }
}
