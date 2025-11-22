import 'package:flutter/material.dart';
import 'stone.dart';
import 'stone_dropdown.dart';
import 'SizeWidget.dart';
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

  void updateSize(String size) {
    setState(() {
      stone.selectedSize = size;
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
              children: [
                const SizedBox(height: 20),
                const Text("Welcome To Askar Stone", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                const Text("Select Stone", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                StoneDropdown(updateStone: updateStone),
                const SizedBox(height: 20),
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [BoxShadow(color: Colors.black, blurRadius: 15, spreadRadius: 5)],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(stone.image, fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(height: 20),
                const Text("Select Size:", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                SizeWidget(stone: stone, updateSize: updateSize),
                const SizedBox(height: 10),
                const Text("Quantity:", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                SizedBox(
                  width: 150,
                  child: TextField(
                    controller: TextEditingController(text: stone.quantity.toString()),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        stone.quantity = int.tryParse(value) ?? 1;
                      });
                    },
                    decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "Enter Quantity"),
                  ),
                ),
                const SizedBox(height: 20),
                Text("Total: ${stone.getTotalPrice()} \$", style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black87, padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15)),
                  onPressed: (stone.quantity >= 1 && stone.selectedSize.isNotEmpty)
                      ? () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Order Placed"),
                        content: const Text("Your order has been placed successfully"),

                        actions: [
                          TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK"))
                        ],
                      ),
                    );
                  }
                      : null,
                  child: const Text("Place order", style: TextStyle(color: Colors.white)),
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
