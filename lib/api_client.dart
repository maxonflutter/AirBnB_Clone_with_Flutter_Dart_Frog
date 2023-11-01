import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class PropertyApiClient {
  PropertyApiClient({
    http.Client? httpClient,
  }) : this._(
          baseUrl: 'https://property-api-url.com',
          httpClient: httpClient,
        );

  PropertyApiClient._({
    required String baseUrl,
    http.Client? httpClient,
  })  : _baseUrl = baseUrl,
        _httpClient = httpClient ?? http.Client();

  final String _baseUrl;
  final http.Client _httpClient;

  Future<Map<String, dynamic>> getProperties() {
    final uri = Uri.parse('$_baseUrl/properties');
    return _handleRequest(
      (headers) => _httpClient.get(uri, headers: headers),
    );
  }

  Future<Map<String, dynamic>> createProperty({required Map<String, dynamic> propertyData}) {
    final uri = Uri.parse('$_baseUrl/properties');
    return _handleRequest(
      (headers) => _httpClient.post(uri, headers: headers, body: jsonEncode(propertyData)),
    );
  }

  Future<Map<String, dynamic>> updateProperty({required String id, required Map<String, dynamic> propertyData}) {
    final uri = Uri.parse('$_baseUrl/properties/$id');
    return _handleRequest(
      (headers) => _httpClient.put(uri, headers: headers, body: jsonEncode(propertyData)),
    );
  }

  Future<void> deleteProperty({required String id}) {
    final uri = Uri.parse('$_baseUrl/properties/$id');
    return _handleRequest(
      (headers) => _httpClient.delete(uri, headers: headers),
    );
  }

  Future<Map<String, dynamic>> getPropertyBookings({required String id}) {
    final uri = Uri.parse('$_baseUrl/properties/$id/bookings');
    return _handleRequest(
      (headers) => _httpClient.get(uri, headers: headers),
    );
  }

  Future<Map<String, dynamic>> createBooking({required String id, required Map<String, dynamic> bookingData}) {
    final uri = Uri.parse('$_baseUrl/properties/$id/bookings');
    return _handleRequest(
      (headers) => _httpClient.post(uri, headers: headers, body: jsonEncode(bookingData)),
    );
  }

  Future<void> deleteBooking({required String id}) {
    final uri = Uri.parse('$_baseUrl/bookings/$id');
    return _handleRequest(
      (headers) => _httpClient.delete(uri, headers: headers),
    );
  }

  Future<Map<String, dynamic>> _handleRequest(
    Future<http.Response> Function(Map<String, String>) request,
  ) async {
    try {
      final headers = await _getRequestHeaders();
      final response = await request(headers);
      final body = jsonDecode(response.body);

      if (response.statusCode != HttpStatus.ok) {
        throw Exception('${response.statusCode}, error: ${body['message']}');
      }

      return body;
    } on TimeoutException {
      throw Exception('Request timeout. Please try again');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<Map<String, String>> _getRequestHeaders() async {
    return <String, String>{
      HttpHeaders.contentTypeHeader: ContentType.json.value,
      HttpHeaders.acceptHeader: ContentType.json.value,
    };
  }
}