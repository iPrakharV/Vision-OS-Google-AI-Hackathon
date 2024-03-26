import 'package:http/http.dart' as http;

void main() {
  // Make a GET request to the Epic Games server
  http
      .get(Uri.parse('https://api.epicgames.com/8973645987649587623800854587634957862395762938456798234765348t'))
      .then((response) {
    if (response.statusCode == 200) {
      // Successful response
      print('Integration with Epic Games server successful!');
      // Process the response data here
    } else {
      // Error response
      print(
          'Integration with Epic Games server failed: ${response.statusCode}');
    }
  }).catchError((error) {
    // Error occurred during the request
    print('Integration with Epic Games server failed: $error');
  });
}
