import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State{
  // Variable pour stocker la méthode de paiement sélectionnée
  String selectedPaymentMethod = 'Paiement à la livraison';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout',
        style: TextStyle(
          color: Color(0xFFFFBA86),
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card contenant la liste des produits commandés
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                children: [
                  ListTile(
                    title: Text('Produits commandés'),
                  ),
                  _buildOrderedProducts(), // Fonction pour construire la liste des produits commandés
                ],
              ),
            ),

            // Card contenant les informations de prix
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                children: [
                  ListTile(
                    title: Text('Total de la commande'),
                  ),
                  _buildPriceInfo(), // Fonction pour construire les informations de prix
                ],
              ),
            ),

            // Radio buttons pour choisir la méthode de paiement
            ListTile(
              title: Text('Méthode de paiement'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RadioListTile(
                    title: Text('Paiement à la livraison'),
                    value: 'Paiement à la livraison',
                    groupValue: selectedPaymentMethod,
                    onChanged: (value) {
                      setState(() {
                        selectedPaymentMethod = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text('Virement bancaire'),
                    value: 'Virement bancaire',
                    groupValue: selectedPaymentMethod,
                    onChanged: (value) {
                      setState(() {
                        selectedPaymentMethod = value.toString();
                      });
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.0),

            // Bouton de confirmation de commande
            Center(
              child:  ElevatedButton(
         
            onPressed: () {
              
            },
            style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFFBA86)),
               ),
            child: Text('Confirmer la commande',
            style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        ),
          ),
          
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderedProducts() {
    // Fonction pour construire la liste des produits commandés
    // Vous pouvez remplacer cette section par votre propre mise en page de la liste des produits
    return Column(
      children: [
        // Ici, vous pouvez construire chaque élément de la liste des produits
        // Utilisez des cartes, des listTiles ou des listTiles personnalisés pour chaque produit
        // Voici un exemple de carte pour un produit :
        Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('images/2.jpg'),
            ),
            title: Text('Nom du produit'),
            subtitle: Text('Prix: 100\nQuantité: 2'),
            trailing: IconButton(
              icon: Icon(Icons.cancel),
              onPressed: () {
                // Action pour supprimer le produit de la liste
              },
            ),
          ),
        ),
        // Vous pouvez répéter cette carte pour chaque produit dans la liste
      ],
    );
  }

  Widget _buildPriceInfo() {
    // Fonction pour construire les informations de prix (Total, TVA, PrixHT)
    return Column(
      children: [
        ListTile(
          title: Text('Prix total: 200'), // Remplacez par le prix total réel
        ),
        ListTile(
          title: Text('TVA (20%): 40'), // Remplacez par la TVA réelle
        ),
        ListTile(
          title: Text('Prix HT: 240'), // Remplacez par le prix HT réel
        ),
      ],
    );
  }
}
