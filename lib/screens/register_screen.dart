import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pfe_ecommerce/screens/login_screen.dart';
import 'package:pfe_ecommerce/services/api.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> register(Map<String, String> userData, BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:8000/api/users'),
        body: json.encode(userData),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 201) {
        print('Utilisateur enregistré avec succès');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      } else {
        print('Erreur lors de l\'enregistrement de l\'utilisateur');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur lors de l\'enregistrement de l\'utilisateur'),
            duration: Duration(seconds: 5),
          ),
        );
      }
    } catch (e) {
      print('Erreur lors de la connexion: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erreur lors de la connexion'),
          duration: Duration(seconds: 5),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              color: Color(0xFFFFBA86),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.asset(
                        'images/logo.png',
                        height: 200,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "S'inscrire",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Veuillez vous inscrire pour continuer.',
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFFFFBA86),
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _nomController,
                      validator: (value) =>
                          value?.isEmpty ?? true ? 'Veuillez saisir un nom valide' : null,
                      decoration: InputDecoration(
                        labelText: 'Nom',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _emailController,
                      validator: (value) =>
                          value?.isEmpty ?? true ? 'Veuillez saisir un email valide' : null,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _usernameController,
                      validator: (value) =>
                          value?.isEmpty ?? true ? "Veuillez saisir un nom d'utilisateur valide" : null,
                      decoration: InputDecoration(
                        labelText: "Nom d'utilisateur",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _passwordController,
                      validator: (value) =>
                          value?.isEmpty ?? true ? 'Veuillez saisir un mot de passe valide' : null,
                      decoration: InputDecoration(
                        labelText: 'Mot de passe',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _confirmPasswordController,
                      validator: (value) =>
                          value?.isEmpty ?? true ? 'Veuillez confirmer le mot de passe ' : null,
                      decoration: InputDecoration(
                        labelText: 'Confirmer le mot de passe',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 10),
                    MaterialButton(
                      minWidth: double.infinity,
                      color: Color(0xFFFFBA86),
                      textColor: Colors.white,
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          Map<String, String> userData = {
                            'prenom': _prenomController.text,
                            'nom': _nomController.text,
                            'email': _emailController.text,
                            'username': _usernameController.text,
                            'password': _passwordController.text,
                          };
                          register(userData, context);
                        }
                      },
                      child: Text("S'inscrire"),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Text("Vous avez déjà un compte ?"),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text(
                "Se connecter",
                style: TextStyle(
                  color: Color(0xFFFFBA86),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
