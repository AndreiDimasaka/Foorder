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
        return MaterialApp(
            home: Scaffold(
                body: Dashboard()
            )
        );
    }
}


class Dashboard extends StatefulWidget
{
    const Dashboard({super.key});

    @override
    State<Dashboard> createState() => DashboardState();
}


class DashboardState extends State<Dashboard>
{
    @override
    Widget build(BuildContext context)
    {
        return 
        Padding(
            padding: EdgeInsetsGeometry.all(16),
            child:
            Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                spacing: 10.0,
                children: [
                    Flexible(
                        fit: FlexFit.loose,
                        child:
                        Container(
                            height: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 128, 128, 128)
                            ),
                        )
                    ),
                    Row(
                        children: [
                            Expanded(
                                child:
                                Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color.fromRGBO(0, 255, 255, 100)
                                    ),
                                )
                            )
                        ]
                    ),
                    Flexible(
                        fit: FlexFit.loose,
                        child:
                        GridView.count(
                            primary: false,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 2,
                            children: [


                            ],
                        )
                    )
                ]
            )
        );

    }
}

class PictureButton extends StatelessWidget
{
    final String imagePath;

    const PictureButton({super.key, required this.imagePath});

    @override
    Widget build(BuildContext context)
    {
        return GestureDetector(
            onTap: () => print("Tapped"), //Implement onTap function to transfer to another widget or class
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 5,
                children: [
                    Flexible(
                        fit: FlexFit.loose,
                        child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage(imagePath),
                                    fit: BoxFit.cover
                                )
                            )
                        ),
                    ),
                ]
            )
        );
    }


}
