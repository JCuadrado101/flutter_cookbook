import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

import 'lib/pizza.dart';

class HttpHelper {
  final String authority = 'wo0r3.mocklab.io';
  final String path = '/pizza';

  Future<List<Pizza>> getPizzas() async {
    Uri uri =  Uri.https(authority, path);
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return (json as List).map((e) => Pizza.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load pizzas');
    }
  }
}