import 'package:flutter/material.dart';
import 'package:pfe_ecommerce/screens/register_screen.dart';
import 'package:pfe_ecommerce/services/auth.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
            SizedBox(height: 30),
            Text(
              'Se Connecter',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Veuillez vous connecter pour continuer',
              style: TextStyle(
                fontSize: 17,
                color: Color(0xFFFFBA86),
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
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
                    SizedBox(height: 20),
                    MaterialButton(
                      minWidth: double.infinity,
                      color: Color(0xFFFFBA86),
                      textColor: Colors.white,
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          Map<String, String> creds = {
                            'email': _emailController.text,
                            'password': _passwordController.text,
                            'device_name': 'mobile',
                          };
                          Provider.of<Auth>(context, listen: false).login(creds, context);
                        }
                      },
                      child: Text('Se connecter'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 80),
            Text("Vous n'avez pas de compte ?"),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
              child: Text(
                "S'inscrire",
                style: TextStyle(
                  color: Color(0xFFFFBA86),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
