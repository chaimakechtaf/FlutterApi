import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  final String imagePath;
  final String productName;
  final double newPrice;
  final double oldPrice;

  ProductDetailPage({
    required this.imagePath,
    required this.productName,
    required this.newPrice,
    required this.oldPrice, required description,
  });

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  String selectedColor = 'Couleur'; // Couleur sélectionnée par défaut
  String selectedSize = 'Taille'; // Taille sélectionnée par défaut
  String selectedStorage = 'Stockage'; // Stockage sélectionné par défaut
  int quantity = 1; // Quantité par défaut

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.productName,
          style: TextStyle(
            color: Color(0xFFFFBA86),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.favorite_border),
                  iconSize: 35,
                  onPressed: () {
                    // Action lors du clic sur l'icône de favori
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${widget.newPrice} \DH',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${widget.oldPrice} \DH',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Description du produit',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 25),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          value: selectedColor,
                          items: ['Couleur', 'Noir', 'Blanc', 'Rouge', 'Bleu'] // Exemple de couleurs
                              .map((color) => DropdownMenuItem(
                                    child: Text(color),
                                    value: color,
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedColor = value!;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          value: selectedSize,
                          items: ['Taille', 'S', 'M', 'L', 'XL'] // Exemple de tailles
                              .map((size) => DropdownMenuItem(
                                    child: Text(size),
                                    value: size,
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedSize = value!;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          value: selectedStorage,
                          items: ['Stockage', '32GB', '64GB', '128GB'] // Exemple de stockages
                              .map((storage) => DropdownMenuItem(
                                    child: Text(storage),
                                    value: storage,
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedStorage = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Row(
                    children: [
                      Text('Quantité:'),
                      SizedBox(width: 10),
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (quantity > 1) {
                              quantity--;
                            }
                          });
                        },
                      ),
                      Text(
                        '$quantity',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                      ),
                      Spacer(),
                      ElevatedButton(
                         style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFFBA86), // Couleur du texte du bouton en orange
                             ),
                        onPressed: () {
                          // Action lors du clic sur le bouton Ajouter au panier
                          // Ici, vous pouvez implémenter la logique pour ajouter le produit au panier
                        },
                        child: Text('Ajouter au panier',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
