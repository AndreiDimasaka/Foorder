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


class FoodDisplay
{
    final double basePrice;
    final String displayImagePath;
    final String foodName;

    FoodDisplay({
        required this.basePrice,
        required this.displayImagePath,
        required this.foodName
    });


}

final List<FoodDisplay> foodList = [
    FoodDisplay(basePrice: 20.00, displayImagePath: "images/dashboard/cake.jpg", foodName: "Cake"),
    FoodDisplay(basePrice: 10.00, displayImagePath: "images/dashboard/pizza.jpg", foodName: "Pizza"),
    FoodDisplay(basePrice: 15.00, displayImagePath: "images/dashboard/burger.jpg", foodName: "Burger"),
    FoodDisplay(basePrice: 17.00, displayImagePath: "images/dashboard/smoothies.jpg", foodName: "Smoothie")
];




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
            home: Material(
                color: Colors.white,
                child: Dashboard(),
            ),
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
        final Size screenSize = MediaQuery.sizeOf(context);
        final double screenWidth = screenSize.width;
        final double screenHeight = screenSize.height;
        bool isTablet = screenWidth > 600;

        return
        SingleChildScrollView(
            child:
            Padding(
                padding: EdgeInsetsGeometry.all(screenWidth * 0.02),
                child:
                Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: 20.0,
                    children: [
                        Container(
                            height: screenHeight * 0.25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage('images/dashboard/banner.jpg'),
                                    fit: BoxFit.fill,
                                    scale: 0.8
                                )
                            ),
                        ),

                        Row(
                            children: [
                                Expanded(
                                    child:
                                    SearchAnchor(
                                        builder: (BuildContext context, SearchController controller) {
                                            return SearchBar(
                                                controller: controller,
                                                padding: const WidgetStatePropertyAll<EdgeInsets>(
                                                    EdgeInsets.symmetric(horizontal: 16.0)),
                                                onTap: () {
                                                    controller.openView();
                                                },
                                                onChanged: (_) {
                                                    controller.openView();
                                                },
                                                leading: const Icon(Icons.search),
                                            );
                                        },
                                        suggestionsBuilder: (BuildContext context, SearchController controller) {
                                            return List<ListTile>.generate(5, (int index) {
                                                final String item = 'Suggestion $index';
                                                return ListTile(
                                                    title: Text(item),
                                                    onTap: () {
                                                        setState(() {
                                                            controller.closeView(item);
                                                        });
                                                    },
                                                );
                                            });
                                        },
                                    )
                                )
                            ]
                        ),
                        GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            primary: false,
                            crossAxisSpacing: screenWidth * 0.02,
                            mainAxisSpacing: screenHeight * 0.02,
                            crossAxisCount: isTablet ? 4 : 2,
                            childAspectRatio: 0.8,
                            children: [
                                for (var item in foodList)
                                    PictureButton(imagePath: item.displayImagePath, price: item.basePrice, foodName: item.foodName),
                            ]
                        )
                    ]
                )
            )
        );
    }
}

class PictureButton extends StatelessWidget
{
    final String imagePath;
    final double price;
    final String foodName;

    const PictureButton({super.key, required this.imagePath, required this.price, required this.foodName});

    @override
    Widget build(BuildContext context)
    {

        final TextScaler scaler = MediaQuery.textScalerOf(context);
        double scaledTextSize = scaler.scale(20);
        return GestureDetector(
            onTap: () => print("Tapped"), //Implement onTap function to transfer to another widget or class
            child: Column(
                children: [
                    Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage(imagePath)
                                )
                            )
                        ),
                    ),
                    Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                            Expanded(
                                child:
                                Text(
                                    foodName,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        letterSpacing: 2,
                                        fontSize: scaledTextSize
                                    ),
                                )
                            ),
                            Expanded(
                                child: 
                                Text(
                                    '\u0024${price.toString()}',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        letterSpacing: 2,
                                        fontSize: scaledTextSize
                                    ),
                                )
                            )
                        ]
                    )
                ]
            )
        );
    }


}
