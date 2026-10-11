import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static const String baseUrl = 'http://10.0.2.2:8000/api'; // Emulator Android
  // static const String baseUrl = 'http://localhost:8000/api'; // Untuk Chrome / Desktop
  // static const String baseUrl = 'http://{IP Address}:8000/api'; // Untuk Hp Asli

  static const Duration timeout = Duration(seconds: 30);

  // GET REQUEST
  static Future<dynamic> get(String endpoint) async {
    try {
      final url = Uri.parse('$baseUrl$endpoint');

      print('get: $url');

      final response = await http
          .get(
            url,
            headers: {
              'Content_type': 'application/json',
              'Accept': 'application/json',
            },
          )
          .timeout(const Duration(seconds: 20));

      debugPrint('📊 Status: ${response.statusCode}');

      return _handleResponse(response);
    } catch (e) {
      throw Exception('Get Error: $e');
    }
  }

  // POST REQUEST
  static Future<dynamic> post(
    String endpoint, {
    Map<String, dynamic>? data,
  }) async {
    try {
      final url = Uri.parse('$baseUrl$endpoint');

      print('🟢 POST: $url');
      print('📦 Data: $data');

      final response = await http
          .post(
            url,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
            body: data != null ? jsonEncode(data) : null,
          )
          .timeout(const Duration(seconds: 20));

      print('📊 Status: ${response.statusCode}');
      print('📦 Response: ${response.body}');

      return _handleResponse(response);
    } catch (e) {
      throw Exception('POST Error: $e');
    }
  }

  // HANDLE RESPONSE
  static dynamic _handleResponse(http.Response response) {
    final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonResponse;
    } else {
      String errorMassage = 'Terjadi Kesalahan';

      if (jsonResponse.containsKey('massage')) {
        errorMassage = jsonResponse['massage'];
      }

      if (jsonResponse.containsKey('errors')) {
        final errors = jsonResponse['errors'] as Map<String, dynamic>;
        final firstError = errors.values.first;
        if (firstError is List && firstError.isNotEmpty) {
          errorMassage = firstError.first;
        }
        throw Exception(errorMassage);
      }
    }
  }
}
