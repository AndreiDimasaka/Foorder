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
                child: CustomerDetails(),
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
            child: Padding(
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
                                        builder: (BuildContext context, SearchController controller)
                                        {
                                            return SearchBar(
                                                controller: controller,
                                                padding: const WidgetStatePropertyAll<EdgeInsets>(
                                                    EdgeInsets.symmetric(horizontal: 16.0)),
                                                onTap: ()
                                                {
                                                    controller.openView();
                                                },
                                                onChanged: (_)
                                                {
                                                    controller.openView();
                                                },
                                                leading: const Icon(Icons.search),
                                            );
                                        },
                                        suggestionsBuilder: (BuildContext context, SearchController controller)
                                        {
                                            return List<ListTile>.generate(5, (int index)
                                                {
                                                    final String item = 'Suggestion $index';
                                                    return ListTile(
                                                        title: Text(item),
                                                        onTap: ()
                                                        {
                                                            setState(()
                                                                {
                                                                    controller.closeView(item);
                                                                }
                                                            );
                                                        },
                                                    );
                                                }
                                            );
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

class FoodDetails extends StatefulWidget
{
    const FoodDetails({super.key});

    @override
    State<FoodDetails> createState() => FoodDetailsState();

}

class FoodDetailsState extends State<FoodDetails>
{
    Cake myCake = Cake(
        flavor: "",
        size: "",
        extraFruits: false,
        extraChocolates: false,
        extraNuts: false,
        extraSprinkles: false,
        extraFigurine: false,
    );

    @override
    Widget build(BuildContext context)
    {
        String? selectedFlavor = "Classic Vanilla";
        final Size screenSize = MediaQuery.sizeOf(context);
        final double screenWidth = screenSize.width;
        final double screenHeight = screenSize.height;
        final TextScaler scaler = MediaQuery.textScalerOf(context);
        double scaledTextSize = scaler.scale(20);

        return SingleChildScrollView(
            child: Padding(
                padding: EdgeInsetsGeometry.all(screenWidth * 0.04),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: 40,
                    children: 
                    [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                                IconButton(
                                    onPressed: ()
                                    {
                                    },
                                    icon: Icon(Icons.arrow_back),
                                ),
                                Text(
                                    "Order Details",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        letterSpacing: 3,
                                        fontWeight: FontWeight.w600,
                                        fontSize: scaledTextSize * 1.5,
                                        color: Colors.black87,
                                    ),
                                ),
                                IconButton(
                                    onPressed: ()
                                    {
                                    },
                                    icon: Icon(Icons.favorite)
                                )
                            ],
                        ),
                        Container(
                            height: screenHeight * 0.30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
                                boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 10,
                                        offset: const Offset(0, 5),
                                    ),
                                ],
                                image: DecorationImage(
                                    image: AssetImage('images/dashboard/cake.jpg'),
                                    fit: BoxFit.fill,
                                ),
                            ),
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                )
                            )
                        ),
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: const Border(
                                    left: BorderSide(color: Colors.black, width: 1.0),
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                ),
                                boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 15,
                                        offset: const Offset(0, 8),
                                    )
                                ],
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                    Container(
                                        padding: const EdgeInsets.symmetric(vertical: 12),
                                        decoration: BoxDecoration(
                                            color: Colors.grey[50],
                                            border: Border(
                                                bottom: BorderSide(color: Colors.grey[200]!, width: 1),
                                            ),
                                        ),
                                        child: Text(
                                            "CAKE FLAVOR", 
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                letterSpacing: 3,
                                                fontWeight: FontWeight.w600,
                                                fontSize: scaledTextSize * 1.2,
                                                color: Colors.black87,
                                            ),
                                        ),
                                    ),
                                    RadioListTile<String>(
                                        title: Text(
                                            "Rich Chocolate",
                                            style: TextStyle(
                                                fontSize: scaledTextSize * 1,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black87,
                                            ),
                                        ),
                                        subtitle: Text(
                                            "Decadent dark cocoa with silky fudge ganache",
                                            style: TextStyle(
                                                fontSize: scaledTextSize * 0.8,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black87,
                                            ),
                                        ),
                                        value: "Chocolate",
                                        groupValue: selectedFlavor,
                                        activeColor: Colors.black,
                                        onChanged: (String? value)
                                        {
                                            setState(()
                                                {
                                                    selectedFlavor = value;
                                                }
                                            );
                                        },
                                    ),
                                    RadioListTile<String>(
                                        title: Text(
                                            "Classic Vanilla",
                                            style: TextStyle(
                                                fontSize: scaledTextSize * 1,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black87,
                                            ),
                                        ),
                                        subtitle: Text(
                                            "Madagascar Bourbon vanilla with whipped buttercream",
                                            style: TextStyle(
                                                fontSize: scaledTextSize * 0.8,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black87,
                                            ),
                                        ),
                                        value: "Chocolate",
                                        groupValue: selectedFlavor,
                                        activeColor: Colors.black,
                                        onChanged: (String? value)
                                        {
                                            setState(()
                                                {
                                                    selectedFlavor = value;
                                                }
                                            );
                                        },
                                    ),
                                    RadioListTile<String>(
                                        title: Text(
                                            "Red Velvet",
                                            style: TextStyle(
                                                fontSize: scaledTextSize * 1,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black87,
                                            ),
                                        ),
                                        subtitle: Text(
                                            "Velvety smooth with cream cheese frosting",
                                            style: TextStyle(
                                                fontSize: scaledTextSize * 0.8,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black87,
                                            ),
                                        ),
                                        value: "Chocolate",
                                        groupValue: selectedFlavor,
                                        activeColor: Colors.black,
                                        onChanged: (String? value)
                                        {
                                            setState(()
                                                {
                                                    selectedFlavor = value;
                                                }
                                            );
                                        },
                                    ),
                                    RadioListTile<String>(
                                        title: Text(
                                            "Strawberry",
                                            style: TextStyle(
                                                fontSize: scaledTextSize * 1,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black87,
                                            ),
                                        ),
                                        subtitle: Text(
                                            "Fresh farm-picked berries with a light chantilly cream",
                                            style: TextStyle(
                                                fontSize: scaledTextSize * 0.8,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black87,
                                            ),
                                        ),
                                        value: "Chocolate",
                                        groupValue: selectedFlavor,
                                        activeColor: Colors.black,
                                        onChanged: (String? value)
                                        {
                                            setState(()
                                                {
                                                    selectedFlavor = value;
                                                }
                                            );
                                        },
                                    ),
                                    RadioListTile<String>(
                                        title: Text("Ube Custard",
                                            style: TextStyle(
                                                fontSize: scaledTextSize * 1,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black87,
                                            ),
                                        ),
                                        subtitle: Text(
                                            "Authentic Halaya purple yam with a silky leche flan core",
                                            style: TextStyle(
                                                fontSize: scaledTextSize * 0.8,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black87,
                                            ),
                                        ),
                                        value: "Chocolate",
                                        groupValue: selectedFlavor,
                                        activeColor: Colors.black,
                                        onChanged: (String? value)
                                        {
                                            setState(()
                                                {
                                                    selectedFlavor = value;
                                                }
                                            );
                                        },
                                    ),
                                ]
                            )
                        ),
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: const Border(
                                    left: BorderSide(color: Colors.black, width: 1.0),
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                ),
                                boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 15,
                                        offset: const Offset(0, 8),
                                    )
                                ],
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                    Container(
                                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                                        decoration: BoxDecoration(
                                            color: Colors.grey[50],
                                            border: Border(
                                                bottom: BorderSide(color: Colors.grey[200]!, width: 1),
                                            ),
                                        ),
                                        child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                                Text(
                                                    "CAKE SIZE",
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        fontFamily: 'Montserrat',
                                                        letterSpacing: 3,
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: scaledTextSize * 1.2,
                                                        color: Colors.black87,
                                                    ),
                                                ),
                                                Text(
                                                    "PRICE",
                                                    textAlign: TextAlign.end,
                                                    style: TextStyle(
                                                        fontFamily: 'Montserrat',
                                                        letterSpacing: 3,
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: scaledTextSize * 1.2,
                                                        color: Colors.black87,
                                                    ),
                                                ),
                                            ],
                                        )
                                    ),
                                    RadioListTile<String>(
                                        contentPadding: const EdgeInsets.only(right: 50),
                                        title: Text(
                                            "Small",
                                            style: TextStyle(
                                                fontSize: scaledTextSize * 1,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black87,
                                            )
                                        ),
                                        subtitle: Text(
                                            "6 inches",
                                            style: TextStyle(
                                                fontSize: scaledTextSize * 0.8,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black87,
                                            ),

                                        ),
                                        secondary: Text(
                                            r"$25",
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black87,
                                            ),),
                                        value: "Chocolate",
                                        groupValue: selectedFlavor,
                                        activeColor: Colors.black,
                                        onChanged: (String? value)
                                        {
                                            setState(()
                                                {
                                                    selectedFlavor = value;
                                                }
                                            );
                                        },
                                    ),
                                    RadioListTile<String>(
                                        contentPadding: const EdgeInsets.only(right: 50),
                                        title: Text(
                                            "Medium",
                                            style: TextStyle(
                                                fontSize: scaledTextSize * 1,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black87,
                                            )
                                        ),
                                        subtitle: Text(
                                            "8 inches",
                                            style: TextStyle(
                                                fontSize: scaledTextSize * 0.8,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black87,
                                            ),

                                        ),
                                        secondary: Text(
                                            r"$40",
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black87,
                                            ),),
                                        value: "Chocolate",
                                        groupValue: selectedFlavor,
                                        activeColor: Colors.black,
                                        onChanged: (String? value)
                                        {
                                            setState(()
                                                {
                                                    selectedFlavor = value;
                                                }
                                            );
                                        },
                                    ),
                                    RadioListTile<String>(
                                        contentPadding: const EdgeInsets.only(right: 50),
                                        title: Text(
                                            "Large",
                                            style: TextStyle(
                                                fontSize: scaledTextSize * 1,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black87,
                                            )
                                        ),
                                        subtitle: Text(
                                            "10 inches",
                                            style: TextStyle(
                                                fontSize: scaledTextSize * 0.8,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black87,
                                            ),

                                        ),
                                        secondary: Text(
                                            r"$60",
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black87,
                                            ),),
                                        value: "Chocolate",
                                        groupValue: selectedFlavor,
                                        activeColor: Colors.black,
                                        onChanged: (String? value)
                                        {
                                            setState(()
                                                {
                                                    selectedFlavor = value;
                                                }
                                            );
                                        },
                                    ),
                                ]
                            )
                        ),
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: const Border(
                                    left: BorderSide(color: Colors.black, width: 1.0),
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                ),
                                boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 15,
                                        offset: const Offset(0, 8),
                                    )
                                ],
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                    Container(
                                        padding: const EdgeInsets.symmetric(vertical: 12),
                                        decoration: BoxDecoration(
                                            color: Colors.grey[50],
                                            border: Border(
                                                bottom: BorderSide(color: Colors.grey[200]!, width: 1),
                                            ),
                                        ),
                                        child: Text(
                                            "ADD ONS",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                letterSpacing: 3,
                                                fontWeight: FontWeight.w600,
                                                fontSize: scaledTextSize * 1.2,
                                                color: Colors.black87,
                                            ),
                                        ),
                                    ),
                                    CheckboxListTile(
                                        title: Text(
                                            "Assorted Fruits",
                                            style: TextStyle(
                                                fontSize: scaledTextSize * 1,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black87,
                                            )

                                        ),
                                        subtitle: Text(
                                            "Hand-cut tropical and garden favorites",
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w500,
                                                fontSize: scaledTextSize * 0.8,
                                                color: Colors.black87,
                                            ),

                                        ),
                                        secondary: Text(
                                            r"$7",
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w500,
                                                fontSize: scaledTextSize * 0.8,
                                                color: Colors.black87,
                                            ),

                                        ),
                                        value: myCake.extraFruits,
                                        onChanged: (bool? value)
                                        {
                                            setState(()
                                                {
                                                    myCake = myCake.copyWith(extraFruits: value);
                                                }
                                            );
                                        },
                                        controlAffinity: ListTileControlAffinity.trailing,
                                    ),
                                    CheckboxListTile(
                                        title: Text(
                                            "Chocolate",
                                            style: TextStyle(
                                                fontSize: scaledTextSize * 1,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black87,
                                            )

                                        ),
                                        subtitle: Text(
                                            "Crushed cacao nibs and fudge bits",
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w500,
                                                fontSize: scaledTextSize * 0.8,
                                                color: Colors.black87,
                                            ),

                                        ),
                                        secondary: Text(
                                            r"$5",
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w500,
                                                fontSize: scaledTextSize * 0.8,
                                                color: Colors.black87,
                                            ),

                                        ),
                                        value: myCake.extraChocolates,
                                        onChanged: (bool? value)
                                        {
                                            setState(()
                                                {
                                                    myCake = myCake.copyWith(extraChocolates: value);
                                                }
                                            );
                                        },
                                        controlAffinity: ListTileControlAffinity.trailing,
                                    ),
                                    CheckboxListTile(
                                        title: Text(
                                            "Assorted Nuts",
                                            style: TextStyle(
                                                fontSize: scaledTextSize * 1,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black87,
                                            )

                                        ),
                                        subtitle: Text(
                                            "Premium selection of toasted seasonal nuts",
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w500,
                                                fontSize: scaledTextSize * 0.8,
                                                color: Colors.black87,
                                            ),
                                        ),
                                        secondary: Text(
                                            r"$5",
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w500,
                                                fontSize: scaledTextSize * 0.8,
                                                color: Colors.black87,
                                            ),

                                        ),
                                        value: myCake.extraNuts,
                                        onChanged: (bool? value)
                                        {
                                            setState(()
                                                {
                                                    myCake = myCake.copyWith(extraNuts: value);
                                                }
                                            );
                                        },
                                        controlAffinity: ListTileControlAffinity.trailing,
                                    ),
                                    CheckboxListTile(
                                        title: Text(
                                            "Sprinkles",
                                            style: TextStyle(
                                                fontSize: scaledTextSize * 1,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black87,
                                            )

                                        ),
                                        subtitle: Text(
                                            "Sweet and crispy festive sugar pearls",
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w500,
                                                fontSize: scaledTextSize * 0.8,
                                                color: Colors.black87,
                                            ),

                                        ),
                                        secondary: Text(
                                            r"$1",
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w500,
                                                fontSize: scaledTextSize * 0.8,
                                                color: Colors.black87,
                                            ),

                                        ),
                                        value: myCake.extraSprinkles,
                                        onChanged: (bool? value)
                                        {
                                            setState(()
                                                {
                                                    myCake = myCake.copyWith(extraSprinkles: value);
                                                }
                                            );
                                        },
                                        controlAffinity: ListTileControlAffinity.trailing,
                                    ),
                                    CheckboxListTile(
                                        title: Text(
                                            "Figurine",
                                            style: TextStyle(
                                                fontSize: scaledTextSize * 1,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black87,
                                            )

                                        ),
                                        subtitle: Text(
                                            "Hand crafted edible sugar character",
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w500,
                                                fontSize: scaledTextSize * 0.8,
                                                color: Colors.black87,
                                            ),

                                        ),
                                        secondary: Text(
                                            r"$15",
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w500,
                                                fontSize: scaledTextSize * 0.8,
                                                color: Colors.black87,
                                            ),

                                        ),
                                        value: myCake.extraFigurine,
                                        onChanged: (bool? value)
                                        {
                                            setState(()
                                                {
                                                    myCake = myCake.copyWith(extraFigurine: value);
                                                }
                                            );
                                        },
                                        controlAffinity: ListTileControlAffinity.trailing,
                                    ),
                                ]
                            )
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 10,
                            children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                        ),
                                        elevation: 2,
                                    ),
                                    onPressed: ()
                                    {
                                        print("Ordering: ${myCake.size} ${myCake.flavor} cake");
                                    },
                                    child: Text(
                                        "CONFIRM ORDER",
                                        style: TextStyle(
                                            fontSize: scaledTextSize * 0.8,
                                            fontFamily: 'Monserrat',
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1.2,
                                        ),
                                    ),
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                        ),
                                        elevation: 2,
                                    ),
                                    onPressed: ()
                                    {
                                        print("Ordering: ${myCake.size} ${myCake.flavor} cake");
                                    },
                                    child: Text(
                                        "CANCEL",
                                        style: TextStyle(
                                            fontSize: scaledTextSize * 0.8,
                                            fontFamily: 'Monserrat',
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1.2,
                                        ),
                                    ),
                                ),
                            ]
                        )
                    ]
                )
            ),
        );
    }
}

class CustomerDetails extends StatefulWidget
{
    const CustomerDetails({super.key});

    @override
    State<CustomerDetails> createState() => CustomerDetailsState();

}

class CustomerDetailsState extends State<CustomerDetails>
{
    late TextEditingController _nameController;
    late TextEditingController _messageController;
    late TextEditingController _addressController;
    late TextEditingController _instructionsController;
    String? _selectedMOP = '';
    String? _selectedDelivery = 'Monday';

    @override
    void initState() 
    {
        super.initState();
        _nameController = TextEditingController();
        _messageController = TextEditingController();
        _addressController = TextEditingController();
        _instructionsController = TextEditingController();
    }

    @override
    void dispose() 
    {
        _nameController.dispose();
        _messageController.dispose();
        _addressController.dispose();
        _instructionsController.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context)
    {
        final List<String> _deliveryOptions =
            [
                'Monday',
                'Tuesday',
                'Wednesday',
                'Thursday',
                'Friday',
                'Saturday',
                'Sunday'
            ];
        final Size screenSize = MediaQuery.sizeOf(context);
        final double screenWidth = screenSize.width;
        final double screenHeight = screenSize.height;
        final TextScaler scaler = MediaQuery.textScalerOf(context);
        double scaledTextSize = scaler.scale(20);
        return Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            IconButton(
                                onPressed: ()
                                {
                                },
                                icon: Icon(
                                    Icons.arrow_back,
                                    size: screenWidth * 0.04,
                                    color: Colors.black87,
                                ),
                            ),
                            Text(
                                "Customer Details",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 3,
                                    fontWeight: FontWeight.w600,
                                    fontSize: scaledTextSize * 1.5,
                                    color: Colors.black87,
                                ),
                            ),
                            IconButton(
                                onPressed: ()
                                {
                                },
                                icon: Icon(
                                    Icons.refresh,
                                    size: screenWidth * 0.04,
                                    color: Colors.black87,
                                ),
                            )
                        ],
                    ),
                    _textField(_nameController, "Customer Name", Icons.person),
                    _textField(_addressController, "Delivery Address", Icons.location_on),
                    _textField(_messageController, "Gift Message", Icons.card_giftcard),
                    _textField(_instructionsController, "Special Instructions", Icons.note_add),

                    Text(
                        "MODE OF PAYMENT",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            letterSpacing: 3,
                            fontWeight: FontWeight.w600,
                            fontSize: scaledTextSize * 1.2,
                            color: Colors.black87,
                        ),
                    ),
                    RadioGroup<String>(
                        groupValue: _selectedMOP,
                        onChanged: (String? value)
                        {
                            setState(()
                                {
                                    _selectedMOP = value;
                                }
                            );
                        }, child: Column(
                            children: [
                                RadioListTile<String>(
                                    title: Text(
                                        "Cash on Delivery",
                                        style: TextStyle(
                                            fontSize: scaledTextSize * 1,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black87,
                                        ),
                                    ),
                                    secondary: Icon(
                                        Icons.attach_money_rounded,
                                        size: screenWidth * 0.04,
                                    ),
                                    value: "COD",
                                    activeColor: Colors.black,
                                ),
                                RadioListTile<String>(
                                    title: Text(
                                        "E-Wallet",
                                        style: TextStyle(
                                            fontSize: scaledTextSize * 1,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black87,
                                        ),
                                    ),
                                    secondary: Icon(
                                        Icons.account_balance_wallet_rounded,
                                        size: screenWidth * 0.04,
                                    ),
                                    value: "Wallet",
                                    activeColor: Colors.black,
                                ),
                                RadioListTile<String>(
                                    title: Text(
                                        "Credit / Debit Card",
                                        style: TextStyle(
                                            fontSize: scaledTextSize * 1,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black87,
                                        ),
                                    ),
                                    secondary: Icon(
                                        Icons.credit_card_rounded,
                                        size: screenWidth * 0.04,
                                    ),
                                    value: "Card",
                                    activeColor: Colors.black,
                                ),
                            ]
                        )
                    ),

                    DropdownButtonFormField<String>(
                        initialValue: _selectedDelivery,
                        decoration: InputDecoration(
                            labelText: "DELIVERY OPTIONS",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: Icon(Icons.calendar_month_rounded),
                        ),
                        items: _deliveryOptions.map((String category)
                            {
                                return DropdownMenuItem(
                                    value: category,
                                    child: Text(category),
                                );
                            }
                        ).toList(),
                        onChanged: (newValue)
                        {
                            setState(()
                                {
                                    _selectedDelivery = newValue;
                                }
                            );
                        },
                    )
                ],
            ),

        );
    }

    Widget _textField(TextEditingController controller, String label, IconData icon) 
    {
        return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextField(
                controller: controller,
                decoration: InputDecoration(
                    labelText: label,
                    prefixIcon: Icon(icon),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                ),
            ),
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
