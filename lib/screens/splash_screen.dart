import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pfe_ecommerce/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _logoAnimationController;
  late Animation<double> _logoAnimation;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    // Animation pour le logo
    _logoAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _logoAnimation = Tween<double>(begin: 0, end: -200).animate(
      CurvedAnimation(parent: _logoAnimationController, curve: Curves.easeOut),
    );

    // Démarrer l'animation après 4 secondes
    _timer = Timer(Duration(seconds: 4), () {
      _logoAnimationController.forward();
    });

    // Naviguer vers la page d'accueil après 5 secondes
    _timer = Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  void dispose() {
    _logoAnimationController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFBA86), // Couleur verte
      body: Center(
        child: AnimatedBuilder(
          animation: _logoAnimationController,
          builder: (context, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.translate(
                  offset: Offset(0, _logoAnimation.value),
                  child: Image.asset(
                    'images/logo.png', // Chemin de votre logo
                    height: 150,
                  ),
                ),
                SizedBox(height: 20),
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

