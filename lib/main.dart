import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 223, 223),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 17.0),
          child: Column(
            children: [
              Row(
                // App bar section with menu, title, and user profile elements
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    // Left section of the app bar with menu icon and check-in
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          print('Menu Icon');
                        },
                      ),
                      const SizedBox(width: 16.0),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Check in',
                            style: TextStyle(
                              fontSize: 13.0,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            '09:00 AM',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    // Right section of the app bar with search icon and user profile picture
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          print('Search Icon');
                        },
                      ),
                      const SizedBox(width: 16.0),
                      const CircleAvatar(
                        radius: 20.0,
                        backgroundImage: NetworkImage(
                          'https://media-exp1.licdn.com/dms/image/C5603AQFLKmsiBSt85Q/profile-displayphoto-shrink_800_800/0/1668066423433?e=2147483647&v=beta&t=Q3JmcGyZiZ1d6kJA9NeKYY1SaRV_AY5CkPXjs6X4w-I',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  // for Text and  image
                  margin: EdgeInsets.only(top: 4.0, bottom: 10.0),
                  padding: const EdgeInsets.symmetric(vertical: 27.0),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color.fromARGB(255, 194, 194, 194),
                        width: 1.0,
                      ),
                    ),
                    child: const Column(
                      children: [
                        // Header for attendance log section with month and title
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Attendance Log',
                              style: TextStyle(
                                color: Color.fromARGB(255, 30, 67, 230),
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Apr 2024',
                              style: TextStyle(
                                color: Color.fromARGB(255, 30, 67, 230),
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        // Placeholder image and message for no records found
                        Column(
                          children: [
                            SizedBox(height: 30),
                            Image(image: AssetImage('assets/Not.png')),
                            Text(
                              'No Records Found!',
                              style: TextStyle(
                                color: Color.fromARGB(255, 66, 66, 66),
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
       // Bottom navigation bar
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.now_widgets),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.checklist),
                label: 'Request',
              ),
              BottomNavigationBarItem(
                icon: CircleAvatar(
                  radius: 22.0,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.add, color: Colors.white),
                ),
                label: 'Add',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.percent_outlined),
                label: 'Attendance',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'Notification',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
