

class Stone {
  String name;
  String image;
  Map<String, int> sizes;
  String selectedSize = "";
  int quantity = 1;

  Stone(this.name, this.image, this.sizes);

  String getTotalPrice() {
    if (selectedSize.isEmpty) return "0";
    int price = sizes[selectedSize]!;
    return (price * quantity).toString();
  }

  @override
  String toString() {
    return name;
  }
}

List<Stone> stones = [
  Stone("Embossed", "assets/L.jpg", {
    "15": 12,
    "20": 17,
    "25": 22,
    "30": 25,

  }),
  Stone("Bouchard", "assets/A.jpg", {
    "15": 11,
    "20": 15,
    "25": 20,
    "30": 23,
  }),
  Stone("Washed", "assets/s.jpg", {
    "15": 10,
    "20": 13,
    "25": 17,
    "30": 20,
  }),];

