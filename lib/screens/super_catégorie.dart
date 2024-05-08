import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pfe_ecommerce/models/bottom_nav_bar.dart';
import 'category_page.dart'; // Importer la page CategoryPage

class SuperCategoriePage extends StatefulWidget {
  @override
  _SuperCategoriePageState createState() => _SuperCategoriePageState();
}

class _SuperCategoriePageState extends State<SuperCategoriePage> {
  int _currentIndex = 1;
  
  // Liste des images pour chaque carte
  final List<List<String>> imagesPerCard = [
    ['femme2.jpg', 'femme1.jpg', 'femme3.jpg'],
    ['homme1.jpg', 'homme2.jpg', 'homme3.jpg'],
    ['child1.jpg', 'child2.jpg', 'child3.jpg'],
    ['electro3.jpg', 'electro1.jpg', 'electro2.jpg'],
    ['maison3.jpg', 'maison2.jpg', 'maison1.jpg'],
  ];

  // Liste des descriptions pour chaque carte
  final List<String> descriptions = [
    'Femmes',
    'Hommes',
    'Enfants',
    'Electroniques',
    'Maison',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Catégories',
          style: TextStyle(
            color: Color(0xFFFFBA86),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: imagesPerCard.length,
        itemBuilder: (context, index) {
          return SuperCategorieCard(
            images: imagesPerCard[index],
            description: descriptions[index],
          );
        },
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
          
        },
      ),
    );
  }
}

class SuperCategorieCard extends StatelessWidget {
  final List<String> images;
  final String description;

  const SuperCategorieCard({
    Key? key,
    required this.images,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryPage(categoryName: description),
          ),
        );
      },
      child: Card(
        child: Column(
          children: [


            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                enableInfiniteScroll: true, // Défilement infini
                autoPlay: false, // Lecture automatique
                autoPlayInterval: Duration(seconds: 5), 
                viewportFraction: 1.0,
              ),
              items: images.map((image) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/$image'), 
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(description), // Afficher la description de la carte
            ),
          ],
        ),
      ),
    );
  }
}
