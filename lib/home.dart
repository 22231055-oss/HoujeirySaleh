import 'package:flutter/material.dart';
import 'stone.dart';
import 'stone_dropdown.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Stone stone = stones.first;

  void updateStone(Stone st) {
    setState(() {
      stone = st;
      stone.selectedSize = "";
      stone.quantity = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Welcome To Askars Stone",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "Select Stone",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),

                StoneDropdown(updateStone: updateStone),
                const SizedBox(height: 20),
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 15,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(stone.image, fit: BoxFit.cover),
                  ),
                ),

                const SizedBox(height: 20),
                const Text(
                  "Select Size:",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: stone.sizes.keys.map((size) {
                    return RadioListTile(
                      title: Text(
                        "$size — ${stone.sizes[size]} \$",
                        style: const TextStyle(color: Colors.black87),
                      ),
                      value: size,
                      groupValue: stone.selectedSize,
                      onChanged: (val) {
                        setState(() {
                          stone.selectedSize = val!;
                        });
                      },
                      activeColor: Colors.black87,
                    );
                  }).toList(),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Quantity:",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),

                SizedBox(
                  width: 150,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        stone.quantity = int.tryParse(value) ?? 1;
                      });
                    },
                    style: const TextStyle(color: Colors.black87),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter Quantity",
                      hintStyle: TextStyle(color: Colors.black54),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  "Total: ${stone.getTotalPrice()} \$",
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Purchase Completed"),
                        content: const Text("Your order was successful"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("OK"),
                          )
                        ],
                      ),
                    );
                  },
                  child: const Text("BUY", style: TextStyle(color: Colors.white)),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
