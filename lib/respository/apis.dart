// ignore_for_file: avoid_print
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Apis {
  final String _baseUrl = 'http://api.themoviedb.org/3/movie';

  static const Map<String, String> headers = {
    "content-type": "application/json",
    "authorization":
        "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2OGNiYTQ3NjcyNTVlZDVmYzYxZmQyN2QyMDQ0N2IxMiIsInN1YiI6IjYyOTQzMzA1YTI3NTAyMDA5YWQ2MzdmOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.DOog8vAwX8cM-hnMUTjpSp86G5s2qwlLJTK6zC0p3kM",
  };

  Future<Response> getRequest(url) async {
    try {
      final response =
          await http.get(Uri.parse(_baseUrl + url), headers: headers);

      if (response.statusCode == 401) {
        throw ('Authentication');
      }
      if (response.statusCode == 404) {
        throw ('API not fond');
      }
      if (response.statusCode == 500) {
        throw ('Server err');
      }

      return response;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<Response> postRequest(url, body) async {
    try {
      final response = await http.post(Uri.parse(_baseUrl + url),
          headers: headers, body: body);

      if (response.statusCode == 401) {
        throw ('Authentication');
      }
      if (response.statusCode == 404) {
        throw ('API not fond');
      }
      if (response.statusCode == 500) {
        throw ('Server err');
      }

      return response;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<Response> putRequest(url, body) async {
    try {
      final response = await http.put(Uri.parse(_baseUrl + url),
          headers: headers, body: body);

      if (response.statusCode == 401) {
        throw ('Authentication');
      }
      if (response.statusCode == 404) {
        throw ('API not fond');
      }
      if (response.statusCode == 500) {
        throw ('Server err');
      }

      return response;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<Response> deleteRequest(url, body) async {
    try {
      final response = await http.delete(Uri.parse(_baseUrl + url),
          headers: headers, body: body);

      if (response.statusCode == 401) {
        throw ('Authentication');
      }
      if (response.statusCode == 404) {
        throw ('API not fond');
      }
      if (response.statusCode == 500) {
        throw ('Server err');
      }

      return response;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
