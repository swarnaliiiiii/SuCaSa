import 'package:flutter/material.dart';
import 'package:start/screens/home.dart';
import '../theme/theme.dart';

class PickYourTaste extends StatefulWidget {
  const PickYourTaste({Key? key}) : super(key: key);

  @override
  _PickYourTasteState createState() => _PickYourTasteState();
}

class _PickYourTasteState extends State<PickYourTaste> {
  List<String> options = [
    'Aesthetic',
    'Bohemian',
    'Chill',
    'Coastal',
    'Colour-based',
    'Contemporary',
    'Cozy',
    'Ethnic/Desi',
    'French Country',
    'Japenese design',
    'Minimalist',
    'Modern',
    'Royal',
    'Rustic/Earthy',
    'Vintage',
  ];

  List<bool> isSelected = List.generate(15, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColorScheme.primary, // Background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 64,
            ),
            const Text(
              'Pick your Taste',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 36, 35, 36), // Text color
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: options.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected[index] = !isSelected[index];
                      });
                    },
                    child: Container(
                      width: 80,
                      height: 40,
                      decoration: BoxDecoration(
                        color: isSelected[index]
                            ? const Color.fromARGB(
                                255, 197, 222, 214) // Selected color
                            : const Color(0xFFD9D9D9), // Unselected color
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          options[index],
                          style: TextStyle(
                            fontSize: 12,
                            color: isSelected[index]
                                ? const Color.fromARGB(
                                    255, 36, 36, 36) // Text color when selected
                                : const Color.fromARGB(255, 36, 36,
                                    36), // Text color when unselected
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Get the selected options
                List<String> selectedOptions = [];
                for (int i = 0; i < options.length; i++) {
                  if (isSelected[i]) {
                    selectedOptions.add(options[i]);
                  }
                }

                // Navigate to the next page
                // You can pass the selected options using Navigator arguments
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Home() // Replace with your next page
                      ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Button background color
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              child: const Text(
                'SUBMIT',
                style: TextStyle(
                  color: Colors.white,
                  // Button text color
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
