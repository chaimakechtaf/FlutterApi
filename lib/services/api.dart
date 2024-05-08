import 'package:http/http.dart' as http;
import 'dart:convert';

class API {
  static const String baseUrl = 'http://10.0.2.2:8000/api/';

  static Future<List<dynamic>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }

  static Future<Map<String, dynamic>> fetchUserData(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/users/data'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load user data');
    }
  }

  static Future<void> registerUser(Map<String, dynamic> userData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users'),
      body: json.encode(userData),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      print('Utilisateur enregistré avec succès');
    } else {
      print('Erreur lors de l\'enregistrement de l\'utilisateur');
    }
  }
}
