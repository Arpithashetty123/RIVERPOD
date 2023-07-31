// ignore: depend_on_referenced_packages
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Person {
  final String name;
  final int age;

  const Person({required this.name, required this.age});

  Person copyWith({
    String? name,
    int? age,
  }) {
    return Person(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'age': age});

    return result;
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      name: map['name'] ?? '',
      age: map['age']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Person.fromJson(String source) => Person.fromMap(json.decode(source));

  @override
  String toString() => 'Person(name: $name, age: $age)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Person && other.name == name && other.age == age;
  }
  @override
  int get hashCode => name.hashCode ^ age.hashCode;
}

//this is the userModel
//It contains all the methods to update the name and age of persons
class PersonNotifier extends StateNotifier<Person> {
  PersonNotifier() : super(const Person(name: "name", age: 10));
  // {
  //  updateName("Hello");  //we can update the constructor
  // }
  void updateName(String n) {
    state = state.copyWith(
        name:n); //it means it will copy all the proprerties as it is but changes name
  }
  void updateAge(int a) {
    state = state.copyWith(age: a);
  }
}//statenotifier will give access to the state which can be used to update the data


class PersonChangeNotifier extends ChangeNotifier{
  Person person=const Person(name: "name", age: 0);
  void updateName(String n){
    person=person.copyWith(name: n);
  }
  void updateAge(int a){
    person =person.copyWith(age: a);
  }
}
