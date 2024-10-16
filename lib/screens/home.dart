import 'package:flutter/material.dart';
import 'package:start/screens/create.dart';
import 'package:start/theme/theme.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/b2.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Main Content
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),
                // Header
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'SUCASA',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 375, // Set the width of the box
                        height: 250, // Set the height of the box
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(201, 255, 255,
                              255), // Set the background color of the box
                          borderRadius: BorderRadius.circular(
                              10), // Set the border radius of the box
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey, // Set the shadow color
                              blurRadius: 5, // Set the blur radius
                            ),
                          ],
                        ),
                        padding:
                            const EdgeInsets.all(10.0), // Corrected padding
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.to(() => Create());
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: lightColorScheme
                                  .primary, // Set the background color of the button
                              foregroundColor: const Color.fromARGB(255, 254,
                                  254, 254), // Set the text color of the button
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10), // Set the border radius of the button
                              ),
                            ),
                            child: Text('CREATE'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Recommended Section
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Recommended',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text('See All'),
                          ),
                        ],
                      ),
                      // Placeholder for recommended items
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.grey[300],
                              child: Center(child: Text('Item 1')),
                            ),
                          ),
                          SizedBox(width: 10, height: 10),
                          Expanded(
                            child: Container(
                              color: Colors.grey[300],
                              child: Center(child: Text('Item 2')),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Most Used Section
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Most Used',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text('See All'),
                          ),
                        ],
                      ),
                      // Placeholder for most used items
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.grey[300],
                              child: Center(child: Text('Item 1')),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              color: Colors.grey[300],
                              child: Center(child: Text('Item 2')),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              color: Colors.grey[300],
                              child: Center(child: Text('Item 3')),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50), // Add some space at the bottom
              ],
            ),
          ),
          // Bottom Navigation Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset('assets/images/ho.png',
                      width: 30, height: 30),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/images/add.png',
                      width: 30, height: 30),
                  label: 'Create',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/images/pro.png',
                      width: 30, height: 30),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
