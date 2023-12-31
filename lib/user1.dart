import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart'as http;
class User {
  final String name;
  final String email;

  User({
    required this.name,
    required this.email,
  });

  User copyWith({
    String? name,
    String? email,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'email': email});

    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() => 'User(name: $name, email: $email)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User && other.name == name && other.email == email;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode;
}
final userRepositroyProvider=Provider((ref) => UserRepositroy1());
//futureProvider
class UserRepositroy {
   Future<User> userfutureNotifier(){
   var url="https://jsonplaceholder.typicode.com/users/1";
  return http.get(Uri.parse(url)).then((value) => User.fromJson(value.body));
   }
}
//family
class UserRepositroy1 {
   Future<User> userfutureNotifier(String input){
   var url="https://jsonplaceholder.typicode.com/users/1$input";
  return http.get(Uri.parse(url)).then((value) => User.fromJson(value.body));
   }
}
