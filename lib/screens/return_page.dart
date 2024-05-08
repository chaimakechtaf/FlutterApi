import 'package:flutter/material.dart';

class ReturnPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Politique de Retour',
        style: TextStyle(
          color: Color(0xFFFFBA86),
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Nous espérons que vous aimerez ce que vous avez commandé ! Cependant, dans le cas où vous ne seriez pas entièrement satisfait, nous avons rendu la procédure de retour très facile.',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'De combien de temps est-ce que je dispose avant de faire un retour et est-ce que je dois payer les frais d\'expédition ?',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              '(1) À propos du délai de retour',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFBA86)
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Nous acceptons les retours dans un délai de 30 jours à compter de la date de livraison. Dès que nous recevrons votre colis dans notre entrepôt, votre remboursement sera automatiquement émis.',
              style: TextStyle(fontSize: 16.0,
              fontWeight: FontWeight.bold,
               color: Colors.grey),
            ),
            SizedBox(height: 20.0),
            Text(
              '(2) À propos des étapes de retour',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFBA86)
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Envoi par soi-même: Veuillez choisir votre propre société de logistique à vos frais et expédier le colis.',
                 style: TextStyle(fontSize: 16.0,
              fontWeight: FontWeight.bold,
               color: Colors.grey)
            ),
            SizedBox(height: 10.0),
            Text(
              'Comment effectuer un retour ?',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              '1. Connectez-vous à votre compte.',
                 style: TextStyle(fontSize: 16.0,
              fontWeight: FontWeight.bold,
               color: Colors.grey)
            ),
            Text(
              '2. Trouvez la commande dans Mes commandes, cliquez sur le bouton "Retourner l\'article".',
                 style: TextStyle(fontSize: 16.0,
              fontWeight: FontWeight.bold,
               color: Colors.grey)
            ),
            Text(
              '3. Sélectionnez le(s) article(s) que vous souhaitez retourner, indiquez la raison, puis soumettez.',
                  style: TextStyle(fontSize: 16.0,
              fontWeight: FontWeight.bold,
               color: Colors.grey)
            ),
            Text(
              '4. Sélectionnez la méthode de retour et la méthode de remboursement, puis emballez le(s) article(s) à retourner avec l\'emballage d\'origine.',
                  style: TextStyle(fontSize: 16.0,
              fontWeight: FontWeight.bold,
               color: Colors.grey)
            ),
          ],
        ),
      ),
    );
  }
}
