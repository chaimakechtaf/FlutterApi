import 'package:flutter/material.dart';
import 'package:pfe_ecommerce/models/bottom_nav_bar.dart';
import 'package:pfe_ecommerce/screens/compte_page.dart';
import 'package:pfe_ecommerce/screens/guide_commande.dart';
import 'package:pfe_ecommerce/screens/livraison_page.dart';
import 'package:pfe_ecommerce/screens/return_page.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int _currentIndex = 3;

  String _selectedMode = 'Clair';
  String _selectedLanguage = 'English';
  String _selectedCurrency = 'USD';

  final List<String> modes = ['Clair', 'Sombre'];
  final List<String> languages = ['عربي', 'Français', 'English'];
  final List<String> currencies = ['USD', 'EUR', 'MAD'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Parametres',
          style: TextStyle( 
            color: Color(0xFFFFBA86),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        children: [
         
          ListTile(
            title: Text('Mode'),
            trailing: DropdownButton<String>(
              value: _selectedMode,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedMode = newValue!;
                });
              },
              items: modes.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          ListTile(
            title: Text('Langues'),
            trailing: DropdownButton<String>(
              value: _selectedLanguage,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedLanguage = newValue!;
                });
              },
              items: languages.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          ListTile(
            title: Text('Monnaie'),
            trailing: DropdownButton<String>(
              value: _selectedCurrency,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCurrency = newValue!;
                });
              },
              items: currencies.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
            Divider(),
           Text(
            'Votre Guide',
               textAlign: TextAlign.center,
              style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFFFFBA86),
              fontSize: 20,
              ),
              ),

            
          ListTile(
            title: Text('Politique de retour',
            style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ReturnPage()),
                      );
                    },
          ),
          ListTile(
            title: Text('Informations sur la livraison',
            style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LivraisonPage()),
                      );
                    },
          ),
          ListTile(
            title: Text('Comment Commander depuis Access Store',
            style: TextStyle(fontWeight: FontWeight.bold),),
             onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => GuideCommandePage()),
                      );
                    },
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
}
