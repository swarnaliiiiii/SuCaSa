import 'package:flutter/material.dart';
import 'package:start/screens/camera.dart';
import '../theme/theme.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Create(),
    );
  }
}

class Create extends StatefulWidget {
  @override
  _RoomSelectionPageState createState() => _RoomSelectionPageState();
}

class _RoomSelectionPageState extends State<Create> {
  String? selectedRoom;
  String? selectedStyle;
  RangeValues _budgetRange =
      RangeValues(0, 100000); // Use RangeValues for a range slider

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/b2.png', // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    // Handle back navigation
                    Navigator.pop(context);
                  },
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SUCASA',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    // Select Room Section
                    Text(
                      'Select Room',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      children: [
                        _buildRoomOption('Bedroom'),
                        _buildRoomOption('Office cabin'),
                        _buildRoomOption('Hall room'),
                        _buildRoomOption('Kitchen'),
                        _buildRoomOption('Dining'),
                        _buildRoomOption('Kid\'s room'),
                      ],
                    ),
                    SizedBox(height: 20),
                    // Select Style Section
                    Text(
                      'Select Style',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      children: [
                        _buildStyleOption('Modern'),
                        _buildStyleOption('Classic'),
                        _buildStyleOption('Minimalist'),
                      ],
                    ),
                    SizedBox(height: 20),
                    // Budget Slider
                    Text(
                      'Budget',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    RangeSlider(
                      min: 0,
                      max: 100000,
                      divisions: 100,
                      values: _budgetRange,
                      onChanged: (RangeValues values) {
                        setState(() {
                          _budgetRange = values;
                        });
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Min: ₹${_budgetRange.start.toInt()}'),
                        Text('Max: ₹${_budgetRange.end.toInt()}'),
                      ],
                    ),
                    SizedBox(height: 40),
                    // Next Button
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(() => CameraPage());
                        },
                        child: Text('NEXT'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: lightColorScheme.primary,
                          padding: EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRoomOption(String room) {
    return ChoiceChip(
      label: Text(room),
      selected: selectedRoom == room,
      onSelected: (bool selected) {
        setState(() {
          selectedRoom = selected ? room : null;
        });
      },
    );
  }

  Widget _buildStyleOption(String style) {
    return ChoiceChip(
      label: Text(style),
      selected: selectedStyle == style,
      onSelected: (bool selected) {
        setState(() {
          selectedStyle = selected ? style : null;
        });
      },
    );
  }
}
