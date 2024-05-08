import 'package:flutter/material.dart';

class FavorisPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favoris',
        style: TextStyle(
          color: Color(0xFFFFBA86),
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5, // Remplacez cela par la taille de votre liste de produits
              itemBuilder: (context, index) {
                return _buildCartItem(context, index);
              },
            ),
          ),
         
         
        ],
      ),
    );
  }

  Widget _buildCartItem(BuildContext context, int index) {
    // Simulons quelques données de produit
    String productName = 'Produit $index';
    double productPrice = (index + 1) * 50.0;
    String productVariation = 'Taille M, Couleur Rouge';
    int quantity = index + 1;

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Image.asset(
                'images/2.jpg', // Remplacez cela par le chemin de votre image produit
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    productVariation,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '\$$productPrice',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
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


