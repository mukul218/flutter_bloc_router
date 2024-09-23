import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // Generic method to fetch data from an API and map it to a Dart model.
  Future<Object?> postData<T>({
    required String url,
    required Map<String, dynamic> body,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        body: body,
      );

      debugPrint("API URL: $url ---");
      debugPrint("Request Body: ${jsonEncode(body)} ---");
      debugPrint("Response Code: ${response.statusCode} ---");

      if (response.statusCode == 200) {
        debugPrint("Response Body: ${response.body} ---");
        if (response.body.contains("<br />")) {
          return {
            'status' : false,
            'error_code': '412',
            'message': 'Error while fetching data'
          };
        } else {
          // Parse the response body as a JSON map
          return fromJson(jsonDecode(response.body) as Map<String, dynamic>);
        }
      } else {
        debugPrint("Response Error Code: ${response.statusCode} ---");
        return {
          'status' : false,
          'error_code': response.statusCode.toString(),
          'message': 'Error while fetching data'
        };
      }
    } catch (e) {
      debugPrint("Error: $e");
      return 'Error occurred';
    }
  }
}
