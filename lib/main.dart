import 'package:flutter/material.dart';
class OrderDetails
{
    final String name;
    final String message;
    final String address;
    final String instructions;
    final String mop;
    final String delivery;

    OrderDetails({
        required this.name,
        required this.message,
        required this.address,
        required this.instructions,
        required this.mop,
        required this.delivery
    });

    OrderDetails copyWith({
        String? name,
        String? message,
        String? address,
        String? instructions,
        String? mop,
        String? delivery
    })
    {
        return OrderDetails(
            name: name ?? this.name, 
            message: message ?? this.message, 
            address: address ?? this.address, 
            instructions: instructions ?? this.instructions, 
            mop: mop ?? this.mop, 
            delivery: delivery ?? this.delivery
        );
    }

}


class Cake
{
    final String flavor;
    final String size;
    final bool extraFruits;
    final bool extraChocolates;
    final bool extraNuts;
    final bool extraSprinkles;
    final bool extraFigurine;

    Cake({
        required this.flavor, 
        required this.size, 
        required this.extraFruits, 
        required this.extraChocolates, 
        required this.extraNuts, 
        required this.extraSprinkles, 
        required this.extraFigurine
    });

    Cake copyWith({
        String? flavor, 
        String? size, 
        bool? extraFruits, 
        bool? extraChocolates, 
        bool? extraNuts,
        bool? extraSprinkles,
        bool? extraFigurine,
    })
    {
        return Cake(
            flavor: flavor ?? this.flavor,
            size: size ?? this.size,
            extraFruits: extraFruits ?? this.extraFruits,
            extraChocolates: extraChocolates ?? this.extraChocolates,
            extraNuts: extraNuts ?? this.extraNuts,
            extraSprinkles: extraSprinkles ?? this.extraSprinkles,
            extraFigurine: extraFigurine ?? this.extraFigurine
        );
    }
}



void main()
{
    runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
    const MyApp({super.key});

    @override
    Widget build(BuildContext context)
    {
        return MaterialApp();
    }
}





class Dashboard extends StatefulWidget
{

}
