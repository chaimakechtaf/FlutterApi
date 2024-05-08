import 'package:flutter/material.dart';

class LivraisonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Livraison',
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
              'Temps de préparation: 1-3 jours',
                textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
           
            SizedBox(height: 50.0),
            Table(
              border: TableBorder.all(),
              children: [
                TableRow(
                  children: [
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Mode De Livraison',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Color(0xFFFFBA86)),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Durée De Livraison',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Color(0xFFFFBA86)),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Frais',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Color(0xFFFFBA86)),
                        ),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('*Livraison à domicile',
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.grey),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('*Livraison après 3 jours de votre commande ',
                                 style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.grey),
                          ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('*DH80.00— moins de DH500.00\n\n*DH60.00— entre DH500 et DH1000.00\n\n*DH40- plus de DH1000',
                                 style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.grey),
                        
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              '* Le délai de livraison est une estimation basée sur la date à laquelle vous avez payé la commande, mais le réel délai de livraison peut être plus long que prévu à cause d\'une adresse invalide, de procédures de dédouanement ou d\'autres causes.\n\n'
              '* Si votre colis n\'a pas été livré ou si les informations de suivi indiquent que votre colis a été livré mais que vous ne l\'avez pas reçu, vous devez contacter le service clientèle.\n\n'
              '* En raison des exigences en matière de transport du service logistique et pour assurer une livraison efficace du colis, votre commande pourrait être transportée en séparation. Merci de votre compréhension.',
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black54),
            
            ),
          ],
        ),
      ),
    );
  }
}


