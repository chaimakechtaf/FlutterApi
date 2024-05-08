import 'package:flutter/material.dart';
import 'package:pfe_ecommerce/models/bottom_nav_bar.dart';
import 'product_detail_page.dart'; // Importer la page ProductDetailPage

class CategoryPage extends StatefulWidget {
  final String categoryName;

  CategoryPage({required this.categoryName});

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  int _currentIndex = 1;
  List<Map<String, dynamic>> _products = []; // Liste des produits chargés pour affichage
  int _selectedSubCategoryIndex = -1;

  @override
  void initState() {
    super.initState();
    // Chargez les produits initiaux pour la catégorie sélectionnée
    _loadProductsForCategory(widget.categoryName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Rechercher...',
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          // Partie gauche avec les sous-catégories
          Container(
            width: 133,
            color: Color(0xFFFFBA86),
            child: ListView(
              children: _buildSubCategories(), // Afficher les sous-catégories
            ),
          ),
          // Partie droite avec les produits
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: _products.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildProductItem(context, _products[index]);
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
          // Ajoutez ici la logique pour afficher les différentes pages
          // en fonction de l'index sélectionné
        },
      ),
    );
  }

  // Méthode pour construire les sous-catégories
  List<Widget> _buildSubCategories() {
    switch (widget.categoryName) {
      case 'Femmes':
        return _buildWomenSubCategories();
      case 'Hommes':
        return _buildMenSubCategories();
      case 'Enfants':
        return _buildChildrenSubCategories();
      case 'Electroniques':
        return _buildElectronicsSubCategories();
      case 'Maison':
        return _buildHomeSubCategories();
      default:
        return [];
    }
  }

  // Méthodes pour construire les sous-catégories pour chaque catégorie
  
  
  //FEMME
  
  List<Widget> _buildWomenSubCategories() {
    return [
      _buildSubCategoryTile('Accessoires Femme', 0),
      _buildSubCategoryTile('Chaussures & Sandales', 1),
      _buildSubCategoryTile('Manteaux & vestes', 2),
      _buildSubCategoryTile('Robes', 3),
      _buildSubCategoryTile('Pontalons & Jupes', 4),
      _buildSubCategoryTile('Sacs', 5),
      _buildSubCategoryTile('Tenues de Sport Femmes', 6),
      _buildSubCategoryTile('Tops Femmes', 7),
    ];
  }

  
  
  //HOMME

  List<Widget> _buildMenSubCategories() {
    return [
      _buildSubCategoryTile('Accessoires Homme', 0),
      _buildSubCategoryTile('Chaussures Hommes', 1),
      _buildSubCategoryTile('Costumes', 2),
      _buildSubCategoryTile('Jackets', 3),
      _buildSubCategoryTile('Pontalons & Shorts', 4),
      _buildSubCategoryTile('Tenues de Sport Hommes', 5),
      _buildSubCategoryTile('Tops Hommes', 6),
    ];
  }


         //ENFANTS


  List<Widget> _buildChildrenSubCategories() {
    return [
      _buildSubCategoryTile('Chaussures Enfants', 0),
      _buildSubCategoryTile('Ensembles & Robes', 1),
      _buildSubCategoryTile('Pontalons & Jupes', 2),
      _buildSubCategoryTile('Pyjamas', 3),
      _buildSubCategoryTile('Sacs à dos', 4),
      _buildSubCategoryTile('Tenues de Sport Enfants', 5),
      _buildSubCategoryTile('Tops', 6),
    ];
  }


         //ELECTRO

  List<Widget> _buildElectronicsSubCategories() {
    return [
      _buildSubCategoryTile('Accessoires Electronique', 0),
      _buildSubCategoryTile('Cameras de Sécurité', 1),
      _buildSubCategoryTile('Casques', 2),
      _buildSubCategoryTile('Haut-Parleurs', 3),
      _buildSubCategoryTile('Montre Intelligente', 4),
      _buildSubCategoryTile('Ordinateurs', 5),
      _buildSubCategoryTile('Téléphones', 6),
    ];
  }


         //MAISON  

  List<Widget> _buildHomeSubCategories() {
    return [
      _buildSubCategoryTile('Cuisine', 0),
      _buildSubCategoryTile('Chambres', 1),
      _buildSubCategoryTile('Salle de bain', 2),
      _buildSubCategoryTile('Decoration de Interieur', 3),
      _buildSubCategoryTile('Rangement & Organisation', 4),
    ];
  }



   // Méthode pour construire les tuiles de sous-catégorie
  Widget _buildSubCategoryTile(String subCategoryName, int index) {
    return ListTile(
      title: Text(
        subCategoryName,
        style: TextStyle(
          fontWeight: _selectedSubCategoryIndex == index ? FontWeight.bold : FontWeight.normal,
          color: _selectedSubCategoryIndex == index ? Colors.white : Colors.black,
        ),
      ),
      onTap: () {
        setState(() {
          _selectedSubCategoryIndex = index;
        });
        _loadProductsForCategory(subCategoryName);
      },
    );
  }



  // Méthode pour charger les produits correspondant à une sous-catégorie spécifique
  void _loadProductsForCategory(String subCategory) {
    setState(() {
      _products.clear();

      if (subCategory == 'Accessoires') {
        _products.addAll([
          // Ajoutez les produits pour la sous-catégorie 'Accessoires'
        ]);
      } else if (subCategory == 'Robes') {
        _products.addAll([
          {
            'imagePath': 'images/2.jpg',
            'productName': 'Robe 1',
            'newPrice': 120.0,
            'oldPrice': 150.0,
            'description': 'Description de la robe 1',
          },
         

        ]);
      }else if (subCategory == 'Tenues de Sport Hommes') {
        _products.addAll([
          {
            'imagePath': 'images/sportH1.png',
            'productName': 'Robe 1',
            'newPrice': 120.0,
            'oldPrice': 150.0,
            'description': 'Description de la robe 1',
          },
          {
            'imagePath': 'images/sportH2.webp',
            'productName': 'Robe 2',
            'newPrice': 100.0,
            'oldPrice': 130.0,
            'description': 'Description de la robe 2',
          },
          {
            'imagePath': 'images/sportH3.webp',
            'productName': 'Robe 2',
            'newPrice': 100.0,
            'oldPrice': 130.0,
            'description': 'Description de la robe 2',
          },
          {
            'imagePath': 'images/sportH4.webp',
            'productName': 'Robe 2',
            'newPrice': 100.0,
            'oldPrice': 130.0,
            'description': 'Description de la robe 2',
          },
          {
            'imagePath': 'images/sportH5.png',
            'productName': 'Robe 2',
            'newPrice': 100.0,
            'oldPrice': 130.0,
            'description': 'Description de la robe 2',
          },
          
         
        ]);
      }
      // Ajoutez d'autres conditions pour charger les produits d'autres sous-catégories
    });
  }

  // Méthode pour construire les produits
 Widget _buildProductItem(BuildContext context, Map<String, dynamic> product) {
  return Card(
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(
              imagePath: product['imagePath'],
              productName: product['productName'],
              newPrice: product['newPrice'],
              oldPrice: product['oldPrice'],
              description: product['description'],
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 119, // Limite de hauteur de la carte
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
                image: DecorationImage(
                  image: AssetImage(product['imagePath']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
         
        ],
      ),
    ),
  );
}

}
