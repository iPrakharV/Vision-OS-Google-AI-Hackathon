import 'dart:convert';
import 'package:http/http.dart' as http;

class GeminiApi {
  final String baseUrl = 'https://api.gemini.com';

  Future<dynamic> getGameUpdates() async {
    try {
      var response = await http.get(Uri.parse('$baseUrl/game/updates'));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        // Handle server errors
        print('Server error: ${response.body}');
      }
    } catch (e) {
      // Handle network errors
      print('Network error: $e');
    }
  }
}
