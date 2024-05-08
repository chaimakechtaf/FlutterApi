import 'package:flutter/material.dart';
import 'package:pfe_ecommerce/screens/home_screen.dart';
import 'package:pfe_ecommerce/screens/splash_screen.dart';
import 'package:pfe_ecommerce/services/auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Auth()),
      ],
      child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: SplashScreen(),

        routes: {
        '/home': (context) => HomeScreen(), 
      },
      
    );
  }
}

