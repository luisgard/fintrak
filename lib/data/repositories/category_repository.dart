import 'package:dio/dio.dart';
import '../models/category.dart';
import '../../core/constants/api_constants.dart';

class CategoryRepository {
  final Dio _dio = Dio();

  Future<List<Category>> getAll() async {
    try {
      final response = await _dio.get(ApiConstants.categories);
      final List data = response.data;
      return data.map((json) => Category.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Error fetching categories: $e');
    }
  }

  Future<Category> create(Category category) async {
    try {
      final response = await _dio.post(
        ApiConstants.categories,
        data: category.toJson(),
      );
      return Category.fromJson(response.data);
    } catch (e) {
      throw Exception('Error creating category: $e');
    }
  }

  Future<Category> update(String id, Category category) async {
    try {
      final response = await _dio.put(
        '${ApiConstants.categories}/$id',
        data: category.toJson(),
      );
      return Category.fromJson(response.data);
    } catch (e) {
      throw Exception('Error updating category: $e');
    }
  }

  Future<void> delete(String id) async {
    try {
      await _dio.delete('${ApiConstants.categories}/$id');
    } catch (e) {
      throw Exception('Error deleting category: $e');
    }
  }
}
