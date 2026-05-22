import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String baseUrl = dotenv.env['API_URL'] ?? '';
  static String get categories => '$baseUrl/Categories';
  static String get transactions => '$baseUrl/Transactions';
}
