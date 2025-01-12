import 'package:flutter/material.dart';
import 'package:mrt_project/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  final String uri =
      'http://localhost:8080'; // Replace <yourip> with the actual IP address

  Future<void> signUpUser({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
        id: '',
        password: password,
        address: '',
        type: '',
        token: '',
        name: name,
      );

      final response = await http.post(
        Uri.parse('$uri/api/signup'), // Adjust endpoint as per your backend
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        // Handle successful signup
        print('User signed up successfully: ${response.body}');
      } else {
        // Handle server errors
        print('Error: ${response.body}');
        throw Exception('Failed to sign up user');
      }
    } catch (e) {
      print('Error signing up user: $e');
      throw e;
    }
  }
}
