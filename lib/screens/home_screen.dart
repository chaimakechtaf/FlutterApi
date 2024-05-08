import 'package:flutter/material.dart';
import 'package:pfe_ecommerce/models/bottom_nav_bar.dart';
import 'package:pfe_ecommerce/screens/about_page.dart';
import 'package:pfe_ecommerce/screens/cart_page.dart';
import 'package:pfe_ecommerce/screens/compte_page.dart';
import 'package:pfe_ecommerce/screens/contact_page.dart';
import 'package:pfe_ecommerce/screens/favoris_page.dart';
import 'package:pfe_ecommerce/screens/login_screen.dart';
import 'package:pfe_ecommerce/screens/settings_page.dart';
import 'package:pfe_ecommerce/screens/search_page.dart';
import 'package:pfe_ecommerce/screens/category_page.dart';
import 'package:pfe_ecommerce/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          
        ],
      ),



     
      drawer: Consumer<Auth>(
        builder: (context, auth, child) {
          
          if (!auth.authenticated) {  
            return Drawer(
              backgroundColor:Color(0xFFFFBA86) ,
              child: ListView(
                children: [
                 DrawerHeader(
                decoration: BoxDecoration(
               color: Color(0xFFFFBA86),
               ),
               child: Center(
               child: Image.asset(
               'images/logo.png', 
                width: 300.0, 
                height: 300.0, 
                 ),
                  ),
                   ),

                  ListTile(
                    leading: Icon(Icons.login),
                    title: Text('Se Connecter'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                  ),
                ],
              ),
            );
          } else {
            return Drawer(
               backgroundColor: Color(0xFFFFBA86),
              child: ListView(
                children: [
                   DrawerHeader(
                decoration: BoxDecoration(
               color: Color(0xFFFFBA86),
               ),
               child: Center(
               child: Image.asset(
               'images/logo.png', 
                width: 200.0, 
                height: 200.0, 
                 ),
                  ),
                   ),
                  SizedBox(height: 15),

                  ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text('Profile'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ComptePage()),
                      );
                    },
                  ),

                  SizedBox(height: 15),


                  ListTile(
                    leading: Icon(Icons.contacts_rounded),
                    title: Text('Contacter '),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ContactPage()),
                      );
                    },
                  ),

                  SizedBox(height: 15),


                  ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text('Favoris'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => FavorisPage()),
                      );
                    },
                  ),

                  SizedBox(height: 15),


                  ListTile(
                    leading: Icon(Icons.shopping_cart_rounded),
                    title: Text('Panier'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CartPage()),
                      );
                    },
                  ),

                  SizedBox(height: 15),
                
                  Divider(),

                  SizedBox(height: 15),


                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Se Déconnecter'),
                    onTap: () {
                      Provider.of<Auth>(context, listen: false).logout();
                      Navigator.pop(context);
                  },
            ),
          ],
        ),
      );
    }
  },
), 



      body: SingleChildScrollView(
        child: Column(
          children: [
            // Carousel Start
            CarouselSlider(
              items: [
                _buildImageWithOverlay(
                  'images/1.png'
                ),
                _buildImageWithOverlay(
                  'images/2.png'
                ),
               _buildImageWithOverlay(
                  'images/3.png'
                ),
                _buildImageWithOverlay(
                  'images/4.png'
                ),
                
              ],
              options: CarouselOptions(
                height: 150.0,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
            // Carousel End

            SizedBox(height: 20),




            /*

            SizedBox(height: 10),


            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Meilleures ventes',
                style: TextStyle(
                  height: 3,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 30, // Espace vertical entre les cartes
                childAspectRatio: 0.8, // Rapport largeur/hauteur des cartes
                children: [
                  _buildProductItem('images/1.jpg', 'Iphone 12 PROMAX', 9000.00),
                  _buildProductItem('images/2.jpg', 'Robe ETE ', 320),
                  _buildProductItem('images/3.jpg', 'Jean Homme', 280),
                  // Ajoutez d'autres produits selon vos besoins
                ],
              ),
            ),

               */


            SizedBox(height: 20),
          ],
        ),
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



/*
  // Widget pour les icônes de catégorie
  Widget _buildCategoryIcon(BuildContext context, String categoryName, String imagePath, double width) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CategoryPage(categoryName: categoryName),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Image.asset(imagePath, width: width),
      ),
    );
  }
*/



                  /*
  // Widget pour les éléments de produit
  Widget _buildProductItem(String imagePath, String productName, double newPrice) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15), // Ajoutez le rayon désiré
      ),
      child: Card(
        elevation: 5, // Pour ajouter de l'ombre
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150,
              child: Stack(
                children: [
                  Image.asset(
                    imagePath,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$newPrice \DH',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    productName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

         */


 Widget _buildImageWithOverlay(
  String imagePath, 
 
) {
  return Stack(
    fit: StackFit.expand,
    children: [
      Image.asset(imagePath), // Image
      Positioned(
        bottom: 30, // Ajustez la position verticale selon vos besoins
        left: 20, // Ajustez la position horizontale selon vos besoins
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        
        ),
      ),
    ],
  );
}

}
