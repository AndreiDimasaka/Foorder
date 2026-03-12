import 'dart:ffi' hide Size;

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
    late final double price;
    final bool extraFruits;
    final bool extraChocolates;
    final bool extraNuts;
    final bool extraSprinkles;
    final bool extraFigurine;
    final String imagePath;

    Cake({
        required this.flavor, 
        required this.size,
        required this.price,
        required this.extraFruits, 
        required this.extraChocolates, 
        required this.extraNuts, 
        required this.extraSprinkles, 
        required this.extraFigurine,
        required this.imagePath
    });

    double get totalPrice
    {
        double total = (size == 'Small') ? 25.0 : (size == 'Medium' ? 40.0 : (size == 'Large') ? 65.0 : 0.0);
        if (extraFruits) total += 7.0;
        if (extraChocolates) total += 5.0;
        if (extraNuts) total += 5.0;
        if (extraSprinkles) total += 1.0;
        if (extraFigurine) total += 15.0;
        return total;
    }

    Cake copyWith({
        String? flavor, 
        String? size,
        double? price,
        bool? extraFruits, 
        bool? extraChocolates, 
        bool? extraNuts,
        bool? extraSprinkles,
        bool? extraFigurine,
        String? imagePath
    })
    {
        return Cake(
            flavor: flavor ?? this.flavor,
            size: size ?? this.size,
            price: price ?? this.price,
            extraFruits: extraFruits ?? this.extraFruits,
            extraChocolates: extraChocolates ?? this.extraChocolates,
            extraNuts: extraNuts ?? this.extraNuts,
            extraSprinkles: extraSprinkles ?? this.extraSprinkles,
            extraFigurine: extraFigurine ?? this.extraFigurine,
            imagePath: imagePath ?? this.imagePath
        );
    }
}

class FoodDisplay
{
    final double basePrice;
    final String displayImagePath;
    final String foodName;
    final void Function(BuildContext context)? onTap;

    FoodDisplay({
        required this.basePrice,
        required this.displayImagePath,
        required this.foodName,
        this.onTap
    });

}

final List<FoodDisplay> foodList = [
    FoodDisplay(basePrice: 100.00, displayImagePath: "images/dashboard/cake.jpg", foodName: "Cake",
        onTap: (context) => Navigator.push(context, MaterialPageRoute(builder: (context) => FoodDetails()))),
    FoodDisplay(basePrice: 40.00, displayImagePath: "images/dashboard/pizza.jpg", foodName: "Pizza"),
    FoodDisplay(basePrice: 20.00, displayImagePath: "images/dashboard/burger.jpg", foodName: "Burger"),
    FoodDisplay(basePrice: 30.00, displayImagePath: "images/dashboard/smoothies.jpg", foodName: "Smoothie")
];


class CakeFlavor
{
    final String name;
    final String description;

    CakeFlavor({
        required this.name,
        required this.description,
    });
}

final List<CakeFlavor> cakeFlavor = [
    CakeFlavor(name: "Rich Chocolate", description: "Decadent dark cocoa with silky fudge ganache",),
    CakeFlavor(name: "Classic Vanilla", description: "Madagascar Bourbon vanilla with whipped buttercream", ),
    CakeFlavor(name: "Red Velvet", description: "Velvety smooth with cream cheese frosting", ),
    CakeFlavor(name: "Strawberry", description: "Fresh farm-picked berries with a light chantilly cream", ),
    CakeFlavor(name: "Ube Custard", description: "Authentic Halaya purple yam with a silky leche flan core",)
];



class CakeSize
{
    final String size;
    final String description;
    final double price;

    CakeSize({
        required this.size,
        required this.description,
        required this.price
    });
}

final List<CakeSize> cakeSize = [
    CakeSize(size: "Small", description: "6 inches", price: 25.00),
    CakeSize(size: "Medium", description: "8 inches", price: 40.00),
    CakeSize(size: "Large", description: "10 inches", price: 60.00)
];



class CakeAddOns
{
    final String name;
    final String description;
    final double price;

    CakeAddOns({
        required this.name,
        required this.description,
        required this.price
    });
}

final List<CakeAddOns> cakeAddOns = [
    CakeAddOns(name: "Assorted Fruits", description: "Hand-cut tropical garden favorites", price: 7.00),
    CakeAddOns(name: "Chocolate", description: "Crushed cacao nibs and fudge bits", price: 5.00),
    CakeAddOns(name: "Assorted Nuts", description: "Premium selection of toasted seasonal nuts", price: 5.00),
    CakeAddOns(name: "Sprinkles", description: "Sweet and crispy festive sugar pearls", price: 1.00),
    CakeAddOns(name: "Figurine", description: "Hand crafted edible sugar character", price: 15.00),
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
                child: Dashboard()
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
        final bool isTablet = screenWidth > 600;

        return Scaffold(
            backgroundColor: const Color(0xFFF8F9FA),
            body: CustomScrollView(
                slivers: [
                    SliverAppBar(
                        expandedHeight: screenHeight * 0.25,
                        floating: false,
                        pinned: true,
                        backgroundColor: Colors.white,
                        flexibleSpace: FlexibleSpaceBar(
                            background: Container(
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('images/dashboard/banner.jpg'),
                                        fit: BoxFit.cover,
                                    ),
                                ),
                                child: Container(
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                            colors: [
                                                Colors.black.withOpacity(0.6),
                                                Colors.transparent,
                                            ],
                                        ),
                                    ),
                                ),
                            ),
                        ),
                    ),
                    SliverToBoxAdapter(
                        child: Padding(
                            padding: EdgeInsets.all(screenWidth * 0.04),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                    SearchAnchor(
                                        builder: (BuildContext context, SearchController controller)
                                        {
                                            return SearchBar(
                                                controller: controller,
                                                elevation: const WidgetStatePropertyAll(2.0),
                                                backgroundColor: const WidgetStatePropertyAll(Colors.white),
                                                hintText: "Search",
                                                padding: const WidgetStatePropertyAll<EdgeInsets>(
                                                    EdgeInsets.symmetric(horizontal: 16.0),
                                                ),
                                                onTap: () => controller.openView(),
                                                onChanged: (_) => controller.openView(),
                                                leading: const Icon(Icons.search, color: Colors.blueGrey),
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
                                                            setState(() => controller.closeView(item));
                                                        },
                                                    );
                                                }
                                            );
                                        },
                                    ),
                                    const SizedBox(height: 24),
                                    const Text(
                                        "Menu",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.5,
                                            color: Color(0xFF2D3436),
                                        ),
                                    ),
                                    const SizedBox(height: 16),
                                    GridView.builder(
                                        shrinkWrap: true,
                                        physics: const NeverScrollableScrollPhysics(),
                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: isTablet ? 4 : 2,
                                            crossAxisSpacing: 16,
                                            mainAxisSpacing: 16,
                                            childAspectRatio: 0.75,
                                        ),
                                        itemCount: foodList.length,
                                        itemBuilder: (context, index)
                                        {
                                            final food = foodList[index];
                                            return PictureButton(
                                                imagePath: food.displayImagePath,
                                                price: food.basePrice,
                                                foodName: food.foodName,
                                                onTap: food.onTap != null
                                                    ? () => food.onTap!(context)
                                                    : null,
                                            );
                                        },
                                    ),
                                ],
                            ),
                        ),
                    ),
                ],
            ),
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
        price: 0,
        extraFruits: false,
        extraChocolates: false,
        extraNuts: false,
        extraSprinkles: false,
        extraFigurine: false,
        imagePath: 'images/dashboard/cake.jpg',
    );
    bool heartPressed = false;

    @override
    Widget build(BuildContext context)
    {
        final Size screenSize = MediaQuery.sizeOf(context);
        final double screenWidth = screenSize.width;
        final double screenHeight = screenSize.height;
        final TextScaler scaler = MediaQuery.textScalerOf(context);
        double scaledTextSize = scaler.scale(20);

        return Scaffold(
            backgroundColor: const Color(0xFFF8F9FA),
            body: CustomScrollView(
                slivers: [
                    SliverAppBar(
                        expandedHeight: screenHeight * 0.35,
                        pinned: true,
                        elevation: 0,
                        backgroundColor: Colors.white,
                        leading: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                                backgroundColor: Colors.white70,
                                child: IconButton(
                                    icon: const Icon(Icons.arrow_back, color: Colors.black87),
                                    onPressed: () => Navigator.pop(context),
                                ),
                            ),
                        ),
                        actions: [
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                    backgroundColor: Colors.white70,
                                    child: IconButton(
                                        icon: Icon(
                                            heartPressed ? Icons.favorite : Icons.favorite_border,
                                            color: heartPressed ? Colors.red : Colors.black87,
                                        ),
                                        onPressed: () => setState(() => heartPressed = !heartPressed),
                                    ),
                                ),
                            ),
                        ],
                        flexibleSpace: FlexibleSpaceBar(
                            background: Stack(
                                fit: StackFit.expand,
                                children: [
                                    Image.asset(myCake.imagePath, fit: BoxFit.cover),
                                    const DecoratedBox(
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                                colors: [Colors.black54, Colors.transparent],
                                            ),
                                        ),
                                    ),
                                ],
                            ),
                        ),
                    ),
                    SliverToBoxAdapter(
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(
                                screenWidth * 0.04,
                                screenWidth * 0.04,
                                screenWidth * 0.04,
                                120,
                            ),
                            child: Column(
                                children: [
                                    buildSection(
                                        title: "CAKE FLAVOR",
                                        scaledTextSize: scaledTextSize,
                                        child: RadioGroup(
                                            groupValue: myCake.flavor,
                                            onChanged: (String? value)
                                            {
                                                setState(()
                                                    {
                                                        myCake = myCake.copyWith(
                                                            flavor: value,
                                                            imagePath: getImagePath(value!),
                                                        );
                                                    }
                                                );
                                            },
                                            child: Column(
                                                children: cakeFlavor.map((flavor) => addRadioTile(
                                                        title: flavor.name,
                                                        subtitle: flavor.description,
                                                        value: flavor.name,
                                                        scaledTextSize: scaledTextSize,
                                                        showPrice: false,
                                                    )).toList(),
                                            ),
                                        ),
                                    ),
                                    const SizedBox(height: 20),
                                    buildSection(
                                        title: "CAKE SIZE",
                                        scaledTextSize: scaledTextSize,
                                        child: RadioGroup(
                                            groupValue: myCake.size,
                                            onChanged: (String? value)
                                            {
                                                setState(() => myCake = myCake.copyWith(size: value));
                                            },
                                            child: Column(
                                                children: cakeSize.map((size) => addRadioTile(
                                                        title: size.size,
                                                        subtitle: size.description,
                                                        value: size.size,
                                                        scaledTextSize: scaledTextSize,
                                                        showPrice: true,
                                                        price: size.price,
                                                    )).toList(),
                                            ),
                                        ),
                                    ),
                                    const SizedBox(height: 20),
                                    buildSection(
                                        title: "ADD ONS",
                                        scaledTextSize: scaledTextSize,
                                        child: Column(
                                            children: cakeAddOns.map((addon)
                                                {
                                                    bool currentVal = false;
                                                    if (addon.name == "Assorted Fruits") currentVal = myCake.extraFruits;
                                                    else if (addon.name == "Chocolate") currentVal = myCake.extraChocolates;
                                                    else if (addon.name == "Assorted Nuts") currentVal = myCake.extraNuts;
                                                    else if (addon.name == "Sprinkles") currentVal = myCake.extraSprinkles;
                                                    else if (addon.name == "Figurine") currentVal = myCake.extraFigurine;

                                                    return addCheckTile(
                                                        title: addon.name,
                                                        subtitle: addon.description,
                                                        price: addon.price,
                                                        scaledTextSize: scaledTextSize,
                                                        value: currentVal,
                                                        onChanged: (val)
                                                        {
                                                            setState(()
                                                                {
                                                                    if (addon.name == "Assorted Fruits") myCake = myCake.copyWith(extraFruits: val);
                                                                    else if (addon.name == "Chocolate") myCake = myCake.copyWith(extraChocolates: val);
                                                                    else if (addon.name == "Assorted Nuts") myCake = myCake.copyWith(extraNuts: val);
                                                                    else if (addon.name == "Sprinkles") myCake = myCake.copyWith(extraSprinkles: val);
                                                                    else if (addon.name == "Figurine") myCake = myCake.copyWith(extraFigurine: val);
                                                                }
                                                            );
                                                        },
                                                    );
                                                }
                                            ).toList(),
                                        ),
                                    ),
                                ],
                            ),
                        ),
                    ),
                ],
            ),
            bottomSheet: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 10, offset: const Offset(0, -4))
                    ],
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: SafeArea(
                    child: Row(
                        children: [
                            Expanded(
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        const Text("Total Amount", style: TextStyle(color: Colors.grey, fontSize: 12)),
                                        Text(
                                            '\$${myCake.totalPrice.toStringAsFixed(2)}',
                                            style: TextStyle(
                                                fontSize: scaledTextSize,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black87,
                                            ),
                                        ),
                                    ],
                                ),
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                ),
                                onPressed: ()
                                {
                                    if (myCake.size.isEmpty || myCake.flavor.isEmpty)
                                    {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(content: Text("Select a flavor and size")),
                                        );
                                    }
                                    else
                                    {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerDetails(myCake: myCake)));
                                    }
                                },
                                child: const Text("CHECKOUT"),
                            ),
                        ],
                    ),
                ),
            ),
        );
    }
    Widget buildSection({required String title, required Widget child, required double scaledTextSize})
    {
        return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))
                ],
            ),
            child: Column(
                children: [
                    Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                            color: Colors.grey[50],
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        child: Text(
                            title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                                fontSize: scaledTextSize * 0.7,
                                color: Colors.blueGrey,
                            ),
                        ),
                    ),
                    child,
                ],
            ),
        );
    }

    Widget addCheckTile({
        required String title,
        required String subtitle,
        required double scaledTextSize,
        required ValueChanged<bool?> onChanged,
        required bool value,
        required double price,

    })
    {
        return CheckboxListTile(
            title: Text(
                title,
                style: TextStyle(
                    fontSize: scaledTextSize * 1,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                )

            ),
            subtitle: Text(
                subtitle,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    fontSize: scaledTextSize * 0.8,
                    color: Colors.black87,
                ),

            ),
            secondary: Text(
                '\$${price.toStringAsFixed(0)}',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    fontSize: scaledTextSize * 1,
                    color: Colors.black87,
                ),
            ),
            value: value,
            onChanged: onChanged,
            controlAffinity: ListTileControlAffinity.trailing,
        );
    }

    Widget addRadioTile({
        required String title,
        required String subtitle,
        required String value,
        required double scaledTextSize,
        double? price,
        bool showPrice = false,

    })
    {
        return RadioListTile(
            contentPadding: const EdgeInsets.only(right: 50),
            activeColor: Colors.black,
            title: Text(
                title,
                style: TextStyle(
                    fontSize: scaledTextSize,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                ),
            ),
            subtitle: Text(
                subtitle,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    fontSize: scaledTextSize * 0.8,
                    color: Colors.black87,
                ),

            ),
            secondary: showPrice && price != null
                ? Text(
                    '\$${price.toStringAsFixed(0)}',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        fontSize: scaledTextSize * 1,
                        color: Colors.black87,
                    ),
                )
                : null,
            value: value,
        );
    }

    String getImagePath(String flavor)
    {
        switch (flavor)
        {
            case 'Rich Chocolate':
                return 'images/cakes/chocolatecake.jpg';
            case 'Classic Vanilla':
                return 'images/cakes/vanillacake.jpg';
            case 'Red Velvet':
                return 'images/cakes/redvelvetcake.jpg';
            case 'Strawberry':
                return 'images/cakes/strawberrycake.jpg';
            case 'Ube Custard':
                return 'images/cakes/ubecake.jpg';
            default:
            return 'images/dashboard/cake.jpg';
        }
    }
    void resetCake()
    {
        myCake = myCake.copyWith(
            flavor: "",
            size: "",
            price: 0,
            extraFruits: false,
            extraNuts: false,
            extraChocolates: false,
            extraSprinkles: false,
            extraFigurine: false
        );
    }
}

class CustomerDetails extends StatefulWidget
{

    final Cake myCake;

    const CustomerDetails({super.key, required this.myCake});

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
        final List<String> deliveryOptions =
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
        return Scaffold(
            backgroundColor: const Color(0xFFF8F9FA),
            body: CustomScrollView(
                slivers: [
                    SliverAppBar(
                        pinned: true,
                        backgroundColor: Colors.white,
                        elevation: 0,
                        leading: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(
                                Icons.arrow_back_ios_new, color: Colors.black,
                                size: 20),
                        ),
                        title: Text(
                            "CUSTOMER DETAILS",
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold,
                                fontSize: scaledTextSize * 0.9,
                                color: Colors.black,
                            ),
                        ),
                        actions: [
                            IconButton(
                                onPressed: resetForm,
                                icon: const Icon(
                                    Icons.refresh, color: Colors.black),
                            ),
                        ],
                    ),
                    SliverToBoxAdapter(
                        child: Padding(
                            padding: EdgeInsets.all(screenWidth * 0.05),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                    _buildSectionWrapper(
                                        title: "DELIVERY INFO",
                                        child: Column(
                                            children: [
                                                _textField(_nameController,
                                                    "Customer Name",
                                                    Icons.person_outline, 1),
                                                const SizedBox(height: 16),
                                                _textField(_addressController,
                                                    "Delivery Address",
                                                    Icons.location_on_outlined,
                                                    1),
                                            ],
                                        ),
                                    ),
                                    const SizedBox(height: 24),
                                    _buildSectionWrapper(
                                        title: "GIFT & NOTES",
                                        child: Column(
                                            children: [
                                                _textField(_messageController,
                                                    "Gift Message",
                                                    Icons.card_giftcard, 3),
                                                const SizedBox(height: 16),
                                                _textField(
                                                    _instructionsController,
                                                    "Special Instructions",
                                                    Icons.edit_note, 3),
                                            ],
                                        ),
                                    ),
                                    const SizedBox(height: 24),
                                    _buildSectionWrapper(
                                        title: "PAYMENT METHOD",
                                        child: RadioGroup<String>(
                                            groupValue: _selectedMOP,
                                            onChanged: (value) =>
                                            setState(() =>
                                                _selectedMOP = value),
                                            child: Column(
                                                children: [
                                                    _paymentTile(
                                                        "Cash on Delivery",
                                                        Icons.payments_outlined,
                                                        "COD", scaledTextSize),
                                                    _paymentTile("E-Wallet",
                                                        Icons
                                                            .account_balance_wallet_outlined,
                                                        "Wallet",
                                                        scaledTextSize),
                                                    _paymentTile("Credit Card",
                                                        Icons
                                                            .credit_card_outlined,
                                                        "Card", scaledTextSize),
                                                ],
                                            ),
                                        ),
                                    ),
                                    const SizedBox(height: 24),
                                    _buildSectionWrapper(
                                        title: "SCHEDULE",
                                        child: DropdownButtonFormField<String>(
                                            value: _selectedDelivery,
                                            decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.grey[50],
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius
                                                        .circular(12),
                                                    borderSide: BorderSide(
                                                        color: Colors
                                                            .grey[300]!),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius
                                                        .circular(12),
                                                    borderSide: BorderSide(
                                                        color: Colors
                                                            .grey[300]!),
                                                ),
                                                prefixIcon: const Icon(Icons
                                                        .calendar_today_outlined,
                                                    size: 20),
                                            ),
                                            items: deliveryOptions.map((day) =>
                                                DropdownMenuItem(
                                                    value: day, child: Text(
                                                        day))).toList(),
                                            onChanged: (val) =>
                                            setState(() =>
                                                _selectedDelivery = val),
                                        ),
                                    ),
                                    const SizedBox(height: 40),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.black,
                                            foregroundColor: Colors.white,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 18),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius
                                                    .circular(12)),
                                            elevation: 0,
                                        ),
                                        onPressed: ()
                                        {
                                            if (_nameController.text.isEmpty || _addressController.text.isEmpty || _selectedMOP!.isEmpty)
                                            {
                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                        const SnackBar(content: Text("Fill the fields name/mop/address.")),
                                                    );
                                            }
                                            else 
                                            {
                                                final OrderDetails myOrderDetails = OrderDetails(
                                                    name: _nameController.text,
                                                    message: _messageController
                                                        .text,
                                                    address: _addressController
                                                        .text,
                                                    instructions: _instructionsController
                                                        .text,
                                                    mop: _selectedMOP
                                                        .toString(),
                                                    delivery: _selectedDelivery
                                                        .toString(),
                                                );
                                                showFullOrderPopUp(
                                                    widget.myCake,
                                                    myOrderDetails);
                                            }
                                        },

                                        child: Text(
                                            "FINISH ORDER",
                                            style: TextStyle(
                                                fontSize: scaledTextSize * 0.8,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 2,
                                            ),
                                        ),
                                    ),
                                    const SizedBox(height: 20),
                                ],
                            ),
                        ),
                    ),
                ],
            ),
        );
    }

    Widget _buildSectionWrapper(
    {required String title, required Widget child})
    {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Padding(
                    padding: const EdgeInsets.only(left: 4, bottom: 8),
                    child: Text(
                        title,
                        style: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                            fontSize: 12,
                            color: Colors.blueGrey,
                        ),
                    ),
                ),
                Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.03),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                            ),
                        ],
                    ),
                    child: child,
                ),
            ],
        );
    }

    Widget _paymentTile(String title, IconData icon, String value,
        double textSize)
    {
        return RadioListTile<String>(
            contentPadding: EdgeInsets.zero,
            title: Text(title, style: TextStyle(fontFamily: 'Montserrat',
                    fontSize: textSize * 0.8,
                    fontWeight: FontWeight.w600)),
            secondary: Icon(icon, color: Colors.black87),
            value: value,
            groupValue: _selectedMOP,
            onChanged: (val) => setState(() => _selectedMOP = val),
            activeColor: Colors.black,
        );
    }

    Widget _textField(TextEditingController controller, String label,
        IconData icon, int lines)
    {
        return TextField(
            controller: controller,
            maxLines: lines,
            decoration: InputDecoration(
                labelText: label,
                labelStyle: const TextStyle(
                    fontFamily: 'Montserrat', fontSize: 14),
                prefixIcon: Icon(icon, size: 20),
                filled: true,
                fillColor: Colors.grey[50],
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey[200]!),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey[200]!),
                ),
            ),
        );
    }

    void showFullOrderPopUp(Cake myCake, OrderDetails myOrderDetails)
    {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context)
            {
                return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    title: const Center(child: Text(
                            "Order Success!",
                            style: TextStyle(
                                fontFamily: 'Monserrat',
                                color: Colors.black87
                            ),
                        )),
                    content: SingleChildScrollView(
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                const Text(
                                    "Thank you! We'll start baking your order right away.",
                                    style: TextStyle(
                                        fontFamily: 'Monserrat',
                                        color: Colors.black87
                                    ),
                                ),
                                const Divider(height: 30, thickness: 1),

                                const Text("Customer Details", style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueGrey)),
                                const SizedBox(height: 8),
                                Text("Name: ${myOrderDetails.name}"),
                                Text("Address: ${myOrderDetails.address}"),
                                Text("Mode of payment: ${myOrderDetails.mop}"),
                                Text(
                                    "Delivery day: ${myOrderDetails.delivery}"),

                                const Divider(height: 30),

                                const Text("Order Summary", style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueGrey)),
                                const SizedBox(height: 8),
                                _receiptRow("Flavor", myCake.flavor),
                                _receiptRow("Size", myCake.size),

                                if (myCake.extraFruits) _receiptRow(
                                    "Add-on", "Assorted Fruits"),
                                if (myCake.extraChocolates) _receiptRow(
                                    "Add-on", "Chocolates"),
                                if (myCake.extraNuts) _receiptRow(
                                    "Add-on", "Assorted Nuts"),
                                if (myCake.extraSprinkles) _receiptRow(
                                    "Add-on", "Sprinkles"),
                                if (myCake.extraFigurine) _receiptRow(
                                    "Add-on", "Custom Figurine"),

                                const Divider(height: 30),

                                _receiptRow("Total Amount",
                                    "\$${myCake.totalPrice.toStringAsFixed(2)}",
                                    isTotal: true),
                            ],
                        ),
                    ),
                    actions: [
                        Center(
                            child: ElevatedButton(
                                onPressed: ()
                                {
                                    Navigator.push(context, MaterialPageRoute(
                                            builder: (context) => Dashboard()));
                                },
                                child: const Text("Back to Menu"),
                            ),
                        ),
                    ],
                );
            },
        );
    }

    Widget _receiptRow(String label, String value, {bool isTotal = false})
    {
        return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Text(label, style: TextStyle(
                            fontFamily: 'Monserrat',
                            fontWeight: isTotal ? FontWeight.bold : FontWeight
                                    .normal,
                            color: Colors.black87
                        )),
                    Text(value, style: TextStyle(
                            fontFamily: 'Monserrat',
                            fontWeight: isTotal ? FontWeight.bold : FontWeight
                                    .normal,
                            color: isTotal ? Colors.green : Colors.black87,
                        )),
                ],
            ),
        );
    }

    void resetForm()
    {
        setState(()
            {
                _nameController.clear();
                _messageController.clear();
                _addressController.clear();
                _instructionsController.clear();
                _selectedMOP = 'Cash on Delivery';
                _selectedDelivery = 'Monday';
            }
        );
    }
}

class PictureButton extends StatelessWidget
{
    final String imagePath;
    final double price;
    final String foodName;
    final VoidCallback? onTap;

    const PictureButton({super.key, required this.imagePath, required this.price, required this.foodName, this.onTap});

    @override
    Widget build(BuildContext context)
    {
        final TextScaler scaler = MediaQuery.textScalerOf(context);
        double scaledTextSize = scaler.scale(16);

        return GestureDetector(
            onTap: onTap,
            child: Card(
                elevation: 8,
                shadowColor: Colors.black54,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                        Expanded(
                            child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                                child: Image.asset(
                                    imagePath,
                                    fit: BoxFit.cover,
                                ),
                            ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                    Expanded(
                                        child: Text(
                                            foodName,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1,
                                                fontSize: scaledTextSize,
                                            ),
                                        ),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                        '\$${price.toStringAsFixed(2)}',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Colors.blueGrey[800],
                                            fontWeight: FontWeight.w900,
                                            fontSize: scaledTextSize,
                                        ),
                                    ),
                                ],
                            ),
                        ),
                    ],
                ),
            ),
        );
    }
}
