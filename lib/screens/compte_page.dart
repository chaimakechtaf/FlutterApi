import 'package:flutter/material.dart';
import 'package:pfe_ecommerce/models/bottom_nav_bar.dart';

class ComptePage extends StatefulWidget {
  @override
  _ComptePageState createState() => _ComptePageState();
}

class _ComptePageState extends State<ComptePage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mon compte',
          style: TextStyle(
            color: Color(0xFFFFBA86),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 16.0),
            child: Center(
              child: Card(
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: Color(0xFFFFBA86),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 48.0,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.account_circle,
                          size: 64.0,
                          color: Color(0xFFDBA979),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Chaimaa Elkachtaf',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: EdgeInsets.only(left: 330.0),
            child: IconButton(
              icon: Icon(
                Icons.edit,
                color: Color(0xFFDBA979),
                size: 35.0,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => EditAccountDialog(),
                );
              },
            ),
          ),
          SizedBox(height: 2.0),
          Expanded(
            child: Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),

              color: Color(0xFFFFBA86),
              child: Padding(
                padding: EdgeInsets.all(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileInfoRow(
                      icon: Icons.message,
                      label: 'Email',
                      value: 'example@example.com',
                    ),
                    SizedBox(height: 28.0),
                    ProfileInfoRow(
                      icon: Icons.phone,
                      label: 'Telephone',
                      value: '+1234567890',
                    ),
                    SizedBox(height: 28.0),
                    ProfileInfoRow(
                      icon: Icons.person_outline,
                      label: 'Nom d\'utilisateur',
                      value: 'utilisateur123',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

       
    );
  }
}

class ProfileInfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  ProfileInfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 8.0),
          Text(
            label,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 8.0),
          Text(
            value,
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}

class EditAccountDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Modifier le compte'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Nom'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Prénom'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Nom d\'utilisateur'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Modifier'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Annuler'),
        ),
      ],
    );
  }
}
