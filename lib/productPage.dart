import 'package:flutter/material.dart';

class Productpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "SANIVA",
      home: HomePage(),
    );
  }
}

// Sample Product Model
class Product {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

//  Dummy Products
List<Product> products = [
  Product(
    name: "Shoes",
    description: "Comfortable running shoes",
    price: 599.0,
    imageUrl: "https://images.pexels.com/photos/267301/pexels-photo-267301.jpeg?cs=srgb&dl=pexels-pixabay-267301.jpg&fm=jpg",
  ),
  Product(
    name: "Wall Sticker",
    description: "Sea view",
    price: 12999.0,
    imageUrl: "https://images.pexels.com/photos/277394/pexels-photo-277394.jpeg",
),
  Product(
    name: "NotePad",
    description: "Trendy samll pad",
    price: 7799.0,
    imageUrl: "https://picsum.photos/200/200?4"
     ),
  Product(
      name: "Headphones",
      description: "Noise cancelling headphones",
      price: 1000.0,
      imageUrl: "https://picsum.photos/200/200?3"
  ),
];

//  Home Page
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Horizontal GridView (Top)
          SizedBox(
            height: 220,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailPage(product: product),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    margin: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.network(product.imageUrl,
                              fit: BoxFit.cover),
                        ),
                        Text(product.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        Text(product.description,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.grey)),
                        Text("\$${product.price.toStringAsFixed(2)}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Popular Items",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),

          // 🔹 Vertical ListView (Bottom)
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailPage(product: product),
                      ),
                    );
                  },
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    elevation: 3,
                    child: ListTile(
                      leading: Image.network(product.imageUrl,
                          width: 60, fit: BoxFit.cover),
                      title: Text(product.name,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(product.description),
                      trailing: Text(
                        "\$${product.price.toStringAsFixed(2)}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// 📄 Detail Page
class DetailPage extends StatelessWidget {
  final Product product;
  const DetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Cover Image
            Image.network(
              product.imageUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name,
                      style:
                      TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text(product.description,
                      style: TextStyle(fontSize: 16, color: Colors.grey[700])),
                  SizedBox(height: 12),
                  Text("\$${product.price.toStringAsFixed(2)}",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.green)),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Buy Now"),
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            vertical: 14, horizontal: 50),
                        textStyle: TextStyle(fontSize: 18)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}