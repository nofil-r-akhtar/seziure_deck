import 'dart:io';

import 'package:flutter/cupertino.dart';
// import 'package:http/io_client.dart';
import 'package:http/http.dart' as http;

Future<void> addUserToDatabase(
    TextEditingController name,
    TextEditingController password,
    DateTime selectedDate,
    TextEditingController email,
    TextEditingController location) async {
  const url =
      'https://seizuredeck.000webhostapp.com/create.php'; // Replace with your server URL

  

  final response = await http.post(
    Uri.parse(url),
    body: { 
      'name': name.text,
      'email': email.text,
      'password': password.text,
      'dob': "${selectedDate.toLocal()}".split(' ')[0], // Format the date
      'location': location.text,
    },
  );

  if (response.statusCode == 200) {
    print(response.body);
    print("User added successfully!");
  } else {
    print("Failed to add user. Status code: ${response.statusCode}");
  }
}
