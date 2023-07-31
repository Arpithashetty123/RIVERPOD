import 'package:flutter/material.dart';
import 'package:flutter_application_1/user.dart';
import 'package:flutter_application_1/user1.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'home.view.dart';

//provider:
//1.Provider->It is read-only method we cannot update the value
//Creating a function
final nameProvider = Provider((ref) => "name");
//Note:It is declared globally, so we can use anywhere

//2.stateProvider - we can update the value
final nameStateProvider = StateProvider<String?>((ref) => null);

//3.StateNotifier and StateNotifierProvider
final userProvider =
    StateNotifierProvider<PersonNotifier, Person>((ref) => PersonNotifier());

//4.ChangeNotifierProvider
final userChangenotifier =
    ChangeNotifierProvider((ref) => PersonChangeNotifier());

//5. FutureProvider
final userfutureNotifier = FutureProvider((ref) {
  //final userProvider= ref.watch(UserRepositroyProvider);
  return UserRepositroy().userfutureNotifier(); //u can use this directly
});

//6.streamProvider
final userstreamProvider = StreamProvider((ref) async* {
  yield [1, 2, 3, 4, 5, 6, 7, 8, 9];
});

//modifiers
//family
//autodispose
final userfutureNotifier1 =
    FutureProvider.family.autoDispose((ref, String input) {
  // final userProvider= ref.watch(UserRepositroyProvider);
  return UserRepositroy1().userfutureNotifier(input);
});

void main() {
  runApp(const ProviderScope(child: MyApp()));
} //here we have to use Provider

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const Homepage(),
    );
  }
}
