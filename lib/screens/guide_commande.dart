import 'package:flutter/material.dart';

class GuideCommandePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guide de Commande',
          style: TextStyle(
          color: Color(0xFFFFBA86),
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Faire du shopping sur Access-Store est très facile. Suivez simplement les étapes ci-dessous.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 20),


               Text(
                'Étape 1 :',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFBA86),
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Se connecter à votre compte.\nAllez dans « Se connecter » si vous avez déjà un compte sur notre application.\nCliquez sur « S\'inscrire» pour vous inscrire avec votre adresse mail.',
               style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),


              Text(
                'Étape 2 :',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFFFFBA86)
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Ajouter un ou plusieurs articles dans votre panier\nSélectionnez la taille, la couleur et la quantité si nécessaire. Il est possible que pour certains articles, nous vous recommanderons la taille à prendre.\nCliquez sur "AJOUTER AU PANIER".',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),


              Text(
                'Étape 3 :',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFFFFBA86)
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Cliquez sur le bouton PANIER pour vérifier les articles choisis.',
               style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),

              
             
              Text(
                'Étape 4 :',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFFFFBA86)
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Compléter les informations d\'expédition et de facturation.\nRemplissez l\'adresse de livraison.\nCliquez sur « Confirmer Commande».',
               style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
