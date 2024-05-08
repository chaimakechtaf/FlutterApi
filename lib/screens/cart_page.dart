import 'package:flutter/material.dart';
import 'package:pfe_ecommerce/models/bottom_nav_bar.dart';
import 'package:pfe_ecommerce/screens/checkout_page.dart';

  class CartPage extends StatefulWidget {

 @override
  _CartPageState createState() => _CartPageState();
}
class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mon Panier', 
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
          _buildTotalPriceSection(),
          SizedBox(height: 20),


          ElevatedButton(
         
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CheckoutPage()),
              );
            },
            style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFFBA86)),
  ),
            child: Text('Passer la commande',
            style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),),
          ),
          
          SizedBox(height: 20),
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
          Expanded(
            flex: 1,
            child: Column(
              children: [
                IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    // Action pour supprimer le produit de la liste
                  },
                ),
                SizedBox(height: 8),
                Text(
                  'Qté: $quantity',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalPriceSection() {
    // Calculer le prix total
    double totalPrice = 0;
    for (int i = 0; i < 5; i++) {
      totalPrice += (i + 1) * 50.0; // Simulons des prix de produits
    }

    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Prix total:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            '\$$totalPrice',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

