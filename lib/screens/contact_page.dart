import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  bool _emailSent = false;

  Future<void> sendEmail(String name, String email, String phone, String message) async {
    String username = 'chaimakechtaf7@gmail.com'; // Remplacez par votre adresse e-mail Gmail
    String password = 'ysvddrtjzoaohhan'; // Remplacez par votre mot de passe Gmail

    final smtpServer = gmail(username, password);

    final messageToSend = Message()
      ..from = Address(username)
      ..recipients.add('chaimakechtaf7@gmail.com') // Remplacez par votre adresse e-mail de réception
      ..subject = 'Nouveau message de contact'
      ..text = 'Hello Access Store,\n\n'
          'You got a new message from $name:\n\n'
          '$message\n\n'
          'Best wishes,\n'
          'Access Team';

    try {
      final sendReport = await send(messageToSend, smtpServer);
      setState(() {
        _emailSent = true;
      });
      print('Message envoyé: ${sendReport.toString()}');
    } catch (e) {
      setState(() {
        _emailSent = false;
      });
      print('Erreur lors de l\'envoi du message: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contactez-nous',
         style: TextStyle(
          color: Color(0xFFFFBA86),
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Card(
          elevation: 3.0,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Votre avis est précieux pour nous. Utilisez ce formulaire pour nous faire part de vos suggestions, réclamations ou tout autre commentaire.',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Column(
                      children: [
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            labelText: 'Nom Complet',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          controller: _phoneController,
                          decoration: InputDecoration(
                            labelText: 'Téléphone',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          controller: _messageController,
                          maxLines: 5,
                          decoration: InputDecoration(
                            labelText: 'Message',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          // Récupérez les données du formulaire
                          String name = _nameController.text;
                          String email = _emailController.text;
                          String phone = _phoneController.text;
                          String message = _messageController.text;

                          // Envoyez l'e-mail
                          await sendEmail(name, email, phone, message);

                          // Affichez le dialogue
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(_emailSent ? 'Email envoyé' : 'Erreur'),
                                content: Text(_emailSent ? 'Votre email a été envoyé avec succès.' : 'Une erreur est survenue lors de l\'envoi de l\'email.'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFFBA86),
                      ),
                      child: Text('Envoyer', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
