import 'package:flutter/material.dart';
import 'package:pfe_ecommerce/screens/about_page.dart';
import 'package:pfe_ecommerce/screens/cart_page.dart';
import 'package:pfe_ecommerce/screens/compte_page.dart';
import 'package:pfe_ecommerce/screens/settings_page.dart';
import 'package:pfe_ecommerce/screens/home_screen.dart';
import 'package:pfe_ecommerce/screens/super_cat%C3%A9gorie.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color(0xFFFFBA86),
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      selectedItemColor: Colors.white, 
      onTap: (int index) {
        onTap(index);
        switch (index) {
          case 0:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
            break;
          case 1:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SuperCategoriePage()),
            );
            break;
          
          case 2:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AboutPage()),
            );
            break;
          case 3: 
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()),
            );            break;
          default:
            break;
        }
      },
      items: [
        _bottomNavigationBarItem(
          icon: Icons.home,
          label: 'Accueil',
          isSelected: currentIndex == 0,
          onTap: () {
            onTap(0);
          },
        ),
        
        _bottomNavigationBarItem(
          icon: Icons.category,
          label: 'Catégories',
          isSelected: currentIndex == 1,
          onTap: () {
            onTap(1);
          },
        ),
       
       _bottomNavigationBarItem(
          icon: Icons.info,
          label: 'A Propos',
          isSelected: currentIndex == 2,
          onTap: () {
            onTap(2);
          },
        ),
        
        _bottomNavigationBarItem(
          icon: Icons.settings,
          label: 'Parametres',
          isSelected: currentIndex == 3,
          onTap: () {
            onTap(3);

          },
        ),
      ],
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
     double? iconSize,
  }) {
    return BottomNavigationBarItem(
      icon: InkWell(
        onTap: onTap,
        child: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.black,
         size: iconSize ,
        ),
      ),
      label: label,
    );
  }
}
