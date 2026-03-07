import 'package:flutter/material.dart';



class OrderDetails{
  final String name;
  final String message;
  final String address;
  final String instructions;
  final String mop;
  final string delivery;





}


class Cake{
  final String flavor;
  final String size;
  final bool extraFruits;
  final bool extraChocolates;
  final bool extraNuts;
  final bool extraSprinkles;
  final bool extraFigurine;

  Cake({required this.flavor, required this.size, required this.extraFruits, required this.extraChocolates, required this.extraNuts, required this.extraSprinkles, required this.extraFigurine});

  Cake copyWith({String? flavor, String? size}){
    return Cake(
      flavor: flavor ?? this.flavor,
      size: size ?? this.size
    );
  }
}



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}





class Dashboard extends StatefulWidget{

}
