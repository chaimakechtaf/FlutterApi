import 'package:flutter/material.dart';
import 'package:pfe_ecommerce/models/bottom_nav_bar.dart';
import 'package:pfe_ecommerce/screens/return_page.dart';
import 'package:pfe_ecommerce/screens/settings_page.dart';

class AboutPage extends StatefulWidget {
@override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'À propos d\'AccessStore',
        style: TextStyle(
          color: Color(0xFFFFBA86),
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5.0),
              alignment: Alignment.center,
              child: Image.asset('images/logo.png'), // Remplacez 'images/logo.png' par le chemin de votre logo
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lancé en 2024, AccessStore est la plateforme leader d\'e-commerce . Nous servons des millions d\'acheteurs  à travers le monde.',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Notre Mission',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFFFFBA86)),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'En tant que partie du Groupe Alibaba, notre mission est de faciliter les affaires partout dans le monde. Nous y parvenons en fournissant aux fournisseurs les outils nécessaires pour atteindre un public mondial pour leurs produits, et en aidant les acheteurs à trouver rapidement et efficacement des produits et des fournisseurs.',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Approvisionnement Tout-en-Un',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,color: Color(0xFFFFBA86)),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'AccessStore vous propose des centaines de millions de produits dans plus de 40 catégories majeures différentes, y compris l\'électronique grand public, la machinerie et l\'habillement. Les acheteurs de ces produits sont situés dans plus de 190 pays et régions, et échangent des centaines de milliers de messages avec des fournisseurs sur la plateforme chaque jour.',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'À tout moment, n\'importe où',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFFFFBA86)),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'En tant que plateforme, nous continuons à développer des services pour aider les entreprises à faire plus et à découvrir de nouvelles opportunités. Que ce soit pour approvisionner depuis votre téléphone portable ou contacter des fournisseurs dans leur langue locale, faites confiance à AccessStore pour tous vos besoins commerciaux mondiaux.',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Politique de confidentialité et conditions d\'utilisation',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,  color: Color(0xFFFFBA86)),
                  ),
                  SizedBox(height: 10.0),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ReturnPage()),
                      );
                    },
                    child: Text(
                      'Politique de confidentialité & Conditions d\'utilisation',
                      style: TextStyle(fontSize: 16.0, color: Colors.grey),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Coordonnées',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,  color: Color(0xFFFFBA86)),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Pour toute question ou préoccupation, n\'hésitez pas à nous contacter en remplissant notre formulaire de contact.',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Réseaux sociaux et liens externes',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold ,color: Color(0xFFFFBA86)),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.facebook),
                        onPressed: () {
                          // Ouvrir le lien Facebook
                        },
                      ),
                     
                      IconButton(
                        icon: Icon(Icons.link),
                        onPressed: () {
                          // Ouvrir le lien vers le blog ou autre lien externe
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
}

