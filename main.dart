import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: Text(
          'QUICK-TRIP',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.yellow,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi Anoshan,',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text('Good Evening!', style: TextStyle(fontSize: 14)),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryItem(
                    icon: Icons.local_taxi,
                    label: 'Ride',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RideBookingScreen()),
                      );
                    }),
                CategoryItem(
                    icon: Icons.shopping_cart,
                    label: 'Market',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MarketScreen()),
                      );
                    }),
                CategoryItem(
                    icon: Icons.fastfood,
                    label: 'Food',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FoodScreen()),
                      );
                    }),
                CategoryItem(
                    icon: Icons.miscellaneous_services, label: 'Other'),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryItem(
                    icon: Icons.directions_car,
                    label: 'Rental',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RentalScreen()),
                      );
                    }),
                CategoryItem(icon: Icons.bolt, label: 'Flash'),
                CategoryItem(icon: Icons.local_shipping, label: 'Trucks'),
              ],
            ),
          ),
          // Add the image below the Rental, Flash, and Truck options
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              'assets/1.png', // Path to the image
              width: 300, // Adjust the width to minimize the size
              height: 250, // Adjust the height to minimize the size
              fit: BoxFit
                  .contain, // Ensure the image fits within the given dimensions
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0, // Set the default selected index
        onTap: (index) {
          if (index == 3) {
            // Index 3 corresponds to the "Account" button
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AccountScreen()),
            );
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Activity'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notification'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
    );
  }
}

class MarketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Market'),
        backgroundColor: Colors.yellow,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildMarketItem('Cargils Food City', Icons.store),
          _buildMarketItem('Keells', Icons.store),
          _buildMarketItem('Grocery Shop', Icons.shopping_basket),
          _buildMarketItem('Pharmacy', Icons.local_pharmacy),
          _buildMarketItem('Clothings', Icons.shopping_bag),
        ],
      ),
    );
  }

  Widget _buildMarketItem(String title, IconData icon) {
    return Card(
      margin: EdgeInsets.only(bottom: 16.0),
      child: ListTile(
        leading: Icon(icon, size: 40, color: Colors.black),
        title: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        onTap: () {
          // Handle the tap on each market item
        },
      ),
    );
  }
}

class FoodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food'),
        backgroundColor: Colors.yellow,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildFoodItem('Rice Items', Icons.rice_bowl),
          _buildFoodItem('Pizzas', Icons.local_pizza),
          _buildFoodItem('Burgers', Icons.fastfood),
          _buildFoodItem('Koththu Item', Icons.restaurant),
          _buildFoodItem('Meat Item', Icons.set_meal),
          _buildFoodItem('Fruits', Icons.apple),
          _buildFoodItem('Juices', Icons.local_drink),
        ],
      ),
    );
  }

  Widget _buildFoodItem(String title, IconData icon) {
    return Card(
      margin: EdgeInsets.only(bottom: 16.0),
      child: ListTile(
        leading: Icon(icon, size: 40, color: Colors.black),
        title: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        onTap: () {
          // Handle the tap on each food item
        },
      ),
    );
  }
}

class RentalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rentals'),
        backgroundColor: Colors.yellow,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PICKUP Your Location',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'DROP Where are you going?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Enter your destination to view suitable packages for your trip...',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildRentalOption('Bike A 2'),
                _buildRentalOption('Wheel A 3'),
                _buildRentalOption('Car A 4'),
              ],
            ),
            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 20),
            Text(
              'Hours',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Days',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Special',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 20),
            Text(
              'Please Note',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Please note that your card will only be charged on LKR.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRentalOption(String title) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        backgroundColor: Colors.yellow,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[200],
                child: Icon(Icons.person, size: 60, color: Colors.black),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Anoshan Yoganathan',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'anoshan6@gmail.com',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                '+94 77 123 4567',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Handle the "Change as Premium User" button press
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                'Change as Premium User',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RideBookingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('Ride Booking'), backgroundColor: Colors.yellow),
      body: Column(
        children: [
          ListTile(
            title: Text('Pickup: Viharamahadevi Park, Colombo'),
            leading: Icon(Icons.location_on, color: Colors.orange),
          ),
          ListTile(
            title: Text('Drop: Bullers Lane, Colombo'),
            leading: Icon(Icons.location_on, color: Colors.red),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RideOptionCard(
                  title: 'Bike A.2',
                  price: 'LKR 356.10',
                  stars: '3.6',
                ),
                RideOptionCard(
                  title: 'Wheel A.3',
                  price: 'LKR 442.70',
                  stars: '4.4',
                ),
                RideOptionCard(
                  title: 'Car A.3',
                  price: 'LKR 513.85',
                  stars: '5.1',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BookingConfirmationScreen()),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
              child: Text('Book Now', style: TextStyle(color: Colors.black)),
            ),
          ),
        ],
      ),
    );
  }
}

class RideOptionCard extends StatelessWidget {
  final String title;
  final String price;
  final String stars;

  RideOptionCard({
    required this.title,
    required this.price,
    required this.stars,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(price, style: TextStyle(fontSize: 14)),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.amber, size: 16),
                Text(stars, style: TextStyle(fontSize: 14)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BookingConfirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Booking Confirmation'), backgroundColor: Colors.yellow),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Your Booking is Confirmed',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => CallPad(),
                  );
                },
                icon: Icon(Icons.call, color: Colors.white),
                label: Text('Call Your Driver'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              ),
              SizedBox(width: 10),
              IconButton(
                icon: Icon(Icons.message, color: Colors.blue),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: 20),
          Text('Driver: Lokesh kanagaraj', style: TextStyle(fontSize: 18)),
          Text('Vehicle: ABC-1234', style: TextStyle(fontSize: 18)),
          Text('Contact: +94 77 987 7653', style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}

class CallPad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.grey[900],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '+94 77 234',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCallButton('1', context),
                _buildCallButton('2', context),
                _buildCallButton('3', context),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCallButton('4', context),
                _buildCallButton('5', context),
                _buildCallButton('6', context),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCallButton('7', context),
                _buildCallButton('8', context),
                _buildCallButton('9', context),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCallButton('*', context),
                _buildCallButton('0', context),
                _buildCallButton('#', context),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: CircleBorder(),
                padding: EdgeInsets.all(16),
              ),
              child: Icon(Icons.call_end, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCallButton(String text, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle button press
      },
      child: CircleAvatar(
        radius: 24,
        backgroundColor: Colors.grey[800],
        child: Text(
          text,
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  CategoryItem({required this.icon, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.grey[200],
            child: Icon(icon, size: 28, color: Colors.black),
          ),
          SizedBox(height: 5),
          Text(label,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
