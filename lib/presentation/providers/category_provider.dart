import 'package:flutter/material.dart';
import '../../data/models/category.dart';
import '../../data/repositories/category_repository.dart';

class CategoryProvider extends ChangeNotifier {
  final CategoryRepository _repository = CategoryRepository();

  List<Category> _categories = [];
  bool _isLoading = false;
  String? _error;

  // Getters — como propiedades en C#
  List<Category> get categories => _categories;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadCategories() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _categories = await _repository.getAll();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> createCategory(Category category) async {
    try {
      await _repository.create(category);
      await loadCategories();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  Future<void> deleteCategory(String id) async {
    try {
      await _repository.delete(id);
      await loadCategories();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }
}
